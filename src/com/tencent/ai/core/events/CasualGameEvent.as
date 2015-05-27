// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.CasualGameEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_529;

    public class CasualGameEvent extends Event 
    {

        public static const INIT:String = "init";
        public static const SEND_TO_CG:String = "sendToCg";
        public static const CALL_FORM_CG:String = "callFormCg";

        public var cgID:int;
        public var args:Array;

        public function CasualGameEvent(_arg_1:String, _arg_2:int, _arg_3:Array=null)
        {
            super(_arg_1);
            this.cgID = _arg_2;
            this.args = _arg_3;
        }

        public /*  ©init. */ function _SafeStr_529()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_529 = " CasualGameEvent" (String#17669)


