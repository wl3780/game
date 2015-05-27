// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.ConditionUtil

package com.tencent.ai.core.utils
{
    import  ©init._SafeStr_1372;

    public class ConditionUtil 
    {


        public static function compareCareer(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:String;
            var _local_8:int;
            var _local_9:int;
            var _local_4 = "000";
            if (_arg_1 >= 1000){
                _arg_1 = (_arg_1 - 1000);
                return ((_arg_1 == _arg_2));
            };
            _local_3 = _arg_1.toString(10);
            _local_3 = (_local_4.substring(0, (3 - _local_3.length)) + _local_3);
            _local_3 = _local_3.slice(-3);
            var _local_5:Array = _local_3.split("");
            _local_3 = _arg_2.toString(10);
            _local_3 = (_local_4.substring(0, (3 - _local_3.length)) + _local_3);
            _local_3 = _local_3.slice(-3);
            var _local_6:Array = _local_3.split("");
            var _local_7:Boolean = true;
            _local_9 = 3;
            _local_8 = 0;
            while (_local_8 < _local_9) {
                _arg_1 = int(_local_5[_local_8]);
                _arg_2 = int(_local_6[_local_8]);
                if (_arg_1 == 0){
                    _local_7 = true;
                    break;
                };
                if (_arg_1 == _arg_2){
                    _local_7 = true;
                } else {
                    _local_7 = false;
                    break;
                };
                _local_8++;
            };
            return (_local_7);
        }


        public /*  ©init. */ function _SafeStr_1372()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1372 = " ConditionUtil" (String#15116)


