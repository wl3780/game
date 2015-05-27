// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.DupEndTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import  ©init._SafeStr_1321;

    public class DupEndTriggerEvent extends BaseTriggerEvent 
    {


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
        }

        override public function activate():void
        {
            super.activate();
            AICore.Runtime.addEventListener(DupSpecialEvent.DUP_END_EVENT, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.Runtime.removeEventListener(DupSpecialEvent.DUP_END_EVENT, this.onEvent);
        }

        private function onEvent(_arg_1:DupSpecialEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1321()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1321 = " DupEndTriggerEvent" (String#15881)


