package com.tencent.ai.core.render
{
    public interface IBitmapRenderDisplay extends IBitmapRender 
    {

        function update():void;
        function setLocalXY(lx:int, ly:int):void;

    }
}
