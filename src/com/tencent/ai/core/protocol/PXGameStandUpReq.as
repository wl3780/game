// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameStandUpReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1066;

    public class PXGameStandUpReq implements ISerialize 
    {

        public static const IN_CMD:int = 0x130016;
        public static const OUT_CMD:int = 0x130015;

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
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.table_id);
            _arg_1.writeByte(this.seat_id);
        }

        public /*  ©init. */ function _SafeStr_1066()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1066 = " PXGameStandUpReq" (String#15602)


