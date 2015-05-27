// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupEquipChangeResult

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.protocol.data.P_EquipItemInfo;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_989;

    public class PDupEquipChangeResult extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = ProtocolIDDef.DUP_CMD_EQUIP_CHG_BC;//589870

        public var playerID:PlayerID;
        public var sequenceNo:uint;
        public var takeEffectFrame:uint;
        public var ret:int;
        public var equipPos:int;
        public var epuipItem:EquipItemInfo;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.sequenceNo = _arg_1.readUnsignedInt();
            this.takeEffectFrame = _arg_1.readUnsignedInt();
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                error("[PDupEquipChangeResult]>>> read:iRet= ", this.ret);
                return;
            };
            this.equipPos = _arg_1.readUnsignedByte();
            P_EquipItemInfo.P.read(_arg_1);
            this.epuipItem = P_EquipItemInfo.P.data;
            P_EquipItemInfo.P.data = null;
        }

        public /*  ©init. */ function _SafeStr_989()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_989 = " PDupEquipChangeResult" (String#14219)


