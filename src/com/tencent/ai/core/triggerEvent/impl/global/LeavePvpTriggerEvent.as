// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.LeavePvpTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import  ©init._SafeStr_1337;

    public class LeavePvpTriggerEvent extends BaseTriggerEvent 
    {


        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ON_LEAVE_PVP, this.onSceneChange);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_LEAVE_PVP, this.onSceneChange);
        }

        private function onSceneChange(_arg_1:AIEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1337()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1337 = " LeavePvpTriggerEvent" (String#13916)


