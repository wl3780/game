package com.tencent.ai.core.script
{
    public interface IScript 
    {

        function setTarget(target:Object):void;
        function getTarget():Object;
        function exec(cmd:String, arg:Object):void;
        function stop():void;
        function getCmds():Object;

    }
}
