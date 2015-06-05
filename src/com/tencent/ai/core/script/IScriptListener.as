package com.tencent.ai.core.script
{
    public interface IScriptListener 
    {

        function onScript(cmd:String, arg:Object=null):void;

    }
}
