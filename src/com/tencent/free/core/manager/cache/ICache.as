// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.cache.ICache

package com.tencent.free.core.manager.cache
{
    public interface ICache 
    {

        function get remainingTime():int;
        function set remainingTime(_arg_1:int):void;
        function isLoaded():Boolean;
        function check(_arg_1:Function, _arg_2:*):Boolean;
        function release():void;

    }
}//package com.tencent.free.core.manager.cache

