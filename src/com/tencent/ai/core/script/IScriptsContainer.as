package com.tencent.ai.core.script
{
    public interface IScriptsContainer extends IScriptListener 
    {

        function addScript(script:IScript):void;
        function hasScript(cmd:String):Boolean;
        function addLastRS(script:IScript):void;
        function removeLastRs(script:IScript):void;
        function clearLastScripts():void;

    }
}
