// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameSitDownReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1065;

    public class PXGameSitDownReq implements ISerialize 
    {

        public static const IN_CMD:int = 0x130012;
        public static const OUT_CMD:int = 0x130011;

        public var game_id:uint;
        public var table_id:int;
        public var seat_id:uint;
        public var result:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result > 0){
                ProtocolHelper.handlerError(this.result, IN_CMD);
                return;
            };
            this.table_id = _arg_1.readInt();
            this.seat_id = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.game_id);
            _arg_1.writeInt(this.table_id);
            _arg_1.writeByte(this.seat_id);
            XString.WriteChars(_arg_1, "123", 16);
        }

        public /*  ©init. */ function _SafeStr_1065()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1065 = " PXGameSitDownReq" (String#16295)


