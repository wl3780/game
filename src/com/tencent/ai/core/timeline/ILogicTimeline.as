// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.ILogicTimeline

package com.tencent.ai.core.timeline
{
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;

    public interface ILogicTimeline extends IEventDispatcher 
    {

        function addLogicFrame(_arg_1:ILogicFrame):void;
        function getLogicFrames():Vector.<ILogicFrame>;
        function getCurrentLogicFrame():ILogicFrame;
        function pause():void;
        function resume():void;
        function isRuning():Boolean;
        function getCurrentFrameIndex():int;
        function get enableTick():Boolean;
        function set enableTick(_arg_1:Boolean):void;
        function get timeLineObj():Object;
        function set timeLineObj(_arg_1:Object):void;

    }
}//package com.tencent.ai.core.timeline

