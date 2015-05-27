// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.IAppender

package com.tencent.free.logging
{
    import flash.events.IEventDispatcher;

    public interface IAppender extends IEventDispatcher 
    {

        function write(_arg_1:String, _arg_2:int):void;
        function addFilter(_arg_1:Object):void;
        function removeFilter(_arg_1:Object):void;
        function clearFilters():void;

    }
}//package com.tencent.free.logging

