// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TeamMemberInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_347;

    public class TeamMemberInfo implements ISerialize 
    {

        public static const LEADER:int = 1;
        public static const MEMBER:int = 0;

        public var playerID:PlayerID;
        public var nickname:String;
        public var careerID:uint;
        public var sublime:Boolean;
        public var level:uint;
        public var flags:uint;
        public var status:uint;
        public var subStatus:uint;
        public var team_pvp_match_state:int;
        public var vipInfo:VipSimpleInfo;
        public var pkLevel:int;
        public var familyInfo:FamilyInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.nickname = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.careerID = _arg_1.readUnsignedInt();
            this.sublime = _arg_1.readBoolean();
            this.level = _arg_1.readUnsignedShort();
            this.flags = _arg_1.readUnsignedShort();
            this.status = _arg_1.readUnsignedShort();
            this.subStatus = _arg_1.readUnsignedShort();
            this.team_pvp_match_state = _arg_1.readUnsignedShort();
            this.vipInfo = new VipSimpleInfo();
            this.vipInfo.read(_arg_1);
            this.pkLevel = _arg_1.readUnsignedShort();
            this.familyInfo = new FamilyInfo();
            this.familyInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function get isLeader():Boolean
        {
            return ((this.flags == LEADER));
        }

        public /*  ©init. */ function _SafeStr_347()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_347 = " TeamMemberInfo" (String#14324)


