// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.FamilyUtil

package com.tencent.ai.core.utils
{
    import  ©init._SafeStr_1373;

    public class FamilyUtil 
    {

        public static var identityArr:Array = ["族员", "元老", "副族长", "族长"];


        public static function getTime(_arg_1:Number, _arg_2:int=0):String
        {
            var _local_4:Date;
            var _local_5:int;
            var _local_3 = "";
            if (_arg_2 == 0){
                _local_4 = new Date();
                _local_4.time = _arg_1;
                _local_3 = (((((_local_4.getFullYear() + "年") + (_local_4.getMonth() + 1)) + "月") + _local_4.getDate()) + "日");
            } else {
                if (_arg_2 == 1){
                    _local_5 = int((_arg_1 / (24 * 3600)));
                    if (_local_5){
                        _local_3 = (_local_3 + (_local_5 + "天"));
                    };
                    _local_5 = int(((_arg_1 % (24 * 3600)) / 3600));
                    _local_3 = (_local_3 + (_local_5 + "小时"));
                    _local_5 = int(((_arg_1 % 3600) / 60));
                    _local_3 = (_local_3 + (_local_5 + "分"));
                };
            };
            return (_local_3);
        }

        public static function getIdentityName(_arg_1:int):String
        {
            return (identityArr[_arg_1]);
        }

        public static function getHtmlStr(_arg_1:String, _arg_2:uint=130783):String
        {
            return ((((("<font color='#" + _arg_2.toString(16)) + "'>") + _arg_1) + "</font>"));
        }


        public /*  ©init. */ function _SafeStr_1373()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1373 = " FamilyUtil" (String#15875)


