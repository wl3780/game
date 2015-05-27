// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.content.IContent

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
}//package com.tencent.free.core.manager.content

