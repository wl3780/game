// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.IScriptsContainer

package com.tencent.ai.core.script
{
    public interface IScriptsContainer extends IScriptListener 
    {

        function addScript(_arg_1:IScript):void;
        function hasScript(_arg_1:String):Boolean;
        function addLastRS(_arg_1:IScript):void;
        function removeLastRs(_arg_1:IScript):void;
        function clearLastScripts():void;

    }
}//package com.tencent.ai.core.script

