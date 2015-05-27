// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.bubble.IBubble

package com.tencent.ai.core.bubble
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.element.MovementElement;

    public interface IBubble extends IEventDispatcher 
    {

        function initialize(_arg_1:MovementElement):void;
        function getTarget():MovementElement;
        function setContent(_arg_1:Object, _arg_2:int):void;
        function getContent():Object;
        function getBubbleType():int;
        function destory():void;
        function reset():void;

    }
}//package com.tencent.ai.core.bubble

