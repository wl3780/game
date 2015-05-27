// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.loader.ILoader

package com.tencent.free.core.manager.loader
{
    import com.tencent.free.core.manager.content.IContent;

    public interface ILoader 
    {

        function load():void;
        function unload():void;
        function get loadInfo():Object;
        function set key(_arg_1:Object):void;
        function get key():Object;
        function get content():IContent;
        function set priority(_arg_1:int):void;
        function get priority():int;
        function set hash(_arg_1:String):void;
        function get hash():String;
        function set checkHash(_arg_1:Function):void;
        function get checkHash():Function;
        function get url():String;
        function get expireTime():int;
        function get saveSO():Boolean;
        function get retryTimes():int;

    }
}//package com.tencent.free.core.manager.loader

