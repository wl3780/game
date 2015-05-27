// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.ByteBuffer

package com.tencent.free.utils
{
    import flash.utils.ByteArray;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_67;

    public class ByteBuffer extends ByteArray 
    {

        protected var limitCapacity:int = -1;


        public function allocate(_arg_1:int):void
        {
            var _local_2 = _arg_1;
            length = _local_2;
            this.limitCapacity = _local_2;
            position = 0;
        }

        public function get limit():int
        {
            return (this.limitCapacity);
        }

        public function fill(_arg_1:IDataInput):void
        {
            if (this.limitCapacity != 0){
                _arg_1.readBytes(this, 0, this.limitCapacity);
            };
        }

        public function copyToByteArray():ByteArray
        {
            var _local_1:ByteArray = new ByteArray();
            position = 0;
            readBytes(_local_1, 0, this.limitCapacity);
            return (_local_1);
        }

        public function get buffLen():int
        {
            if (this.limitCapacity == -1){
                return (bytesAvailable);
            };
            return ((this.limitCapacity - position));
        }

        public /*  ©init. */ function _SafeStr_67()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_67 = " ByteBuffer" (String#1394)


