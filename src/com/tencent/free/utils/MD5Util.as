package com.tencent.free.utils
{
    import com.adobe.crypto.MD5;
    
    import flash.utils.ByteArray;

    public class MD5Util extends MD5
    {


        public static function checkHashBytes(bytes:ByteArray, str1:String, str2:String=null):Boolean
        {
            if (null == str1 || "" == str1) {
                return true;
            }
            if (null == str2 || "" == str2) {
                str2 = MD5.hashBytes(bytes);
            }
            return str2 == str1;
        }

    }
}
