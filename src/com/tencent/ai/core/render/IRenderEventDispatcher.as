// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.IRenderEventDispatcher

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.script.IScriptListener;

    public interface IRenderEventDispatcher 
    {

        function addFrameListener(_arg_1:String, _arg_2:IFrameListener):void;
        function removeFrameListener(_arg_1:String, _arg_2:IFrameListener):void;
        function addScriptListener(_arg_1:IScriptListener):void;
        function removeScriptListener(_arg_1:IScriptListener):void;

    }
}//package com.tencent.ai.core.render

