// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.FriendEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_537;

    public class FriendEvent extends Event 
    {

        public static const RECEIVE_MESSAGE:String = "receiveMessage";
        public static const RECEIVE_CHAT_MESSAGE:String = "receiveChatMessage";
        public static const NOTIFY_CHAT_MESSAGE:String = "notifyChatMessage";
        public static const NEW_FRIEND:String = "newFriend";
        public static const HANDLE_COMPLETE:String = "handleComplete";

        public function FriendEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_537()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_537 = " FriendEvent" (String#16094)


