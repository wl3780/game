// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.PluginConfigManager

package com.tencent.free.core.plugin
{
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_33;
    import __AS3__.vec.*;

    public class PluginConfigManager 
    {

        protected var m_configClass:Class;
        protected var m_pluginConfigs:Dictionary;

        public function PluginConfigManager()
        {
            this.m_configClass = PluginConfig;
            super();
            this.m_pluginConfigs = new Dictionary();
        }

        protected function newConfigInstance():PluginConfig
        {
            return ((new this.m_configClass() as PluginConfig));
        }

        public function decodeXML(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:PluginConfig;
            if (_arg_1 == null){
                return;
            };
            var _local_2:XMLList = _arg_1.Plugin;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = this.newConfigInstance();
                    _local_5.decodeXML(_local_2[_local_4]);
                    this.addConfig(_local_5);
                    _local_4++;
                };
            };
        }

        public function encodeXML():String
        {
            return ("");
        }

        public function setConfigClass(_arg_1:Class):void
        {
            if (_arg_1 == null){
                return;
            };
            this.m_configClass = _arg_1;
        }

        public function getConfigByCmdType(_arg_1:String):PluginConfig
        {
            return (this.m_pluginConfigs[_arg_1]);
        }

        public function getConfigByName(_arg_1:String):PluginConfig
        {
            return (this.m_pluginConfigs[_arg_1]);
        }

        public function getConfigsByLoadType(_arg_1:int):Vector.<PluginConfig>
        {
            var _local_3:PluginConfig;
            var _local_2:Vector.<PluginConfig> = new Vector.<PluginConfig>();
            for each (_local_3 in this.m_pluginConfigs) {
                if ((((_local_3.loadType == _arg_1)) && ((_local_2.indexOf(_local_3) == -1)))){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        public function addConfig(_arg_1:PluginConfig):void
        {
            if (this.m_pluginConfigs[_arg_1.className] != null){
                return;
            };
            if (_arg_1.cmdType != ""){
                this.m_pluginConfigs[_arg_1.cmdType] = _arg_1;
            };
            this.m_pluginConfigs[_arg_1.className] = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_33()
        {
        }


    }
}//package com.tencent.free.core.plugin

// _SafeStr_33 = " PluginConfigManager" (String#1541)


