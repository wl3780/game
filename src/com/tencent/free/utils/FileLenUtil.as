package com.tencent.free.utils
{
    import flash.utils.ByteArray;

    public class FileLenUtil 
    {

        public static function checkBytes(data:ByteArray, len:int, str:String=null):Boolean
        {
            if (0 == len || len == data.length) {
                return true;
            }
            return false;
        }

    }
}
