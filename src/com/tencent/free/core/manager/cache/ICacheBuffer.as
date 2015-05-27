// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.cache.ICacheBuffer

package com.tencent.free.core.manager.cache
{
    public interface ICacheBuffer 
    {

        function addCache(_arg_1:*, _arg_2:ICache):Boolean;
        function removeCache(_arg_1:*):void;
        function removeAllCache():void;
        function getCache(_arg_1:*, _arg_2:*=null, _arg_3:Function=null):ICache;

    }
}//package com.tencent.free.core.manager.cache

