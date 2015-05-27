// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.IPluginManager

package com.tencent.free.core.plugin
{
    import com.tencent.free.core.cmd.ICmdListener;
    import __AS3__.vec.Vector;

    public interface IPluginManager extends ICmdListener 
    {

        function install(_arg_1:PluginConfig, _arg_2:Array=null):IPlugin;
        function addPlugin(_arg_1:IPlugin):void;
        function removePlugin(_arg_1:String):void;
        function installByClassName(_arg_1:String):IPlugin;
        function hasPlugin(_arg_1:String):Boolean;
        function getPluginByName(_arg_1:String):IPlugin;
        function getPluginList():Vector.<IPlugin>;
        function loadPlugin(_arg_1:PluginRequest):void;
        function getConfigManager():PluginConfigManager;

    }
}//package com.tencent.free.core.plugin

