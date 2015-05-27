// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.task.ITask

package com.tencent.free.core.manager.task
{
    import flash.events.IEventDispatcher;
    import com.tencent.free.core.manager.loader.ILoader;

    public interface ITask extends IEventDispatcher 
    {

        function get key():Object;
        function set priority(_arg_1:int):void;
        function get priority():int;
        function start(_arg_1:*):void;
        function end();
        function addLoader(_arg_1:ILoader):void;
        function removeLoader(_arg_1:ILoader):void;
        function referenceLength():int;

    }
}//package com.tencent.free.core.manager.task

