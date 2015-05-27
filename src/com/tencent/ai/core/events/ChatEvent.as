// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ChatEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_530;

    public class ChatEvent extends Event 
    {

        public static var CHATMSGWORDS:String = "ChatMsg";

        public var msg:String;
        public var playername:String;

        public function ChatEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_530()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_530 = " ChatEvent" (String#16292)


