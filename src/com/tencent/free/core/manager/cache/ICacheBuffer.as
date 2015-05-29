package com.tencent.free.core.manager.cache
{
    public interface ICacheBuffer 
    {

        function addCache(key:*, res:ICache):Boolean;
        function removeCache(key:*):void;
        function removeAllCache():void;
        function getCache(key:*, hash:*=null, func:Function=null):ICache;

    }
}
