package com.tencent.free.core.plugin.impl
{
    import com.tencent.free.core.plugin.IPluginManager;
    import com.tencent.free.core.plugin.PluginConfig;
    import com.tencent.free.core.plugin.PluginRequest;
    import com.tencent.free.core.plugin.impl.*;
    import com.tencent.free.logging.warning;
    
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.events.IEventDispatcher;

    class PluginLoaderArray 
    {

        protected var m_manager:IPluginManager;
        protected var m_requests:Vector.<PluginRequest>;
        protected var m_loader:PluginLoader;

        public function PluginLoaderArray(_arg_1:IPluginManager, _arg_2:IEventDispatcher)
        {
            this.m_manager = _arg_1;
            this.m_requests = new Vector.<PluginRequest>();
            this.m_loader = new PluginLoader(this.m_manager, _arg_2, this);
            this.m_loader.addEventListener(Event.COMPLETE, this.nextLoad);
            this.m_loader.addEventListener(ErrorEvent.ERROR, this.nextLoad);
        }

        protected function nextLoad(_arg_1:Event=null):void
        {
            if (!this.m_loader.isIdel()){
                return;
            };
            if (this.m_requests.length == 0){
                return;
            };
            var _local_2:PluginRequest = this.m_requests.shift();
            if (_local_2.isNull()){
                warning("[PluginLoader] 一个无效的插件请求");
                _local_2 = null;
                this.nextLoad();
                return;
            };
            this.m_loader.start(_local_2);
        }

        public function getPluginRequest(_arg_1:PluginConfig, _arg_2:Boolean=false):PluginRequest
        {
            var _local_3:PluginRequest;
            var _local_4:int;
            var _local_5:PluginRequest;
            if (((!(_arg_2)) && (!((this.m_loader == null))))){
                _local_3 = this.m_loader.getPluginRequest(_arg_1);
            };
            if (_local_3 == null){
                _local_4 = 0;
                while (_local_4 < this.m_requests.length) {
                    _local_5 = this.m_requests[_local_4];
                    if (_local_5.config == _arg_1){
                        _local_3 = _local_5;
                        break;
                    };
                    _local_4++;
                };
            };
            return (_local_3);
        }

        public function loadRequest(_arg_1:PluginRequest):void
        {
            if (_arg_1 != null){
                if (this.getPluginRequest(_arg_1.config) == null){
                    this.m_requests.push(_arg_1);
                    this.nextLoad();
                };
            };
        }

        public function delRequest(_arg_1:PluginRequest):void
        {
            var _local_2:int;
            if (_arg_1 != null){
                _local_2 = this.m_requests.indexOf(_arg_1);
                if (_local_2 != -1){
                    this.m_requests.splice(_local_2, 1);
                } else {
                    if (_arg_1 == this.m_loader.getCurrent()){
                        this.m_loader.cancle();
                        this.nextLoad();
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_28()
        {
        }


    }
}//package com.tencent.free.core.plugin.impl

import com.tencent.free.core.events.FreeEvent;
import com.tencent.free.core.events.SwfLoadEvent;
import com.tencent.free.core.filesystem.XMLLoader;
import com.tencent.free.core.lib.CLASS;
import com.tencent.free.core.lib.DomainType;
import com.tencent.free.core.manager.content.IContent;
import com.tencent.free.core.manager.task.Priority;
import com.tencent.free.core.plugin.IPluginManager;
import com.tencent.free.core.plugin.PluginConfig;
import com.tencent.free.core.plugin.PluginLoadType;
import com.tencent.free.core.plugin.PluginRequest;
import com.tencent.free.core.plugin.RequireInfo;
import com.tencent.free.core.plugin.RequireType;
import com.tencent.free.core.swf.SwfFileLoader;
import com.tencent.free.setup.GLOBAL_DEF;

import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

class PluginLoader extends EventDispatcher 
{

    protected var m_currentRequest:PluginRequest;
    protected var m_currRequireInfo:RequireInfo;
    protected var m_manager:IPluginManager;
    protected var m_root:Object;
    protected var m_gEventDispatcher:IEventDispatcher;
    protected var m_requiresTotal:int = 0;
    protected var m_requiresIndex:int = 0;
    protected var m_state:Function;
    protected var m_progress:Function;
    protected var m_url:String;
    protected var m_key:String;
    protected var m_pluginLibLoader:SwfFileLoader;
    protected var m_requireChildLoader:PluginLoader;
    protected var m_requireLibLoader:SwfFileLoader;
    protected var m_requireXmlLoader:XMLLoader;

    public function PluginLoader(_arg_1:IPluginManager, _arg_2:IEventDispatcher, _arg_3:Object)
    {
        this.m_manager = _arg_1;
        this.m_gEventDispatcher = _arg_2;
        this.m_root = _arg_3;
    }

    protected function loadRequires():void
    {
        var _local_2:CLASS;
        var _local_3:IContent;
        this.m_currRequireInfo = null;
        var _local_1:Vector.<RequireInfo> = this.m_currentRequest.config.requires;
        if ((((_local_1 == null)) || ((this.m_requiresIndex >= _local_1.length)))){
            this.loadPlugin();
        } else {
            this.m_requiresTotal = (_local_1.length + 1);
            this.m_currRequireInfo = _local_1[this.m_requiresIndex];
            this.m_requiresIndex++;
            if (this.m_currRequireInfo.type == RequireType.T_PLUGIN){
                this.loadRequirePlugin(this.m_currRequireInfo);
            } else {
                if (this.m_currRequireInfo.type == RequireType.T_LIB){
                    _local_2 = this.m_currRequireInfo.domainCls;
                    if (((!((_local_2 == null))) && (_local_2.getLibLoader(this.m_currRequireInfo.value)))){
                        this.loadRequires();
                        return;
                    };
                    if (_local_2 == null){
                        _local_2 = (((this.m_currRequireInfo.domain == DomainType.DOMAIN_CHILD)) ? new CLASS(CLASS.current) : CLASS.current);
                        this.m_currRequireInfo.domainCls = _local_2;
                    };
                    this.m_requireLibLoader = _local_2.addLoader(this.m_currRequireInfo.value, this.m_currRequireInfo.value, this.m_currRequireInfo.hash);
                    this.m_requireLibLoader.priority = Priority.PERIORITY_HIGH;
                    _local_3 = this.m_requireLibLoader.content;
                    _local_3.addEventListener(SwfLoadEvent.PROGRESS, this.onProgress);
                    _local_3.addEventListener(SwfLoadEvent.ERROR, this.requireLibState);
                    _local_3.addEventListener(SwfLoadEvent.COMPLETE, this.requireLibState);
                    this.m_requireLibLoader.load();
                } else {
                    if (this.m_currRequireInfo.type == RequireType.T_CONFIG){
                        if (this.m_requireXmlLoader == null){
                            this.m_requireXmlLoader = new XMLLoader();
                            this.m_requireXmlLoader.addEventListener(ErrorEvent.ERROR, this.requireConfigEvent);
                            this.m_requireXmlLoader.addEventListener(Event.COMPLETE, this.requireConfigEvent);
                        } else {
                            this.m_requireXmlLoader.addEventListener(ErrorEvent.ERROR, this.requireConfigEvent);
                            this.m_requireXmlLoader.addEventListener(Event.COMPLETE, this.requireConfigEvent);
                        };
                        this.m_requireXmlLoader.load(this.m_currRequireInfo.value, this.m_currRequireInfo.hash);
                    };
                };
            };
        };
        if (this.m_state != null){
            this.m_state(PluginRequest.CODE_PROGRESS, this.m_url, {
                "total":this.m_requiresTotal,
                "loaded":this.m_requiresIndex
            });
        };
    }

    protected function onProgress(_arg_1:SwfLoadEvent):void
    {
        if (this.m_progress != null){
            this.m_progress(_arg_1.url, _arg_1.bytesLoaded, _arg_1.bytesTotal);
        };
    }

    protected function requireLibState(_arg_1:SwfLoadEvent):void
    {
        var _local_2:int = _arg_1.code;
        var _local_3:IContent = this.m_requireLibLoader.content;
        _local_3.removeEventListener(SwfLoadEvent.PROGRESS, this.onProgress);
        _local_3.removeEventListener(SwfLoadEvent.ERROR, this.requireLibState);
        _local_3.removeEventListener(SwfLoadEvent.COMPLETE, this.requireLibState);
        if (_local_2 == SwfLoadEvent.CODE_SUCCESS){
            this.loadRequires();
        } else {
            this.onThisPluginError((("插件依赖的类包[" + this.m_url) + "]加载失败"));
        };
    }

    protected function requireConfigEvent(_arg_1:Event):void
    {
        this.m_requireXmlLoader.removeEventListener(ErrorEvent.ERROR, this.requireConfigEvent);
        this.m_requireXmlLoader.removeEventListener(Event.COMPLETE, this.requireConfigEvent);
        this.m_currRequireInfo.content = this.m_requireXmlLoader.data;
        this.m_requireXmlLoader.unload();
        switch (_arg_1.type){
            case Event.COMPLETE:
                this.m_currRequireInfo.content = GLOBAL_DEF.REPLACE(String(this.m_currRequireInfo.content));
                this.loadRequires();
                return;
            case ErrorEvent.ERROR:
                this.onThisPluginError((_arg_1 as ErrorEvent).text);
                return;
        };
    }

    protected function requirePluginEvent(_arg_1:Event):void
    {
        switch (_arg_1.type){
            case Event.COMPLETE:
                this.loadRequires();
                return;
            case ErrorEvent.ERROR:
                this.onThisPluginError((_arg_1 as ErrorEvent).text);
                return;
        };
    }

    protected function loadRequirePlugin(_arg_1:RequireInfo):void
    {
        var _local_2:String = _arg_1.value;
        if (this.m_manager.hasPlugin(_local_2)){
            this.loadRequires();
            return;
        };
        var _local_3:PluginConfig = this.m_manager.getConfigManager().getConfigByName(_local_2);
        if (_local_3 == null){
            this.onThisPluginError((("插件依赖项[" + _local_2) + "]加载失败!"));
            return;
        };
        if (this.m_requireChildLoader == null){
            this.m_requireChildLoader = new PluginLoader(this.m_manager, this.m_gEventDispatcher, this.m_root);
            this.m_requireChildLoader.addEventListener(Event.COMPLETE, this.requirePluginEvent);
            this.m_requireChildLoader.addEventListener(ErrorEvent.ERROR, this.requirePluginEvent);
        };
        var _local_4:PluginRequest = this.m_root.getPluginRequest(_local_3, true);
        if (_local_4 == null){
            _local_4 = new PluginRequest(_local_3);
        };
        this.m_requireChildLoader.start(_local_4);
    }

    protected function loadPlugin():void
    {
        if (this.m_state != null){
            this.m_state(PluginRequest.CODE_PROGRESS, this.m_url, {
                "total":this.m_requiresTotal,
                "loaded":this.m_requiresIndex
            });
        };
        var _local_1:PluginConfig = this.m_currentRequest.config;
        var _local_2:CLASS = _local_1.domainCls;
        if (_local_2 == null){
            _local_2 = (((_local_1.domain == DomainType.DOMAIN_CHILD)) ? new CLASS(CLASS.current) : CLASS.current);
            _local_1.domainCls = _local_2;
        };
        this.m_pluginLibLoader = _local_2.addLoader(this.m_key, this.m_url, this.m_currentRequest.hash);
        this.m_pluginLibLoader.priority = Priority.PERIORITY_HIGH;
        this.m_pluginLibLoader.setSwfBytes(this.m_currentRequest.bytes);
        var _local_3:IContent = this.m_pluginLibLoader.content;
        _local_3.addEventListener(SwfLoadEvent.PROGRESS, this.onProgress);
        _local_3.addEventListener(SwfLoadEvent.ERROR, this.pluginLibState);
        _local_3.addEventListener(SwfLoadEvent.COMPLETE, this.pluginLibState);
        this.m_pluginLibLoader.load();
    }

    protected function pluginLibState(_arg_1:SwfLoadEvent):void
    {
        var _local_4:FreeEvent;
        var _local_2:int = _arg_1.code;
        var _local_3:IContent = this.m_pluginLibLoader.content;
        _local_3.removeEventListener(SwfLoadEvent.PROGRESS, this.onProgress);
        _local_3.removeEventListener(SwfLoadEvent.ERROR, this.pluginLibState);
        _local_3.removeEventListener(SwfLoadEvent.COMPLETE, this.pluginLibState);
        if (_local_2 == SwfLoadEvent.CODE_SUCCESS){
            this.m_currentRequest.config.loadType = PluginLoadType.LIBS_LOADED;
            this.m_manager.install(this.m_currentRequest.config, this.m_currentRequest.initCommands);
            if (this.m_state != null){
                this.m_state(PluginRequest.CODE_COMPLETE, this.m_url);
            };
            _local_4 = new FreeEvent(FreeEvent.PLUGIN_INSTALL_COMPLETE);
            _local_4.data = this.m_currentRequest;
            this.reset();
            dispatchEvent(new Event(Event.COMPLETE));
            this.m_gEventDispatcher.dispatchEvent(_local_4);
        } else {
            this.onThisPluginError("插件加载失败!");
        };
    }

    protected function onThisPluginError(_arg_1:String):void
    {
        if (this.m_state != null){
            this.m_state(PluginRequest.CODE_ERROR, this.m_url, _arg_1);
        };
        var _local_2:FreeEvent = new FreeEvent(FreeEvent.PLUGIN_INSTALL_ERROR);
        _local_2.data = this.m_currentRequest;
        _local_2.message = _arg_1;
        this.reset();
        dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
        this.m_gEventDispatcher.dispatchEvent(_local_2);
    }

    public function getPluginRequest(_arg_1:PluginConfig):PluginRequest
    {
        var _local_2:PluginRequest;
        if (((!((this.m_currentRequest == null))) && ((this.m_currentRequest.config == _arg_1)))){
            _local_2 = this.m_currentRequest;
        } else {
            if (this.m_requireChildLoader != null){
                _local_2 = this.m_requireChildLoader.getPluginRequest(_arg_1);
            };
        };
        return (_local_2);
    }

    public function isIdel():Boolean
    {
        return ((this.m_currentRequest == null));
    }

    public function getCurrent():PluginRequest
    {
        return (this.m_currentRequest);
    }

    public function start(_arg_1:PluginRequest):void
    {
        if (this.m_manager.hasPlugin(_arg_1.config.className)){
            if (_arg_1.state != null){
                _arg_1.state(PluginRequest.CODE_COMPLETE, _arg_1.url);
            };
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        };
        this.m_currentRequest = _arg_1;
        this.m_requiresIndex = 0;
        this.m_currRequireInfo = null;
        this.m_state = this.m_currentRequest.state;
        this.m_progress = this.m_currentRequest.progress;
        this.m_key = this.m_currentRequest.key;
        this.m_url = this.m_currentRequest.url;
        this.loadRequires();
    }

    public function cancle():void
    {
        if (this.m_requireLibLoader != null){
            CLASS.current.removeLoader(String(this.m_requireLibLoader.key));
        };
        if (this.m_pluginLibLoader != null){
            CLASS.current.removeLoader(String(this.m_pluginLibLoader.key));
        };
        if (this.m_requireChildLoader != null){
            this.m_requireChildLoader.cancle();
        };
        this.reset();
    }

    public function reset():void
    {
        this.m_currentRequest = null;
        this.m_state = null;
        this.m_progress = null;
        this.m_key = "";
        this.m_url = "";
        this.m_requiresTotal = 0;
        this.m_requiresIndex = 0;
        this.m_currRequireInfo = null;
        this.m_requireLibLoader = null;
        this.m_pluginLibLoader = null;
        if (this.m_requireChildLoader != null){
            this.m_requireChildLoader.reset();
        };
    }

    public /*  ©init. */ function _SafeStr_29()
    {
    }


}

// _SafeStr_28 = " PluginLoaderArray" (String#1586)
// _SafeStr_29 = " PluginLoader" (String#1589)


