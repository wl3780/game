// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.impl.PluginManager

package com.tencent.free.core.plugin.impl
{
    import com.tencent.free.core.plugin.IPluginManager;
    import com.tencent.free.core.plugin.PluginConfigManager;
    import flash.utils.Dictionary;
    import flash.events.IEventDispatcher;
    import com.tencent.free.core.cmd.ICmdCollection;
    import com.tencent.free.core.events.FreeEvent;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.core.plugin.IPlugin;
    import com.tencent.free.core.plugin.PluginRequest;
    import com.tencent.free.core.plugin.PluginLoadType;
    import com.tencent.free.core.plugin.IManagerAware;
    import com.tencent.free.core.plugin.PluginConfig;
    import __AS3__.vec.Vector;
    import com.tencent.free.core.plugin.RequireInfo;
    import com.tencent.free.core.cmd.BaseCommand;
    import com.tencent.free.core.cmd.impl.CNFCommand;
    import com.tencent.free.core.cmd.CommandDef;
    import com.tencent.free.logging.warning;
    import  ©init._SafeStr_30;
    import __AS3__.vec.*;

    public class PluginManager implements IPluginManager 
    {

        protected var m_configManager:PluginConfigManager;
        protected var m_pluginMap:Dictionary;
        protected var m_pluginLoader:PluginLoaderArray;
        protected var g_eventDispatcher:IEventDispatcher;
        protected var g_cmdCollection:ICmdCollection;

        public function PluginManager(_arg_1:IEventDispatcher)
        {
            this.g_eventDispatcher = _arg_1;
            this.m_configManager = new PluginConfigManager();
            this.m_pluginMap = new Dictionary();
            this.m_pluginLoader = new PluginLoaderArray(this, this.g_eventDispatcher);
            this.g_cmdCollection = ICmdCollection(_arg_1);
        }

        public function onPluginLoadProgres(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            var _local_4:FreeEvent = new FreeEvent(FreeEvent.PLUGIN_INSTALL_PROGRESS);
            _local_4.data = {
                "url":_arg_1,
                "bytesLoaded":_arg_2,
                "bytesTotal":_arg_3
            };
            this.g_eventDispatcher.dispatchEvent(_local_4);
        }

        public function install(_arg_1:PluginConfig, _arg_2:Array=null):IPlugin
        {
            var _local_4:CLASS;
            var _local_5:IPlugin;
            var _local_6:int;
            var _local_7:PluginRequest;
            var _local_8:FreeEvent;
            var _local_9:Array;
            var _local_10:int;
            var _local_3:int = _arg_1.loadType;
            if (_local_3 == PluginLoadType.LIBS_LOADED){
                _local_4 = (((_arg_1.domainCls)!=null) ? _arg_1.domainCls : CLASS.current);
                _local_5 = (_local_4.newInstance(_arg_1.className) as IPlugin);
                if ((_local_5 is IManagerAware)){
                    IManagerAware(_local_5).setPluginManager(this);
                };
                _local_5.initialize(_arg_1);
                this.addPlugin(_local_5);
                if (_arg_2 != null){
                    _local_6 = 0;
                    while (_local_6 < _arg_2.length) {
                        this.g_cmdCollection.callCommand(_arg_2[_local_6], false);
                        _local_6++;
                    };
                };
                return (_local_5);
            };
            _local_7 = this.m_pluginLoader.getPluginRequest(_arg_1);
            if (_local_7 == null){
                _local_7 = new PluginRequest(_arg_1);
                _local_7.initCommands = _arg_2;
                _local_8 = new FreeEvent(FreeEvent.ON_BEFORE_PLUGIN_LOAD);
                _local_8.data = _local_7;
                this.g_eventDispatcher.dispatchEvent(_local_8);
                this.loadPlugin(_local_7);
            } else {
                _local_9 = _local_7.initCommands;
                _local_10 = 0;
                while (_local_10 < _arg_2.length) {
                    _local_9.push(_arg_2[_local_10]);
                    _local_10++;
                };
            };
            return (null);
        }

        public function addPlugin(_arg_1:IPlugin):void
        {
            var _local_2:PluginConfig = _arg_1.getConfig();
            if (_local_2 == null){
                throw (new Error("[PluginManager] 添加插件的PluginConifg为空"));
            };
            this.m_pluginMap[_local_2.className] = _arg_1;
        }

        public function removePlugin(_arg_1:String):void
        {
            var _local_3:PluginConfig;
            var _local_4:CLASS;
            var _local_5:Vector.<RequireInfo>;
            var _local_6:int;
            var _local_7:RequireInfo;
            var _local_2:IPlugin = this.m_pluginMap[_arg_1];
            if (_local_2 != null){
                _local_3 = _local_2.getConfig();
                _local_2.finalize();
                delete this.m_pluginMap[_arg_1];
                if (_local_3 != null){
                    _local_4 = _local_3.domainCls;
                    if (_local_4 != null){
                        _local_4.dispose();
                        _local_3.domainCls = null;
                    };
                    _local_5 = _local_3.requires;
                    _local_6 = ((((_local_5 == null)) ? 0 : _local_5.length) - 1);
                    while (_local_6 >= 0) {
                        _local_7 = _local_5[_local_6];
                        _local_4 = _local_7.domainCls;
                        if (_local_4 != null){
                            _local_4.dispose();
                            _local_7.domainCls = null;
                        };
                        _local_6--;
                    };
                    _local_3.loadType = PluginLoadType.SYNC_LOAD;
                };
            };
        }

        public function installByClassName(_arg_1:String):IPlugin
        {
            var _local_2:IPlugin = this.getPluginByName(_arg_1);
            if (_local_2 != null){
                return (_local_2);
            };
            var _local_3:PluginConfig = this.m_configManager.getConfigByName(_arg_1);
            if (_local_3 == null){
                return (null);
            };
            return (this.install(_local_3));
        }

        public function hasPlugin(_arg_1:String):Boolean
        {
            return (!((this.m_pluginMap[_arg_1] == null)));
        }

        public function getPluginByName(_arg_1:String):IPlugin
        {
            return (this.m_pluginMap[_arg_1]);
        }

        public function getPluginList():Vector.<IPlugin>
        {
            var _local_2:IPlugin;
            var _local_1:Vector.<IPlugin> = new Vector.<IPlugin>();
            var _local_3:int;
            var _local_4:* = this.m_pluginMap;
            for each (_local_2 in this.m_pluginMap) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        public function loadPlugin(_arg_1:PluginRequest):void
        {
            if (_arg_1.config == null){
                throw (new Error("[PluginManager] 请求加载插件的request.config为空!!"));
            };
            if (_arg_1.progress == null){
                _arg_1.progress = this.onPluginLoadProgres;
            };
            this.m_pluginLoader.loadRequest(_arg_1);
        }

        public function getConfigManager():PluginConfigManager
        {
            return (this.m_configManager);
        }

        public function call(_arg_1:Object=null):void
        {
            var _local_2:BaseCommand;
            var _local_3:PluginConfig;
            var _local_4:IPlugin;
            if ((_arg_1 is CNFCommand)){
                _local_2 = CNFCommand(_arg_1).doCommand;
                _local_3 = this.m_configManager.getConfigByCmdType(_local_2.cmdType);
                if (_local_3 == null){
                    _local_2.cancel(CommandDef.CODE_CONFIG_NOT_FOUND);
                    return;
                };
                _local_4 = this.getPluginByName(_local_3.className);
                if (_local_4 != null){
                    warning("[PluginManager] 插件[", _local_3.label, "]没有注册命[", _local_2.cmdType, "]");
                    _local_4.call(((_local_2.useArgCall) ? _local_2.arg : _local_2));
                    return;
                };
                this.install(_local_3, [_local_2]);
            };
        }

        public function getCmdType():String
        {
            return (CommandDef.CMD_LISNOT_FOUND);
        }

        public /*  ©init. */ function _SafeStr_30()
        {
        }


    }
}//package com.tencent.free.core.plugin.impl

// _SafeStr_30 = " PluginManager" (String#1574)


