// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PWarSoulCreate

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1054;

    public class PWarSoulCreate implements ISerialize 
    {

        public static const REQ:int = 526979;
        public static const RSP:int = 526980;

        public var createType:int;
        public var createIndex:int;
        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.createType);
            _arg_1.writeByte(this.createIndex);
        }

        public /*  ©init. */ function _SafeStr_1054()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1054 = " PWarSoulCreate" (String#16241)


