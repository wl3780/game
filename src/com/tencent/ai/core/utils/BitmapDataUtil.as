// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.BitmapDataUtil

package com.tencent.ai.core.utils
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import  ©init._SafeStr_1369;

    public class BitmapDataUtil 
    {


        public static function getMinBoundingRect(_arg_1:BitmapData):Rectangle
        {
            return (_arg_1.getColorBoundsRect(0xFF000000, 0, false));
        }

        public static function getMinBoundingBitmapData(_arg_1:BitmapData):BitmapData
        {
            var _local_2:Rectangle = _arg_1.getColorBoundsRect(0xFF000000, 0, false);
            var _local_3:BitmapData = new BitmapData(_local_2.width, _local_2.height, true, 0);
            _local_3.copyPixels(_arg_1, _local_2, new Point(), null, null, true);
            return (_local_3);
        }


        public /*  ©init. */ function _SafeStr_1369()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1369 = " BitmapDataUtil" (String#14273)


