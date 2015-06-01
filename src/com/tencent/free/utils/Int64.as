package com.tencent.free.utils
{
    import flash.utils.ByteArray;

    public class Int64 
    {

        public static const size:uint = 8;
        public static const COMPARE_RESULT_UNKOWN:int = -2;
        public static const COMPARE_RESULT_SMALLER:int = -1;
        public static const COMPARE_RESULT_EQUAL:int = 0;
        public static const COMPARE_RESULT_LARGER:int = 1;
        
		private static const INT32:Number = 4294967296;
        private static const INT32_REMAINDER:uint = 7296;
        private static const PARAM:uint = 10000;

        private var _high:int = 0;
        private var _low:uint = 0;
        private var _strValue:String = "0";

        public function Int64(highVal:int=0, lowVal:uint=0)
        {
            this.setValue(highVal, lowVal);
        }

        public function decode(data:ByteArray):int
        {
            if (data.bytesAvailable < Int64.size) {
                return ErrorMap.ERR_PARTIAL_MSG;
            }
            var highVal:int = data.readInt();
            var lowVal:uint = data.readUnsignedInt();
            this.setValue(highVal, lowVal);
            return 0;
        }

        public function encode(data:ByteArray):int
        {
            data.writeInt(_high);
            data.writeUnsignedInt(_low);
            return ErrorMap.NO_ERROR;
        }

        public function getSize():uint
        {
            return Int64.size;
        }

        public function get high():int
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

        public function setValue(highVal:int, lowVal:uint):void
        {
            _high = highVal;
            _low = lowVal;
            _strValue = (highVal * INT32 + lowVal).toString();
            var len:uint = _strValue.length;
            if (len > 16) {
				var tmp:Number = (highVal % PARAM) * INT32_REMAINDER + (lowVal % PARAM);
	            var str:String = (Math.abs(tmp % PARAM)).toString();
                while (str.length < 4) {
                    str = ("0" + str);
                }
                _strValue = _strValue.substr(0, len - 4) + str;
            }
        }

        public function compare(another:Int64):int
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
