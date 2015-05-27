// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PWakeOutReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1052;

    public class PWakeOutReq implements ISerialize 
    {

        public static const OUT_CMD:int = 526913;
        public static const IN_CMD:int = 526914;

        public var result:int;
        public var state:int;
        public var onlineTime:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (!this.result){
                this.state = _arg_1.readUnsignedByte();
                this.onlineTime = _arg_1.readUnsignedInt();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1052()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1052 = " PWakeOutReq" (String#15500)


