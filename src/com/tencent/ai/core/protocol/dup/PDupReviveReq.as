// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupReviveReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.protocol.data.P_CombatPlayerInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_945;

    public class PDupReviveReq extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = ProtocolIDDef.DUP_REVIVE_REQ;//589893
        public static const IN_CMD:int = ProtocolIDDef.DUP_REVIVE_RSP;//589894

        public var playerID:PlayerID;
        public var iResult:int;
        public var iPlayerInfo:PlayerInfo;
        public var iEffectFrame:uint;


        override public function read(_arg_1:IDataInput):void
        {
            var _local_2:P_CombatPlayerInfo;
            super.read(_arg_1);
            this.iResult = _arg_1.readInt();
            if (this.iResult == 0){
                _local_2 = new P_CombatPlayerInfo();
                _local_2.read(_arg_1);
                this.iPlayerInfo = _local_2.data;
                this.iEffectFrame = _arg_1.readUnsignedInt();
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            this.playerID.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_945()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_945 = " PDupReviveReq" (String#17330)


