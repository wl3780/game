// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.LoaderConfs

package com.tencent.free.setup
{
    import com.tencent.free.phase.IPhase;
    import com.tencent.free.phase.IPhaseListener;
    import __AS3__.vec.Vector;
    import com.tencent.free.setup.data.ConfDef;
    import flash.utils.Dictionary;
    import com.tencent.free.core.filesystem.FileLoader;
    import com.tencent.free.mff.MFF;
    import com.tencent.free.mff.MFFFile;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.logging.logToLabel;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.utils.XString;
    import flash.utils.ByteArray;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.filesystem.IFile;
    import  ©init._SafeStr_63;

    public class LoaderConfs implements IPhase 
    {

        protected var m_globalXML:LoaderGlobal;
        protected var m_listener:IPhaseListener;
        protected var m_completed:Boolean = false;
        protected var m_confs:Vector.<ConfDef>;
        protected var m_packFiles:Dictionary;
        protected var m_index:int = 0;
        protected var m_total:int = 0;
        protected var m_conf:ConfDef;
        protected var m_fileloader:FileLoader;

        public function LoaderConfs(_arg_1:LoaderGlobal)
        {
            this.m_globalXML = _arg_1;
        }

        protected function next():void
        {
            var _local_4:MFF;
            var _local_5:String;
            var _local_6:MFFFile;
            var _local_7:IContent;
            if ((((this.m_confs == null)) || ((this.m_index >= this.m_total)))){
                logToLabel("");
                this.m_completed = true;
                this.m_listener.next();
                return;
            };
            this.m_conf = this.m_confs[this.m_index];
            this.m_index++;
            var _local_1:Boolean;
            var _local_2:String = Redirect.redirect(this.m_conf.src);
            var _local_3:String = XString.getURLExtension(_local_2);
            if (_local_3 == "mff"){
                _local_4 = this.m_packFiles[_local_2];
                if (_local_4){
                    _local_5 = this.m_conf.src.replace(/\\/, "/");
                    _local_5 = _local_5.substring((_local_5.indexOf("conf/") + 5));
                    _local_6 = _local_4.getMMFFileByName(_local_5);
                    if (_local_6){
                        _local_6.mffBytes.position = 0;
                        this.m_conf.byteArray = new ByteArray();
                        _local_6.mffBytes.readBytes(this.m_conf.byteArray);
                        _local_1 = true;
                        this.next();
                    };
                };
            };
            if (!_local_1){
                logToLabel((("正在加载[" + this.m_conf.name) + "]"));
                this.m_fileloader = new FileLoader(this.m_conf.src);
                this.m_fileloader.url = this.m_conf.src;
                this.m_fileloader.hash = this.m_conf.hash;
                this.m_fileloader.saveSO = true;
                _local_7 = this.m_fileloader.content;
                _local_7.addEventListener(TaskEvent.COMPLETE, this.onLoadCode);
                _local_7.addEventListener(TaskEvent.IO_ERROR, this.onLoadCode);
                _local_7.addEventListener(TaskEvent.CHECK_ERROR, this.onLoadCode);
                _local_7.addEventListener(TaskEvent.SECURITY_ERROR, this.onLoadCode);
                _local_7.addEventListener(TaskEvent.PROGRESS, this.onLoadProgress);
                this.m_fileloader.load();
            };
        }

        public function onLoadCode(_arg_1:TaskEvent):void
        {
            var _local_3:ByteArray;
            var _local_4:String;
            var _local_5:MFF;
            var _local_6:int;
            var _local_7:String;
            var _local_8:MFFFile;
            var _local_2:IContent = this.m_fileloader.content;
            _local_2.removeEventListener(TaskEvent.COMPLETE, this.onLoadCode);
            _local_2.removeEventListener(TaskEvent.IO_ERROR, this.onLoadCode);
            _local_2.removeEventListener(TaskEvent.CHECK_ERROR, this.onLoadCode);
            _local_2.removeEventListener(TaskEvent.SECURITY_ERROR, this.onLoadCode);
            _local_2.removeEventListener(TaskEvent.PROGRESS, this.onLoadProgress);
            if (_arg_1.type == TaskEvent.COMPLETE){
                _local_3 = IFile(_local_2).bytes;
                _local_3.position = 0;
                _local_4 = XString.getURLExtension(Redirect.redirect(this.m_fileloader.url));
                if (_local_4 == "mff"){
                    _local_5 = new MFF();
                    _local_5.decode(_local_3);
                    _local_6 = _local_5.getErrorCode();
                    if (_local_6 == 0){
                        _local_7 = this.m_conf.src.replace(/\\/, "/");
                        _local_7 = _local_7.substring((_local_7.indexOf("conf/") + 5));
                        _local_8 = _local_5.getMMFFileByName(_local_7);
                        if (_local_8){
                            _local_8.mffBytes.position = 0;
                            this.m_conf.byteArray = new ByteArray();
                            _local_8.mffBytes.readBytes(this.m_conf.byteArray);
                            this.m_packFiles[Redirect.redirect(this.m_fileloader.url)] = _local_5;
                        } else {
                            this.m_listener.error(((("[" + this.m_conf.name) + "] 压缩配置文件中找不到文件:") + this.m_conf.src));
                        };
                    } else {
                        this.m_listener.error(((("[" + this.m_conf.name) + "] 压缩配置文件解压失败，错误码:") + _local_6));
                    };
                } else {
                    this.m_conf.byteArray = _local_3;
                    this.m_conf.byteArray = new ByteArray();
                    _local_3.readBytes(this.m_conf.byteArray);
                };
                this.m_listener.progress(((this.m_index / this.m_total) * 100), this.m_index, this.m_total);
                this.m_fileloader.unload();
                this.m_fileloader = null;
                this.next();
            } else {
                this.m_listener.error(((("[" + this.m_conf.name) + "]配置文件加载失败错类型:") + _arg_1.type));
            };
        }

        public function onLoadProgress(_arg_1:TaskEvent):void
        {
            this.m_listener.progress(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100), 1, 1);
        }

        public function start():void
        {
            this.m_confs = this.m_globalXML.getConfs();
            this.m_index = 0;
            this.m_total = (((this.m_confs == null)) ? 0 : this.m_confs.length);
            this.m_packFiles = new Dictionary();
            this.next();
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
            return ("加载配置文件集");
        }

        public function unload():void
        {
            var _local_1:MFF;
            this.m_index = 0;
            this.m_total = 0;
            this.m_conf = null;
            var _local_2:int;
            var _local_3:* = this.m_packFiles;
            for each (_local_1 in this.m_packFiles) {
                _local_1.dispose();
            };
            this.m_packFiles = null;
        }

        public /*  ©init. */ function _SafeStr_63()
        {
        }


    }
}//package com.tencent.free.setup

// _SafeStr_63 = " LoaderConfs" (String#1547)


