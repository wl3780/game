package com.tencent.free.utils
{
    import flash.utils.ByteArray;

    public class UInt64 
    {

        public static const size:uint = 8;
        public static const COMPARE_RESULT_UNKOWN:int = -2;
        public static const COMPARE_RESULT_SMALLER:int = -1;
        public static const COMPARE_RESULT_EQUAL:int = 0;
        public static const COMPARE_RESULT_LARGER:int = 1;
        
		private static const INT32:Number = 4294967296;
        private static const INT32_REMAINDER:uint = 7296;
        private static const PARAM:uint = 10000;

        private var _high:uint = 0;
        private var _low:uint = 0;
        private var _strValue:String = "0";

        public function UInt64(hVal:uint=0, lVal:uint=0)
        {
            this.setValue(hVal, lVal);
        }

        public function decode(bytes:ByteArray):int
        {
            if (bytes.bytesAvailable < UInt64.size) {
                return ErrorMap.ERR_PARTIAL_MSG;
			}
            var hVal:int = bytes.readUnsignedInt();
            var lVal:uint = bytes.readUnsignedInt();
            this.setValue(hVal, lVal);
            return 0;
        }

        public function encode(bytes:ByteArray):int
        {
            bytes.writeUnsignedInt(_high);
            bytes.writeUnsignedInt(_low);
            return 0;
        }

        public function getSize():uint
        {
            return UInt64.size;
        }

        public function get high():uint
        {
            return _high;
        }

        public function get low():uint
        {
            return _low;
        }

        public function get string():String
        {
            return _strValue;
        }

        public function toString():String
        {
            return _strValue;
        }

        public function setValue(h:uint, l:uint):void
        {
            _high = h;
            _low = l;
            _strValue = (h * INT32 + l).toString();
            var len:uint = _strValue.length;
            if (len > 16) {
				var tmp:Number = (h % PARAM) * INT32_REMAINDER + (l%PARAM);
	            var str:String = (Math.abs(tmp) % PARAM).toString();
                while (str.length < 4) {
                    str = "0" + str;
                }
                _strValue = _strValue.substr(0, len-4) + str;
            }
        }

        public function compare(another:UInt64):int
        {
            if (another == null) {
                return COMPARE_RESULT_UNKOWN;
            }
            if (_high < another.high) {
                return COMPARE_RESULT_SMALLER;
            }
            if (_high == another.high) {
                if (_low < another.low) {
                    return COMPARE_RESULT_SMALLER;
                }
                if (_low == another.low) {
                    return COMPARE_RESULT_EQUAL;
                }
                return COMPARE_RESULT_LARGER;
            }
            return COMPARE_RESULT_LARGER;
        }

    }
}
