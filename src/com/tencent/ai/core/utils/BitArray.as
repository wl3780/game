package com.tencent.ai.core.utils
{
    import flash.utils.ByteArray;

    public class BitArray extends ByteArray 
    {

        public function BitArray(bytes:ByteArray=null)
        {
            if (bytes != null) {
                this.writeBytes(bytes, 0, bytes.length);
            }
        }

        public function get bitLength():uint
        {
            return this.length * 8;
        }

        public function getBitAt(bitIndex:uint=0):Boolean
        {
            bitIndex++;
            if (bitIndex > (this.length * 8)) {
                return false;
            }
            var pos:uint = Math.ceil(bitIndex / 8) - 1;
            var bitValue:uint = 1 << ((this.length * 8 - bitIndex) % 8);
            return Boolean(this[pos] & bitValue);
        }

        public function setBitAt(bitIndex:uint, value:Boolean):void
        {
            bitIndex++;
            var maxLen:uint = Math.ceil(bitIndex / 8);
            if (maxLen > this.length) {
                this.length = maxLen;
            }
            var pos:uint = Math.ceil(bitIndex / 8) - 1;
            var bitValue:uint = 1 << ((this.length * 8 - bitIndex) % 8);
            if (value) {
                this[pos] = this[pos] | bitValue;
            } else {
                this[pos] = this[pos] & ~(bitValue);
            }
        }

        public function getBitAtCoord(row:uint, col:uint, margin:uint=8):Boolean
        {
            var bitIndex:uint = margin * row + col;
            return this.getBitAt(bitIndex);
        }

    }
}
