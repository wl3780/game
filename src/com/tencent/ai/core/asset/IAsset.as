// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.IAsset

package com.tencent.ai.core.asset
{
    import flash.events.IEventDispatcher;

    public interface IAsset extends IEventDispatcher 
    {

        function addRef(_arg_1:Object):void;
        function removeRef(_arg_1:Object):void;
        function getRefsLen():int;
        function load(... _args):void;
        function unload():void;
        function stopLoad():void;
        function getIsLoaded():Boolean;
        function set loadArg(_arg_1:Object):void;
        function get loadArg():Object;
        function get priority():int;
        function set priority(_arg_1:int):void;
        function set saveSO(_arg_1:Boolean):void;
        function get saveSO():Boolean;

    }
}//package com.tencent.ai.core.asset

