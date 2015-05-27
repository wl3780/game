// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.IBitmapDisplay

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.display.IBitmap;

    public interface IBitmapDisplay extends IBitmap 
    {

        function setLocalXY(_arg_1:int, _arg_2:int):void;
        function update():void;
        function reset():void;

    }
}//package com.tencent.ai.core.render

