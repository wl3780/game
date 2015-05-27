// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneAvatarChgBC

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.protocol.data.P_AvatarShowInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1067;

    public class PZoneAvatarChgBC implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_AVATAR_CHG_BC;//524449

        public var playerID:PlayerID;
        public var equipPos:int;
        public var epuipItem:EquipItemInfo;
        public var walkV:int;
        public var runV:int;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.equipPos = _arg_1.readUnsignedByte();
            var _local_2:P_AvatarShowInfo = new P_AvatarShowInfo();
            _local_2.read(_arg_1);
            if (_local_2.avatarID != 0){
                this.epuipItem = new EquipItemInfo();
                this.epuipItem.id = _local_2.avatarID;
                this.epuipItem.staticInfo = DEFINE.DM.getItemStaticInfo(_local_2.avatarID);
                this.epuipItem.strengthen = _local_2.strLen;
            };
            this.walkV = _arg_1.readUnsignedShort();
            this.runV = _arg_1.readUnsignedShort();
            this.walkV = DEFINE.CITY_V_ADD(this.walkV);
            this.runV = DEFINE.CITY_V_ADD(this.runV);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1067()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1067 = " PZoneAvatarChgBC" (String#15770)


