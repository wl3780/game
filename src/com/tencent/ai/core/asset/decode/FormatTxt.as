// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.FormatTxt

package com.tencent.ai.core.asset.decode
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_66;

    public class FormatTxt extends BaseFormat 
    {

        public function FormatTxt()
        {
            extNames.push("txt", "xml", "html");
        }

        override public function start():void
        {
            var _local_3:Object;
            var _local_4:ByteArray;
            var _local_1:int = tasklist.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                _local_3 = tasklist[_local_2];
                _local_4 = _local_3.bytes;
                _local_3.content = _local_4.readUTFBytes(_local_4.bytesAvailable);
                _local_4.length = 0;
                _local_2++;
            };
            complete();
        }

        public /*  ©init. */ function _SafeStr_66()
        {
        }


    }
}//package com.tencent.ai.core.asset.decode

// _SafeStr_66 = " FormatTxt" (String#14354)


