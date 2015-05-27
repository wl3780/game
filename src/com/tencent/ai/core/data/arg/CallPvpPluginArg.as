// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallPvpPluginArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_189;

    public class CallPvpPluginArg implements IXMLSerialize 
    {

        public static const OPEN_MATCH_PANEL:String = "openMatchPanel";
        public static const CLOSE_MATCH_PANEL:String = "closeMatchPanel";
        public static const OPEN_VS_PANEL:String = "openVsPanel";
        public static const JOIN_FRIEND_PK:String = "joinFriendPk";
        public static const FRIEND_RANK:String = "friendRank";
        public static const WORLD_RANK:String = "worldRank";
        public static const JOIN_TEAM_MATCH:String = "joinTeamMatch";
        public static const OPEN_TRAIN_PANEL:String = "openTrainPanel";
        public static const OPEN_QUICK_PANEL:String = "openQuickPanel";

        public var callType:String;
        public var matchMode:int;
        public var roomName:String;


        public function decode(_arg_1:XML):void
        {
            this.callType = _arg_1.@callType;
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@callType = this.callType;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_189()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_189 = " CallPvpPluginArg" (String#17513)


