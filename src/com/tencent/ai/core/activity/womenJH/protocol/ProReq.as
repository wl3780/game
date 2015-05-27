// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.protocol.ProReq

package com.tencent.ai.core.activity.womenJH.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_30;

    public class ProReq implements ISerialize 
    {

        public static const IN_CMD:int = 1511206;
        public static const OUT_CMD:int = 1511205;

        public var ret:int;
        public var petSid:uint;
        public var type:uint;
        public var typeOut:uint;
        public var petSIDOut:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.type = _arg_1.readUnsignedByte();
            this.petSid = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.typeOut);
            _arg_1.writeUnsignedInt(this.petSIDOut);
        }

        public /*  ©init. */ function _SafeStr_30()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.protocol

// _SafeStr_30 = " ProReq" (String#13964)


