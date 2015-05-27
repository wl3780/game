// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.TeamEvent

package com.tencent.ai.core.events
{
    import com.tencent.ai.core.data.TeamMemberInfo;
    import com.tencent.ai.core.data.PlayerID;
    import  ©init._SafeStr_561;

    public class TeamEvent extends BaseEvent 
    {

        public static const CREATE_TEAM:String = "createTeam";
        public static const ERROR_CREATE_TEAM:String = "errorCreateTeam";
        public static const CHANGE_TEAM_INFO:String = "changeTeamInfo";
        public static const CLICK_AVATAR_BAR:String = "clickAvatarBar";
        public static const USE_REBIRTH:String = "useRebirth";
        public static const QUIT_TEAM:String = "quitTeam";

        public var isQuitTeamSucceed:Boolean;
        public var teamMemberInfo:TeamMemberInfo;
        public var index:int;
        public var playerID:PlayerID;

        public function TeamEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_561()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_561 = " TeamEvent" (String#14918)


