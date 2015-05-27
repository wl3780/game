// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallFriendPluginArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.data.PlayerID;
    import  ©init._SafeStr_180;

    public class CallFriendPluginArg 
    {

        public static const NEW_NOTIFY:String = "newNotify";
        public static const OPEN_CHAT:String = "openChat";
        public static const OPEN_ADD_FRIEND:String = "openAddFriend";
        public static const OPEN_FRIEND_PANEL:String = "openFriendPanel";
        public static const DELETE_GAME_FRIEND:String = "deleteGameFriend";
        public static const REMOVE_FROM_BLACK_LIST:String = "removeFormBlackList";
        public static const ADD_TO_BLACK_LIST:String = "addToBlackList";

        public var mode:String;
        public var playerID:PlayerID;
        public var uin:uint;
        public var roleStatus:int;
        public var nickname:String;
        public var level:int;
        public var careerID:int;


        public /*  ©init. */ function _SafeStr_180()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_180 = " CallFriendPluginArg" (String#14360)


