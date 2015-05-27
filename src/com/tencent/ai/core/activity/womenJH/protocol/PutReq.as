// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.protocol.PutReq

package com.tencent.ai.core.activity.womenJH.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_31;

    public class PutReq implements ISerialize 
    {

        public static const IN_CMD:int = 1511212;
        public static const OUT_CMD:int = 1511211;

        public var ret:int;
        public var petSidOut:uint;
        public var typeOut:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.typeOut);
            _arg_1.writeUnsignedInt(this.petSidOut);
        }

        public /*  ©init. */ function _SafeStr_31()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.protocol

// _SafeStr_31 = " PutReq" (String#16205)


