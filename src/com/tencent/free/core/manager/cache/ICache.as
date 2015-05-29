package com.tencent.free.core.manager.cache
{
    public interface ICache 
    {

        function get remainingTime():int;
        function set remainingTime(value:int):void;
        function isLoaded():Boolean;
        function check(func:Function, hash:*):Boolean;
        function release():void;

    }
}
