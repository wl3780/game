// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.MD5Util

package com.tencent.free.utils
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_76;

    public class MD5Util extends MD5 
    {


        public static function checkHashBytes(_arg_1:ByteArray, _arg_2:String, _arg_3:String=null):Boolean
        {
            if ((((null == _arg_2)) || (("" == _arg_2)))){
                return (true);
            };
            if ((((null == _arg_3)) || (("" == _arg_3)))){
                _arg_3 = MD5.hashBytes(_arg_1);
            };
            return ((_arg_3 == _arg_2));
        }


        public /*  ©init. */ function _SafeStr_76()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_76 = " MD5Util" (String#1406)


