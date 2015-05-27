// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.HurtState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_12;

    public class HurtState 
    {

        public static const SIZE:int = 6;
        public static const NULL:int = 0;
        public static const NORMAL:int = 1;
        public static const STIFF:int = 2;
        public static const FLOAT:int = 3;
        public static const LIE:int = 4;
        public static const GETUP:int = 5;

        protected var m_action:IAcceptHurtAction;
        protected var m_view:IActorView;
        protected var m_environmentInfo:EnvironmentInfo;
        protected var m_target:BaseActor;
        protected var m_model:ActorModel;

        public function HurtState(_arg_1:IAcceptHurtAction)
        {
            this.m_action = _arg_1;
        }

        protected function initParams():void
        {
            this.m_environmentInfo = this.m_action.environmentInfo;
            if (this.m_view == null){
                this.m_view = IActorView(this.m_action.view);
                this.m_target = BaseActor(this.m_action.target);
                this.m_model = this.m_action.model;
            };
        }

        protected function setFreezTimes(_arg_1:SkillInfo):void
        {
            if (_arg_1 == null){
                return;
            };
            var _local_2:int = _arg_1.freezTimes;
            if (_local_2 != 0){
                this.m_action.target.freeze(_local_2);
            };
        }

        public function accept(_arg_1:AttackInfo):int
        {
            this.initParams();
            return (NULL);
        }

        public function end():void
        {
            this.m_environmentInfo = null;
        }

        public /*  ©init. */ function _SafeStr_12()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_12 = " HurtState" (String#13676)


