// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PAvatarEquipReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import com.tencent.ai.core.protocol.data.P_EquipItemInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_973;

    public class PAvatarEquipReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_EQUIP_AVATAR_RSP;//524340
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_EQUIP_AVATAR_REQ;//524339

        public var oPos:int;
        public var oSerialID:int;
        public var iRet:int;
        public var iPos:int;
        public var iEpuipItem:EquipItemInfo;
        public var iUnequipItem:EquipItemInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                ProtocolHelper.handlerError(this.iRet, IN_CMD);
                return;
            };
            this.iPos = _arg_1.readUnsignedByte();
            P_EquipItemInfo.P.read(_arg_1);
            this.iEpuipItem = P_EquipItemInfo.P.data;
            P_EquipItemInfo.P.read(_arg_1);
            this.iUnequipItem = P_EquipItemInfo.P.data;
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.oSerialID);
            _arg_1.writeByte(this.oPos);
        }

        public /*  ©init. */ function _SafeStr_973()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_973 = " PAvatarEquipReq" (String#16376)


