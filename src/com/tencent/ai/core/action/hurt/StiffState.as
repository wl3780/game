// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.StiffState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.HurtType;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.SkillInfo;
    import  ©init._SafeStr_15;

    public class StiffState extends HurtState implements IFrameListener 
    {

        protected var m_stiffTimes:int = 0;
        protected var m_isStiff:Boolean = false;
        protected var m_shakeArg:ShakeScriptArg;

        public function StiffState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
            this.m_shakeArg = new ShakeScriptArg();
            this.m_shakeArg.shakeDir = 1;
            this.m_shakeArg.shakeR = 2;
        }

        protected function inTheState(_arg_1:AttackInfo, _arg_2:SkillInfo):void
        {
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            m_target.stopJump();
            m_target.stopMove();
            var _local_3:int = m_target.mapY;
            var _local_4:int = _arg_2.powerX;
            var _local_5:int = _arg_1.dir;
            var _local_6:int = _arg_1.hurtType;
            var _local_7:int = _arg_1.attackActorModel.stiff;
            if (!m_target.isAirElement()){
                _local_8 = ((_local_4 * m_model.beHurtBack) - (m_model.weight * DEFINE.G_WQX));
                if (_local_8 > 0){
                    _local_9 = ((_local_8 * _local_5) * -1);
                    _local_10 = (m_environmentInfo.friction * _local_5);
                    m_target.slip(PosArg.DIR_X, _local_9, _local_10);
                };
            };
            this.m_stiffTimes = (((_local_7 * _arg_2.stiff_rate) - m_model.firm) * DEFINE.G_SQ);
            if (this.m_stiffTimes <= 0){
                m_action.nextAction();
            } else {
                m_view.setMotionID(MotionDef.MT_BEHURT);
                _local_11 = 0;
                if (_arg_1.hurtType == HurtType.HURT_THUMP){
                    _local_11 = (((DEFINE.RANDOM_FLOAT() > 0.5)) ? 2 : 3);
                } else {
                    _local_11 = (((DEFINE.RANDOM_FLOAT() > 0.5)) ? 0 : 1);
                };
                if (m_view.getStiffViewType() == 0){
                    m_view.gotoAndStop(_local_11);
                } else {
                    if (_local_11 != 0){
                        m_view.gotoAndPlay(_local_11);
                    };
                };
                m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
            };
            setFreezTimes(_arg_2);
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            var _local_2:int = HurtState.NULL;
            var _local_3:SkillInfo = _arg_1.skillInfo;
            var _local_4:int = (((_local_3)!=null) ? _local_3.powerY : 0);
            if (!this.m_isStiff){
                initParams();
                this.m_isStiff = true;
            };
            if (_local_4 == 0){
                this.inTheState(_arg_1, _local_3);
            } else {
                if (((m_target.isAirElement()) && (!(m_model.beHurtFloat)))){
                    this.inTheState(_arg_1, _local_3);
                } else {
                    _local_2 = HurtState.FLOAT;
                };
            };
            return (_local_2);
        }

        public function onFrameEvent(_arg_1:String):void
        {
            if (_arg_1 == MotionDef.L_ENTER_FRAME){
                this.m_stiffTimes = (this.m_stiffTimes - 1);
                if (this.m_stiffTimes <= 0){
                    m_action.acceptVKeyFunction = null;
                    this.m_stiffTimes = 0;
                    m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                    m_action.nextAction();
                };
            };
        }

        override public function end():void
        {
            if (this.m_stiffTimes != 0){
                m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                this.m_stiffTimes = 0;
            };
            this.m_isStiff = false;
            m_action.acceptVKeyFunction = null;
            super.end();
        }

        public /*  ©init. */ function _SafeStr_15()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_15 = " StiffState" (String#16847)


