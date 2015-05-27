// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.ILogicFrame

package com.tencent.ai.core.timeline
{
    import flash.events.IEventDispatcher;

    public interface ILogicFrame extends IEventDispatcher 
    {

        function setParams(_arg_1:LFParam):void;
        function enter(_arg_1:Object):void;
        function exit():void;
        function getType():int;

    }
}//package com.tencent.ai.core.timeline

