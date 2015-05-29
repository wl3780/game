package com.tencent.free.core.manager.content
{
    import flash.events.IEventDispatcher;

    public interface IContent extends IEventDispatcher 
    {

        function get key():Object;
        function get url():String;
        function get hash();
        function isLoaded():Boolean;

    }
}
