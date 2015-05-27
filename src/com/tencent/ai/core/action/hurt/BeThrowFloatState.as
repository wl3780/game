// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.BeThrowFloatState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.data.arg.script.ThrowArg;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.combat.impl.AttackDelegate;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.data.SkillInfo;
    import  ©init._SafeStr_5;

    public class BeThrowFloatState extends FloatState implements IFrameListener 
    {

        protected var m_scene:ICombatScene;
        protected var m_throwArg:ThrowArg;
        protected var m_attackInfo:AttackInfo;
        protected var m_attackDelegate:AttackDelegate;
        protected var m_dmgValue:int;
        protected var m_attackRect:RectArea;

        public function BeThrowFloatState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
            this.m_attackDelegate = new AttackDelegate();
            this.m_attackRect = new RectArea();
            this.m_dmgValue = 0;
        }

        protected function startThrow():void
        {
            if (((!((this.m_throwArg == null))) && (this.m_throwArg.deliver))){
                this.m_scene = ICombatScene(m_action.scene);
                this.m_attackDelegate.bindScene(this.m_scene);
                this.m_attackDelegate.bindTarget(this.m_throwArg.bindAttackActor, this.m_throwArg.bindModel);
                this.m_attackDelegate.setSkillInfo(this.m_throwArg.bindSkill);
                m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
            };
        }

        protected function stopThrow(_arg_1:Boolean=false):void
        {
            var _local_2:Boolean;
            var _local_3:AttackInfo;
            var _local_4:SkillInfo;
            if (this.m_throwArg != null){
                if (this.m_throwArg.deliver){
                    m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                };
                this.m_attackDelegate.inactive();
                this.m_attackDelegate.unbind();
                _local_2 = this.m_throwArg.useLandDmg;
                _local_3 = this.m_attackInfo;
                this.m_throwArg = null;
                this.m_attackInfo = null;
                if (_local_2){
                    _local_4 = _local_3.skillInfo;
                    _local_3.hurtType = _local_4.hurtType;
                    _local_3.dmgValue = this.m_dmgValue;
                    _local_3.hitPoint = m_target.getMapPosition();
                    m_target.acceptDmg(_local_3);
                };
                this.m_scene = null;
            };
        }

        override protected function onBeatDownEnd():void
        {
            this.stopThrow(true);
            super.onBeatDownEnd();
        }

        public function onFrameEvent(_arg_1:String):void
        {
            var _local_3:RectArea;
            var _local_2:Array = m_target.getHurtRects();
            if (((!((_local_2 == null))) && ((_local_2.length > 0)))){
                _local_3 = _local_2[0];
                this.m_attackRect.x = (m_target.mapX + _local_3.x);
                this.m_attackRect.y = (m_target.mapY - _local_3.y);
                this.m_attackRect.dz = (_local_3.dz + 10);
                this.m_attackRect.width = _local_3.width;
                this.m_attackRect.height = _local_3.height;
                this.m_attackDelegate.collisionNow(this.m_throwArg.bindGoupID, this.m_attackRect, m_target);
            };
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            super.accept(_arg_1);
            this.m_throwArg = (_arg_1.scriptArg as ThrowArg);
            this.m_attackInfo = _arg_1;
            this.m_dmgValue = this.m_attackInfo.dmgValue;
            this.startThrow();
            return (HurtState.NULL);
        }

        override public function end():void
        {
            this.stopThrow();
            super.end();
        }

        public /*  ©init. */ function _SafeStr_5()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_5 = " BeThrowFloatState" (String#14444)


