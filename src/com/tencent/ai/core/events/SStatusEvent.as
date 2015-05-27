// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.SStatusEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_559;

    public class SStatusEvent extends BaseEvent 
    {

        public static const ON_SSTATUS_END:String = "onSStatusEnd";
        public static const ON_SSTATUS_EVENT_END:String = "onSStatusEventEnd";

        public function SStatusEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_559()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_559 = " SStatusEvent" (String#16643)


