// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.MFFUtil

package com.tencent.ai.core.utils
{
    import deng.fzip.FZipFile;
    import com.tencent.free.mff.MFFFile;
    import deng.fzip.FZip;
    import com.tencent.free.mff.MFF;
    import com.tencent.free.utils.XString;
    import flash.utils.ByteArray;
    import  ©init._SafeStr_1374;

    public class MFFUtil 
    {


        public static function convertZIPToMFF(_arg_1:ByteArray):ByteArray
        {
            var _local_7:FZipFile;
            var _local_8:MFFFile;
            var _local_9:String;
            var _local_2:FZip = new FZip();
            _local_2.loadBytes(_arg_1);
            var _local_3:MFF = new MFF();
            var _local_4:uint = _local_2.getFileCount();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_7 = _local_2.getFileAt(_local_5);
                _local_8 = new MFFFile();
                _local_9 = _local_7.filename;
                _local_8.mffName = _local_9;
                _local_8.mffType = XString.getURLExtension(_local_9);
                _local_8.mffBytes = _local_7.content;
                _local_3.addFile(_local_8);
                _local_5++;
            };
            var _local_6:ByteArray = _local_3.encode();
            _local_3.dispose();
            return (_local_6);
        }


        public /*  ©init. */ function _SafeStr_1374()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1374 = " MFFUtil" (String#17435)


