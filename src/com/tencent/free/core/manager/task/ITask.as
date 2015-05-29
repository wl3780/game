package com.tencent.free.core.manager.task
{
    import com.tencent.free.core.manager.loader.ILoader;
    
    import flash.events.IEventDispatcher;

    public interface ITask extends IEventDispatcher 
    {

        function get key():Object;
        function set priority(value:int):void;
        function get priority():int;
        function start(res:*):void;
        function end();
        function addLoader(loader:ILoader):void;
        function removeLoader(loader:ILoader):void;
        function referenceLength():int;

    }
}
