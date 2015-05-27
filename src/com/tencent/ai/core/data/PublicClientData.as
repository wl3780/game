// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PublicClientData

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_315;
    import __AS3__.vec.*;

    public class PublicClientData implements ISerialize 
    {

        public var expire_time:uint;
        public var bytes_num:uint;
        public var bytes:Vector.<uint>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:uint;
            this.expire_time = _arg_1.readUnsignedInt();
            this.bytes_num = _arg_1.readUnsignedShort();
            this.bytes = new Vector.<uint>();
            var _local_2:int;
            while (_local_2 < this.bytes_num) {
                _local_3 = _arg_1.readUnsignedByte();
                this.bytes.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.expire_time);
            _arg_1.writeShort(this.bytes_num);
            var _local_2:int;
            while (_local_2 < this.bytes_num) {
                _arg_1.writeByte(this.bytes[_local_2]);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_315()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_315 = " PublicClientData" (String#17315)


