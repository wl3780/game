// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameHandUpReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1061;

    public class PXGameHandUpReq implements ISerialize 
    {

        public static const IN_CMD:int = 0x130014;
        public static const OUT_CMD:int = 0x130013;

        public var table_id:int;
        public var seat_id:uint;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.table_id);
            _arg_1.writeByte(this.seat_id);
        }

        public /*  ©init. */ function _SafeStr_1061()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1061 = " PXGameHandUpReq" (String#15020)


