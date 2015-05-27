// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.Int64

package com.tencent.free.utils
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_74;

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

        public function Int64(_arg_1:int=0, _arg_2:uint=0)
        {
            this.setValue(_arg_1, _arg_2);
        }

        public function decode(_arg_1:ByteArray):int
        {
            if (_arg_1.bytesAvailable < Int64.size){
                return (ErrorMap.ERR_PARTIAL_MSG);
            };
            var _local_2:int = _arg_1.readInt();
            var _local_3:uint = _arg_1.readUnsignedInt();
            this.setValue(_local_2, _local_3);
            return (0);
        }

        public function encode(_arg_1:ByteArray):int
        {
            _arg_1.writeInt(this._high);
            _arg_1.writeUnsignedInt(this._low);
            return (0);
        }

        public function getSize():uint
        {
            return (Int64.size);
        }

        public function get high():int
        {
            return (this._high);
        }

        public function get low():uint
        {
            return (this._low);
        }

        public function get string():String
        {
            return (this._strValue);
        }

        public function toString():String
        {
            return (this._strValue);
        }

        public function setValue(_arg_1:int, _arg_2:uint):void
        {
            var _local_4:String;
            this._high = _arg_1;
            this._low = _arg_2;
            this._strValue = ((_arg_1 * INT32) + _arg_2).toString();
            var _local_3:uint = this._strValue.length;
            if (_local_3 > 16){
                _local_4 = (Math.abs((((_arg_1 % PARAM) * INT32_REMAINDER) + (_arg_2 % PARAM))) % PARAM).toString();
                while (_local_4.length < 4) {
                    _local_4 = ("0" + _local_4);
                };
                this._strValue = (this._strValue.substr(0, (_local_3 - 4)) + _local_4);
            };
        }

        public function compare(_arg_1:Int64):int
        {
            if (_arg_1 == null){
                return (COMPARE_RESULT_UNKOWN);
            };
            if (this._high < _arg_1.high){
                return (COMPARE_RESULT_SMALLER);
            };
            if (this._high == _arg_1.high){
                if (this._low < _arg_1.low){
                    return (COMPARE_RESULT_SMALLER);
                };
                if (this._low == _arg_1.low){
                    return (COMPARE_RESULT_EQUAL);
                };
                return (COMPARE_RESULT_LARGER);
            };
            return (COMPARE_RESULT_LARGER);
        }

        public /*  ©init. */ function _SafeStr_74()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_74 = " Int64" (String#1505)


