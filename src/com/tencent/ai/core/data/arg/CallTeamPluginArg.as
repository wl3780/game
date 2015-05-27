// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallTeamPluginArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.TeamCreateInfo;
    import  ©init._SafeStr_191;

    public class CallTeamPluginArg 
    {

        public static const INVITE_TEAM:String = "inviteTeam";
        public static const JOIN_TEAM:String = "joinTeam";
        public static const SHOW_NORMAL_MENU:String = "showNormalMenu";
        public static const OPEN_TEAM_INFO_PANEL:String = "openTeamInfoPanel";
        public static const OPEN_TEAM_CREATE_PANEL:String = "openTeamCreatePanel";
        public static const BREAK_TEAM:String = "breakTeam";
        public static const OPEN_TEAM_LIST_PANEL:String = "openTeamListPanel";
        public static const CREATE_TEAM:String = "createTeam";

        public var type:String;
        public var playerID:PlayerID;
        public var teamID:int;
        public var teamCreateInfo:TeamCreateInfo;
        public var isEdit:Boolean;
        public var canModify:Boolean = true;
        public var autoCreate:Boolean = false;


        public /*  ©init. */ function _SafeStr_191()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_191 = " CallTeamPluginArg" (String#16541)


