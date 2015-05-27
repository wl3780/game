// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PExchangeReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_998;

    public class PExchangeReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_EXCHANGE_RSP;//0x170014
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_EXCHANGE_REQ;//0x170013

        public var exchangeSeriel:int;
        public var partyID:int;
        public var ret:int;
        public var index:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            this.partyID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt((((this.partyID == 0)) ? (800004) : this.partyID));
            _arg_1.writeByte(this.index);
        }

        public /*  ©init. */ function _SafeStr_998()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_998 = " PExchangeReq" (String#16583)


