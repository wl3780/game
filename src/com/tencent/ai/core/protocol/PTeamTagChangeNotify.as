// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamTagChangeNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.TeamTagInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1047;

    public class PTeamTagChangeNotify implements ISerialize 
    {

        public static const RSP:int = 524540;

        public var playerID:PlayerID;
        public var teamTagInfo:TeamTagInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.teamTagInfo = new TeamTagInfo();
            this.teamTagInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1047()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1047 = " PTeamTagChangeNotify" (String#15830)


