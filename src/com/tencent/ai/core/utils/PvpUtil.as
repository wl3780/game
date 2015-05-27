// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.PvpUtil

package com.tencent.ai.core.utils
{
    import  ©init._SafeStr_1375;

    public class PvpUtil 
    {


        public static function toPvpLevelTips(_arg_1:int):String
        {
            var _local_2 = "";
            if (_arg_1 <= 10){
                _local_2 = (("白带" + _arg_1) + "级");
            } else {
                if (_arg_1 <= 20){
                    _local_2 = (("蓝带" + (_arg_1 - 10)) + "级");
                } else {
                    if (_arg_1 <= 30){
                        _local_2 = (("紫带" + (_arg_1 - 20)) + "级");
                    } else {
                        _local_2 = (("黑带" + (_arg_1 - 30)) + "段");
                    };
                };
            };
            return (_local_2);
        }

        public static function toPkGrade(_arg_1:int):int
        {
            return (Math.ceil((_arg_1 / 10)));
        }

        public static function getPkRestLevel(_arg_1:int):int
        {
            var _local_2:int = (_arg_1 % 10);
            return (((_local_2) ? _local_2 : 10));
        }


        public /*  ©init. */ function _SafeStr_1375()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1375 = " PvpUtil" (String#14555)


