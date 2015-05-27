// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.LoaderGlobal

package com.tencent.free.setup
{
    import flash.events.EventDispatcher;
    import com.tencent.free.phase.IPhase;
    import com.tencent.free.phase.IPhaseListener;
    import com.tencent.free.core.filesystem.XMLLoader;
    import __AS3__.vec.Vector;
    import com.tencent.free.setup.data.AttrDef;
    import com.tencent.free.setup.data.ServerInfoDef;
    import com.tencent.free.setup.data.ConfDef;
    import com.tencent.free.setup.data.LibDef;
    import com.tencent.free.core.manager.task.Priority;
    import flash.events.Event;
    import flash.events.ErrorEvent;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_64;
    import __AS3__.vec.*;

    public class LoaderGlobal extends EventDispatcher implements IPhase 
    {

        protected var m_isCache:Boolean;
        protected var m_listener:IPhaseListener;
        protected var m_xmlloader:XMLLoader;
        protected var m_key:String;
        protected var m_url:String;
        protected var m_completed:Boolean = false;
        protected var m_version:String;
        protected var m_appClass:String;
        protected var m_attrs:Vector.<AttrDef>;
        protected var m_serverInfo:ServerInfoDef;
        protected var m_confs:Vector.<ConfDef>;
        protected var m_libs:Vector.<LibDef>;

        public function LoaderGlobal(_arg_1:String, _arg_2:Boolean=false)
        {
            this.m_isCache = _arg_2;
            this.m_xmlloader = new XMLLoader(Priority.PERIORITY_HIGH, false);
            this.m_xmlloader.addEventListener(Event.COMPLETE, this.onLoadCode);
            this.m_xmlloader.addEventListener(ErrorEvent.ERROR, this.onLoadCode);
            this.setURL(_arg_1);
        }

        public function decodeXML(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XML;
            var _local_5:XMLList;
            var _local_6:String;
            var _local_7:XML;
            this.m_version = _arg_1.@version;
            this.m_appClass = _arg_1.@appClass;
            _local_4 = _arg_1.Libs[0];
            if (_local_4 != null){
                this.m_libs = new Vector.<LibDef>();
                _local_6 = String(_local_4.@src);
                _local_5 = _local_4.Lib;
                _local_3 = _local_5.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_5[_local_2];
                    this.m_libs.push(new LibDef(String(_local_4.@name), (_local_6 + String(_local_4.@src)), String(_local_4.@hash), String(_local_4.@key)));
                    _local_2++;
                };
            };
            _local_4 = _arg_1.DEFINE[0];
            if (_local_4 != null){
                _local_5 = _local_4.ATTR;
                this.m_attrs = new Vector.<AttrDef>();
                _local_3 = _local_5.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_5[_local_2];
                    this.m_attrs.push(new AttrDef(String(_local_4.@name), String(_local_4.@type), String(_local_4.@value)));
                    _local_2++;
                };
            };
            _local_4 = _arg_1.ServerInfo[0];
            this.m_serverInfo = new ServerInfoDef();
            if (_local_4 != null){
                _local_7 = _local_4;
                _local_4 = _local_7.DirServer[0];
                if (_local_4 != null){
                    this.m_serverInfo.DirServer.host = String(_local_4.@host);
                    this.m_serverInfo.DirServer.port = int(_local_4.@port);
                };
                _local_4 = _local_7.RoleListServer[0];
                if (_local_4 != null){
                    this.m_serverInfo.RoleListServer.host = String(_local_4.@host);
                    this.m_serverInfo.RoleListServer.port = int(_local_4.@port);
                };
                _local_4 = _local_7.RegServer[0];
                if (_local_4 != null){
                    this.m_serverInfo.RegServer.host = String(_local_4.@host);
                    this.m_serverInfo.RegServer.port = int(_local_4.@port);
                };
                _local_4 = _local_7.CrossDomain[0];
                if (_local_4 != null){
                    this.m_serverInfo.CrossDomain.host = String(_local_4.@host);
                    this.m_serverInfo.CrossDomain.port = int(_local_4.@port);
                };
                _local_4 = _local_7.DefaultServer1[0];
                if (_local_4){
                    this.m_serverInfo.DefaultServer1.host = String(_local_4.@host);
                    this.m_serverInfo.DefaultServer1.port = int(_local_4.@port);
                };
                _local_4 = _local_7.DefaultServer2[0];
                if (_local_4){
                    this.m_serverInfo.DefaultServer2.host = String(_local_4.@host);
                    this.m_serverInfo.DefaultServer2.port = int(_local_4.@port);
                };
                _local_4 = _local_7.DefaultServer3[0];
                if (_local_4){
                    this.m_serverInfo.DefaultServer3.host = String(_local_4.@host);
                    this.m_serverInfo.DefaultServer3.port = int(_local_4.@port);
                };
                _local_4 = _local_7.P2PServer[0];
                if (_local_4){
                    this.m_serverInfo.P2PServer.host = String(_local_4.@host);
                    this.m_serverInfo.P2PServer.port = int(_local_4.@port);
                };
            };
            _local_4 = _arg_1.Confs[0];
            if (_local_4 != null){
                this.m_confs = new Vector.<ConfDef>();
                _local_5 = _local_4.Conf;
                _local_3 = _local_5.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_5[_local_2];
                    this.m_confs.push(new ConfDef(String(_local_4.@name), String(_local_4.@key), String(_local_4.@src), String(_local_4.@hash), (String(_local_4.@compress) == "true")));
                    _local_2++;
                };
            };
        }

        public function setURL(_arg_1:String):void
        {
            this.m_key = (_arg_1 + ((this.m_isCache) ? "" : (("?" + new Date().time))));
            this.m_url = this.m_key;
        }

        public function getURL():String
        {
            return (this.m_url);
        }

        public function getVersion():String
        {
            return (this.m_version);
        }

        public function getAppClass():String
        {
            return (this.m_appClass);
        }

        public function getLibs():Vector.<LibDef>
        {
            return (this.m_libs);
        }

        public function getATTRs():Vector.<AttrDef>
        {
            return (this.m_attrs);
        }

        public function getServerInfo():ServerInfoDef
        {
            return (this.m_serverInfo);
        }

        public function getConfs():Vector.<ConfDef>
        {
            return (this.m_confs);
        }

        public function start():void
        {
            this.m_xmlloader.load(this.m_url);
        }

        public function onLoadCode(_arg_1:Event):void
        {
            var _local_2:String;
            if (_arg_1.type == Event.COMPLETE){
                _local_2 = String(this.m_xmlloader.data);
                _local_2 = GLOBAL_DEF.REPLACE(_local_2);
                this.decodeXML(new XML(_local_2));
                this.m_completed = true;
                this.m_listener.next();
            } else {
                this.m_listener.error(("全局配置文件加载失败，错误事件:" + _arg_1.type));
            };
        }

        public function onLoadProgress(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
        }

        public function isCompleted():Boolean
        {
            return (this.m_completed);
        }

        public function setListener(_arg_1:IPhaseListener):void
        {
            this.m_listener = _arg_1;
        }

        public function getMessage():String
        {
            return ("加载全局配置文件");
        }

        public function unload():void
        {
            if (this.m_xmlloader){
                this.m_xmlloader.removeEventListener(Event.COMPLETE, this.onLoadCode);
                this.m_xmlloader.removeEventListener(ErrorEvent.ERROR, this.onLoadCode);
                this.m_xmlloader.unload();
                this.m_xmlloader = null;
            };
        }

        public function collection(_arg_1:Boolean=true):Dictionary
        {
            var _local_2:Dictionary = new Dictionary();
            _local_2[GLOBAL_DEF.CONFIG_DEFINE] = this.m_attrs;
            _local_2[GLOBAL_DEF.CONFIG_SERVER_INFO] = this.m_serverInfo;
            _local_2[GLOBAL_DEF.CONFIG_CONFS] = this.m_confs;
            if (_arg_1){
                this.m_libs = null;
                this.m_attrs = null;
                this.m_serverInfo = null;
                this.m_confs = null;
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_64()
        {
        }


    }
}//package com.tencent.free.setup

// _SafeStr_64 = " LoaderGlobal" (String#1463)


