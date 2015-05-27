// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.GlobalActorEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_540;

    public class GlobalActorEvent extends BaseEvent 
    {

        public static const ON_AUTO_ACT_BREAK:String = "onAutoActBreak";
        public static const ON_AUTO_ACT_END:String = "onAutoActEnd";

        public function GlobalActorEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_540()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_540 = " GlobalActorEvent" (String#16391)


