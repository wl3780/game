// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.events.CommandEvent

package com.tencent.free.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_5;

    public class CommandEvent extends Event 
    {

        public static var COMMAND_FINISHED:String = "commandFinished";
        public static var COMMAND_CANCELED:String = "commandCanceled";

        public function CommandEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_5()
        {
        }


    }
}//package com.tencent.free.core.events

// _SafeStr_5 = " CommandEvent" (String#1460)


