// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.SpecialDupCountEndTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import  ©init._SafeStr_1345;

    public class SpecialDupCountEndTriggerEvent extends BaseTriggerEvent 
    {


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
        }

        override public function activate():void
        {
            super.activate();
            AICore.Runtime.addEventListener(DupSpecialEvent.DUP_COUNT_DOWN_END, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.Runtime.removeEventListener(DupSpecialEvent.DUP_COUNT_DOWN_END, this.onEvent);
        }

        private function onEvent(_arg_1:DupSpecialEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1345()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1345 = " SpecialDupCountEndTriggerEvent" (String#15686)


