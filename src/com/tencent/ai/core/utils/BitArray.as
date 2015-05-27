// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.BitArray

package com.tencent.ai.core.utils
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_1368;

    public class BitArray extends ByteArray 
    {

        public function BitArray(_arg_1:ByteArray=null)
        {
            if (_arg_1 != null){
                this.writeBytes(_arg_1, 0, _arg_1.length);
            };
        }

        public function get bitLength():uint
        {
            return ((this.length * 8));
        }

        public function getBitAt(_arg_1:uint=0):Boolean
        {
            _arg_1++;
            if (_arg_1 > (this.length * 8)){
                return (false);
            };
            var _local_2:uint = (Math.ceil((_arg_1 / 8)) - 1);
            var _local_3:uint = (1 << (((this.length * 8) - _arg_1) % 8));
            return (Boolean((this[_local_2] & _local_3)));
        }

        public function setBitAt(_arg_1:uint, _arg_2:Boolean):void
        {
            _arg_1++;
            var _local_3:uint = Math.ceil((_arg_1 / 8));
            if (_local_3 > this.length){
                this.length = _local_3;
            };
            var _local_4:uint = (Math.ceil((_arg_1 / 8)) - 1);
            var _local_5:uint = (1 << (((this.length * 8) - _arg_1) % 8));
            if (_arg_2){
                this[_local_4] = (this[_local_4] | _local_5);
            } else {
                this[_local_4] = (this[_local_4] & ~(_local_5));
            };
        }

        public function getBitAtCoord(_arg_1:uint, _arg_2:uint, _arg_3:uint):Boolean
        {
            var _local_4:uint = ((_arg_3 * _arg_1) + _arg_2);
            return (this.getBitAt(_local_4));
        }

        public /*  ©init. */ function _SafeStr_1368()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1368 = " BitArray" (String#14501)


