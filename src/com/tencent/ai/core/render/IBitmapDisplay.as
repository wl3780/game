package com.tencent.ai.core.render
{
    import com.tencent.ai.core.display.IBitmap;

    public interface IBitmapDisplay extends IBitmap 
    {

        function setLocalXY(sx:int, sy:int):void;
        function update():void;
        function reset():void;

    }
}
