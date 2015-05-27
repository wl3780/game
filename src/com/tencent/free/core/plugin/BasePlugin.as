// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.BasePlugin

package com.tencent.free.core.plugin
{
    import flash.events.EventDispatcher;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_31;

    public class BasePlugin extends EventDispatcher implements IPlugin, IManagerAware 
    {

        protected var config:PluginConfig;
        protected var cmdType:String;
        protected var m_manager:IPluginManager;
        protected var m_domainClass:CLASS;


        public function initialize(_arg_1:PluginConfig):void
        {
            this.config = _arg_1;
            this.m_domainClass = (((_arg_1.domainCls == null)) ? CLASS.current : _arg_1.domainCls);
        }

        public function finalize():void
        {
        }

        public function setPluginManager(_arg_1:IPluginManager):void
        {
            this.m_manager = _arg_1;
        }

        public function getPluginManager():IPluginManager
        {
            return (this.m_manager);
        }

        public function uninstall():void
        {
            if (this.config != null){
                this.m_manager.removePlugin(this.config.className);
            } else {
                error((("[BasePlugin] " + this) + "没有配置文件"));
            };
        }

        public function getDomainClass():CLASS
        {
            return (this.m_domainClass);
        }

        public function getConfig():PluginConfig
        {
            return (this.config);
        }

        public function call(_arg_1:Object=null):void
        {
        }

        public function getCmdType():String
        {
            return (this.cmdType);
        }

        public /*  ©init. */ function _SafeStr_31()
        {
        }


    }
}//package com.tencent.free.core.plugin

// _SafeStr_31 = " BasePlugin" (String#1382)


