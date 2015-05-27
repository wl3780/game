// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.PvpManagerEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import com.tencent.ai.core.protocol.PPvpEnterFight;
    import  ©init._SafeStr_556;

    public class PvpManagerEvent extends Event 
    {

        public static const ENTER_FIGHT:String = "enterFight";
        public static const MATCH_RESPONSE:String = "matchResponse";
        public static const INVITE_SUCCESS:String = "inviteSuccess";
        public static const REQUEST_SUCCESS:String = "requestSuccess";
        public static const FRIEND_PK_MEMBER_CHANGE:String = "friendPkMemberChange";
        public static const FRIEND_PK_KICK_MAIN:String = "friendPkKickMain";
        public static const FRIEND_PK_KICK_OTHER:String = "friendPkKickOther";
        public static const FRIEND_PK_BREAK:String = "friendPkBreak";
        public static const FRIEND_PK_REMOVE_PLAYER:String = "friendPkRemovePlayer";
        public static const FRIEND_PK_REROOM:String = "friendPkReroom";

        public var enterFightData:PPvpEnterFight;
        public var exitMatch:Boolean;
        public var matchMode:int;
        public var friendPkMemberData:Object;

        public function PvpManagerEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_556()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_556 = " PvpManagerEvent" (String#17363)


