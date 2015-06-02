package com.tencent.ai.core.render
{
    import com.tencent.ai.core.display.IDisplay;

    public interface IRenderObject 
    {

        function render(level:int):void;
        function getDisplay():IDisplay;

    }
}
