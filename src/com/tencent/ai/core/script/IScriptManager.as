package com.tencent.ai.core.script
{
    public interface IScriptManager 
    {

        function newScript(cmd:String):IScript;
        function executeScript(cmd:String, arg:Object=null, target:Object=null):void;
        function buildScripts(type:int, target:IScriptsContainer, scriptList:Array=null):void;

    }
}
