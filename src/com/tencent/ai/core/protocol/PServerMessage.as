// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PServerMessage

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1027;

    public class PServerMessage implements ISerialize 
    {

        public static const IN_CMD:int = 524443;

        public var type:uint;
        public var roll_flag:uint;
        public var priority:uint;
        public var color:uint;
        public var msg:String;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:uint;
            this.type = _arg_1.readUnsignedInt();
            this.roll_flag = _arg_1.readUnsignedInt();
            this.priority = _arg_1.readUnsignedByte();
            this.color = _arg_1.readUnsignedInt();
            _local_2 = _arg_1.readUnsignedShort();
            this.msg = _arg_1.readUTFBytes(_local_2);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1027()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1027 = " PServerMessage" (String#17579)


