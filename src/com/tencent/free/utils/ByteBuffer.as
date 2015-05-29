package com.tencent.free.utils
{
    import flash.utils.ByteArray;
    import flash.utils.IDataInput;

    public class ByteBuffer extends ByteArray 
    {

        protected var limitCapacity:int = -1;

        public function allocate(len:int):void
        {
            this.length = len;
            this.limitCapacity = len;
            this.position = 0;
        }

        public function get limit():int
        {
            return this.limitCapacity;
        }

        public function fill(data:IDataInput):void
        {
            if (this.limitCapacity != 0) {
                data.readBytes(this, 0, this.limitCapacity);
            }
        }

        public function copyToByteArray():ByteArray
        {
            var data:ByteArray = new ByteArray();
            this.position = 0;
            this.readBytes(data, 0, this.limitCapacity);
            return data;
        }

        public function get buffLen():int
        {
            if (this.limitCapacity == -1) {
                return this.bytesAvailable;
            }
            return this.limitCapacity - this.position;
        }

    }
}
