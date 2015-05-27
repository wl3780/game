// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.ILogicObject

package com.tencent.ai.core.element
{
    import com.tencent.ai.core.data.FrameData;

    public interface ILogicObject extends ITickObject 
    {

        function setFrameData(_arg_1:FrameData):void;
        function getFrameData():FrameData;
        function freeze(_arg_1:int):void;
        function resetFreeze():void;

    }
}//package com.tencent.ai.core.element

