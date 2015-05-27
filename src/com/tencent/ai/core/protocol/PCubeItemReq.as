// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PCubeItemReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_983;

    public class PCubeItemReq implements ISerialize 
    {

        public static const OUT_CMD:int = 524565;
        public static const IN_CMD:int = 524566;

        public var itemIDReq:int;
        public var itemCountReq:int;
        public var result:int;
        public var indexType:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            if (this.result == 0){
                this.indexType = _arg_1.readUnsignedInt();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.itemIDReq);
            _arg_1.writeUnsignedInt(this.itemCountReq);
        }

        public /*  ©init. */ function _SafeStr_983()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_983 = " PCubeItemReq" (String#17249)


