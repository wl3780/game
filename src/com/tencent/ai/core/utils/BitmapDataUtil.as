package com.tencent.ai.core.utils
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class BitmapDataUtil 
    {

        public static function getMinBoundingRect(bitdata:BitmapData):Rectangle
        {
            return bitdata.getColorBoundsRect(0xFF000000, 0, false);
        }

        public static function getMinBoundingBitmapData(bitdata:BitmapData):BitmapData
        {
            var rect:Rectangle = bitdata.getColorBoundsRect(0xFF000000, 0, false);
            var newdata:BitmapData = new BitmapData(rect.width, rect.height, true, 0);
            newdata.copyPixels(bitdata, rect, new Point(), null, null, true);
            return newdata;
        }

    }
}
