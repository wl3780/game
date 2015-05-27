// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.protocol.ConsumeReq

package com.tencent.ai.core.activity.womenJH.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_29;

    public class ConsumeReq implements ISerialize 
    {

        public static const IN_CMD:int = 1511204;
        public static const OUT_CMD:int = 1511203;

        public var ret:int;
        public var type:uint;
        public var index:uint;
        public var indexOut:uint;
        public var typeOut:uint;
        public var numOut:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.type = _arg_1.readUnsignedByte();
            this.index = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.typeOut);
            _arg_1.writeByte(this.indexOut);
            _arg_1.writeByte(this.numOut);
        }

        public /*  ©init. */ function _SafeStr_29()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.protocol

// _SafeStr_29 = " ConsumeReq" (String#17717)


