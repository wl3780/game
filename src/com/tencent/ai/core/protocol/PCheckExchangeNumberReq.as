// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PCheckExchangeNumberReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_980;
    import __AS3__.vec.*;

    public class PCheckExchangeNumberReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_CHECK_EXCHANGE_RSP;//0x170016
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_CHECK_EXCHANGE_REQ;//0x170015

        public var chance0:uint;
        public var chance1:uint;
        public var chance2:uint;
        public var chance3:uint;
        public var partyID:int;
        public var ret:int;
        public var arrLength:int;
        public var chances:Vector.<uint>;

        public function PCheckExchangeNumberReq()
        {
            this.chances = new Vector.<uint>();
        }

        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret){
                ProtocolHelper.handlerError2(this.ret, IN_CMD);
                return;
            };
            this.partyID = _arg_1.readUnsignedInt();
            this.arrLength = _arg_1.readUnsignedShort();
            var _local_2:uint;
            while (_local_2 < this.arrLength) {
                this.chances.push(_arg_1.readUnsignedInt());
                _local_2++;
            };
            this.chance0 = this.chances[0];
            if (this.chances.length > 1){
                this.chance1 = this.chances[1];
            };
            if (this.chances.length > 2){
                this.chance2 = this.chances[2];
            };
            if (this.chances.length > 3){
                this.chance3 = this.chances[3];
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt((((this.partyID == 0)) ? (800004) : this.partyID));
        }

        public /*  ©init. */ function _SafeStr_980()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_980 = " PCheckExchangeNumberReq" (String#13829)


