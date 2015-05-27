package com.tencent.free
{
    import com.tencent.free.core.cmd.BaseCommand;
    import com.tencent.free.core.cmd.CommandDef;
    import com.tencent.free.core.cmd.ICmdCollection;
    import com.tencent.free.core.cmd.ICmdListener;
    import com.tencent.free.core.cmd.impl.CNFCommand;
    import com.tencent.free.core.events.FreeEvent;
    import com.tencent.free.core.extension.IExtensionRegistry;
    import com.tencent.free.core.extension.impl.ExtensionRegistry;
    import com.tencent.free.core.plugin.IPluginManager;
    import com.tencent.free.core.plugin.PluginConfigManager;
    import com.tencent.free.core.plugin.impl.PluginManager;
    import com.tencent.free.setup.GLOBAL_DEF;
    
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;

    public class Free extends EventDispatcher implements ICmdCollection 
    {

        public static const VERSION:String = "20110303";
        private static var _INSTANCE:Free;

        private var _cmdListeners:Dictionary;
        private var _extensionRegistry:ExtensionRegistry;
        private var _pluginManager:PluginManager;

        public function Free()
        {
            if (_INSTANCE != null){
                throw (new Error("[com.tencent.free.Free]单例类不可创建更多的实例!"));
            };
        }

        public static function get Default():Free
        {
            if (_INSTANCE == null){
                _INSTANCE = new (Free)();
            };
            return (_INSTANCE);
        }


        public function initialize(_arg_1:Object=null):void
        {
            this._cmdListeners = new Dictionary();
            this._extensionRegistry = new ExtensionRegistry();
            this._pluginManager = new PluginManager(this);
            this.registerCmd(this._pluginManager.getCmdType(), this._pluginManager);
            if (_arg_1 == null){
                return;
            };
            var _local_2:PluginConfigManager = this._pluginManager.getConfigManager();
            if (_arg_1.configClass != null){
                _local_2.setConfigClass(_arg_1.configClass);
            };
            if ((_arg_1.configXML is XML)){
                _local_2.decodeXML(_arg_1.configXML);
            } else {
                if ((_arg_1.configString is String)){
                    _local_2.decodeXML(new XML(GLOBAL_DEF.REPLACE(_arg_1.configString)));
                };
            };
        }

        public function registerCmd(_arg_1:String, _arg_2:ICmdListener):void
        {
            if (_arg_2 == null){
                throw (new Error("注册的CMDLISTENER不是ICmdListener!!"));
            };
            if (this._cmdListeners[_arg_1] != null){
                throw (new Error((("注册两个ICmdListener都注册了" + _arg_1) + "的侦听!")));
            };
            this._cmdListeners[_arg_1] = _arg_2;
        }

        public function hasCmd(_arg_1:String):Boolean
        {
            return (!((this._cmdListeners[_arg_1] == null)));
        }

        public function unregisterCmd(_arg_1:String):void
        {
            delete this._cmdListeners[_arg_1];
        }

        public function call(_arg_1:String, _arg_2:Object=null):void
        {
            this.callCommand(new BaseCommand(_arg_1, _arg_2, true));
        }

        public function callCommand(_arg_1:BaseCommand, _arg_2:Boolean=true):void
        {
            var _local_5:FreeEvent;
            var _local_3:String = _arg_1.cmdType;
            var _local_4:ICmdListener = this._cmdListeners[_local_3];
            if (_local_4 != null){
                if (!_arg_1.isValid){
                    return;
                };
                _local_4.call(((_arg_1.useArgCall) ? _arg_1.arg : (_arg_1)));
                _local_5 = new FreeEvent(FreeEvent.ON_AFTER_CMD_CALL);
                _local_5.data = _arg_1;
                dispatchEvent(_local_5);
                return;
            };
            if (((_arg_2) && (!((_local_3 == CommandDef.CMD_LISNOT_FOUND))))){
                this.callCommand(new CNFCommand(_arg_1));
            };
        }

        public function getExtensionRegistry():IExtensionRegistry
        {
            return (this._extensionRegistry);
        }

        public function getPluginManager():IPluginManager
        {
            return (this._pluginManager);
        }

    }

    import com.tencent.free.core.plugin.BasePlugin;

    BasePlugin;
}