// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.IPlugin

package com.tencent.free.core.plugin
{
    import com.tencent.free.core.cmd.ICmdListener;

    public interface IPlugin extends ICmdListener 
    {

        function initialize(_arg_1:PluginConfig):void;
        function finalize():void;
        function getConfig():PluginConfig;

    }
}//package com.tencent.free.core.plugin

