package com.tencent.ai.core.display
{
    import flash.display.BitmapData;

    public interface IBitmap extends IDisplay 
    {

        function set bitmapData(value:BitmapData):void;
        function get bitmapData():BitmapData;

    }
}
