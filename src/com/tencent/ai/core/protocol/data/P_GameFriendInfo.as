// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_GameFriendInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import com.tencent.ai.core.enum.CareerTypeDef;
    import  ©init._SafeStr_885;

    public class P_GameFriendInfo implements ISerialize 
    {

        public var playerID:PlayerID;
        public var player_nick:String = "";
        public var status:int;
        public var pve_level:int;
        public var zone_id:int;
        public var career_id:uint;
        public var sublime:Boolean;
        public var last_active_time:uint;
        public var room_id:uint;
        public var room_name:String;
        public var vipInfo:VipSimpleInfo;
        public var career_lvl:uint;
        public var avatar_weapon:uint;
        public var lastLoginTime:uint;
        public var avatar_back:uint;
        public var avatar_fashion:uint;
        public var avatar_cannon:uint;
        public var pk_state:uint;
        public var pkLevel:int;
        public var pkRound:int;
        public var pkWinRound:int;
        public var empty_data:uint;
        public var visitedInfo:uint;
        public var hasJoin:Boolean;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.player_nick = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.status = _arg_1.readUnsignedByte();
            this.pve_level = _arg_1.readUnsignedShort();
            this.zone_id = _arg_1.readUnsignedInt();
            this.career_id = _arg_1.readUnsignedInt();
            this.sublime = _arg_1.readBoolean();
            this.last_active_time = _arg_1.readUnsignedInt();
            this.room_id = _arg_1.readUnsignedInt();
            this.room_name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.vipInfo = new VipSimpleInfo();
            this.vipInfo.read(_arg_1);
            this.career_lvl = _arg_1.readUnsignedByte();
            this.avatar_weapon = _arg_1.readUnsignedInt();
            this.lastLoginTime = _arg_1.readUnsignedInt();
            this.avatar_back = _arg_1.readUnsignedInt();
            this.avatar_fashion = _arg_1.readUnsignedInt();
            this.avatar_cannon = _arg_1.readUnsignedInt();
            this.pk_state = _arg_1.readUnsignedByte();
            this.pkLevel = _arg_1.readUnsignedShort();
            this.pkRound = _arg_1.readUnsignedInt();
            this.pkWinRound = _arg_1.readUnsignedInt();
            this.empty_data = _arg_1.readUnsignedInt();
            this.hasJoin = ((1 - _arg_1.readUnsignedByte()) == 1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function getCareerType():int
        {
            if (this.sublime){
                return (CareerTypeDef.JOIN_TEAM);
            };
            if (int((this.career_id % 100))){
                return (CareerTypeDef.JOIN_TEAM);
            };
            if (this.hasJoin){
                return (CareerTypeDef.JOIN_TEAM);
            };
            return (CareerTypeDef.NONE);
        }

        public /*  ©init. */ function _SafeStr_885()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_885 = " P_GameFriendInfo" (String#16664)


