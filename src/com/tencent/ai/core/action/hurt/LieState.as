// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.LieState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.CommonValueDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_13;

    public class LieState extends HurtState implements IFrameListener 
    {

        private static var _SSM:ISpecialStatusManager;

        protected var m_layDownEvent:ActorModelEvent;
        protected var m_isLie:Boolean = false;
        protected var m_lieTimes:int = 0;

        public function LieState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
            this.m_layDownEvent = new ActorModelEvent(ActorModelEvent.ON_ACTIONSTATE_LAY_DOWN);
        }

        protected function onMaxLieTimeChange(_arg_1:ActorModelEvent):void
        {
            var _local_2:int = m_model.maxLieTime;
            if (_local_2 < this.m_lieTimes){
                this.m_lieTimes = _local_2;
            };
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            var _local_5:SkillInfo;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_2:int = HurtState.NULL;
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 != null){
                if (((this.m_isLie) && (m_model.openProtected))){
                    _local_6 = _arg_1.dmgValue;
                    m_model.updateFloatProtected(_local_6);
                    m_model.updateLandProtected(_local_6);
                };
                _local_5 = _arg_1.skillInfo;
                _local_3 = _local_5.powerY;
                if (_local_3 > 0){
                    _local_3 = ((_local_3 + int((_local_5.randomDY * DEFINE.RANDOM_FLOAT()))) * DEFINE.RANDOM_REBOUND_Q());
                };
            };
            if (_local_3 != 0){
                if (m_model == null){
                    m_model = m_action.model;
                };
                _local_4 = ((_local_3 * m_model.beHurtFloat) - (m_model.weight * DEFINE.G_WQY));
            };
            if (_local_4 > 0){
                _local_2 = HurtState.FLOAT;
            } else {
                if (!this.m_isLie){
                    initParams();
                    this.m_isLie = true;
                    this.m_lieTimes = (((m_model.canLieDown == 1)) ? m_model.maxLieTime : 1);
                    if (m_model.landProtected){
                        this.m_lieTimes = 1;
                        _local_7 = CommonValueDef.SS_ID_LAND_PROTECTED;
                        if (_local_7 != 0){
                            if (_SSM == null){
                                _SSM = AICore.combatSystem.getSpecialStatusManager();
                            };
                            _SSM.applyStatus(m_target, _local_7);
                        };
                    };
                    if (this.m_lieTimes > 0){
                        m_model.addEventListener(ActorModelEvent.ON_MAXLIETIME_CHANGE, this.onMaxLieTimeChange);
                        m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
                    };
                    m_view.setMotionID(MotionDef.MT_LIE_GOT_UP);
                    m_target.getModel().dispatchEvent(this.m_layDownEvent);
                } else {
                    m_view.gotoAndPlay(0);
                };
                if (_arg_1 != null){
                    _local_8 = _arg_1.dir;
                    _local_9 = _local_5.powerX;
                    _local_10 = (((_local_9 * m_model.beHurtBack) - (m_model.weight * DEFINE.G_WQX)) * DEFINE.G_LIE_VX_Q);
                    if (_local_10 > 0){
                        _local_11 = ((_local_10 * _local_8) * -1);
                        _local_12 = (m_environmentInfo.friction * _local_8);
                        m_target.slip(PosArg.DIR_X, _local_11, _local_12);
                    };
                    setFreezTimes(_local_5);
                };
            };
            return (_local_2);
        }

        override public function end():void
        {
            if (this.m_isLie){
                this.m_isLie = false;
            };
            m_action.acceptVKeyFunction = null;
            if (this.m_lieTimes != 0){
                this.m_lieTimes = 0;
                m_model.removeEventListener(ActorModelEvent.ON_MAXLIETIME_CHANGE, this.onMaxLieTimeChange);
                m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
            };
            super.end();
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_lieTimes--;
            if (this.m_lieTimes <= 0){
                this.m_lieTimes = 0;
                m_action.acceptVKeyFunction = null;
                m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                m_model.removeEventListener(ActorModelEvent.ON_MAXLIETIME_CHANGE, this.onMaxLieTimeChange);
                m_model.clearFloatFlag();
                this.m_isLie = false;
                if (m_model.canLieDown == 1){
                    m_action.onNextState(HurtState.GETUP, null);
                } else {
                    m_action.nextAction();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_13()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_13 = " LieState" (String#16406)


