package com.tencent.free.core.manager.loader
{
    import com.tencent.free.core.manager.content.IContent;

    public interface ILoader 
    {

        function load():void;
        function unload():void;
        function get loadInfo():Object;
        function set key(value:Object):void;
        function get key():Object;
        function get content():IContent;
        function set priority(value:int):void;
        function get priority():int;
        function set hash(value:String):void;
        function get hash():String;
        function set checkHash(value:Function):void;
        function get checkHash():Function;
        function get url():String;
        function get expireTime():int;
        function get retryTimes():int;

    }
}
