package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.render.IFrameListener;

    public class GetUpState extends HurtState implements IFrameListener 
    {

        protected var m_getUpEvent:ActorModelEvent;
        protected var m_isGettingUP:Boolean;

        public function GetUpState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
            this.m_getUpEvent = new ActorModelEvent(ActorModelEvent.ON_ACTIONSTATE_GET_UP);
        }

        public function onFrameEvent(_arg_1:String):void
        {
            if (_arg_1 == MotionDef.L_FRAME_END){
                m_action.nextAction();
                m_target.getModel().dispatchEvent(this.m_getUpEvent);
            };
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            if (!this.m_isGettingUP){
                initParams();
                m_view.addFrameListener(MotionDef.L_FRAME_END, this);
                m_view.gotoAndPlay(2);
                this.m_isGettingUP = true;
            };
            return (HurtState.NULL);
        }

        override public function end():void
        {
            this.m_isGettingUP = false;
            m_view.removeFrameListener(MotionDef.L_FRAME_END, this);
            super.end();
        }

        public /*  ©init. */ function _SafeStr_11()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_11 = " GetUpState" (String#15452)


