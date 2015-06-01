package com.tencent.free.core.swf.impl
{
    import com.tencent.free.core.events.SwfLoadEvent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.filesystem.FileLoader;
    import com.tencent.free.core.filesystem.IFile;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.core.swf.ISwf;
    import com.tencent.free.logging.logToServer;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.utils.Schedule;
    
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.system.LoaderContext;
    import flash.utils.ByteArray;

    public class SwfFile extends Task implements ISwf 
    {

        protected var m_lc:LoaderContext;
        protected var m_bytes:ByteArray;
        protected var m_realBytes:ByteArray;
        protected var m_decodeFunc:Function;
        protected var m_swffileDecoder:SwfFileDecoder;
        protected var m_content:DisplayObject;
        protected var m_fileLoader:FileLoader;

        public function SwfFile(_arg_1:*)
        {
            super(_arg_1);
        }

        private function useSwfLoader(_arg_1:Boolean):void
        {
            var _local_2:ByteArray;
            if (this.m_swffileDecoder){
                if (_arg_1){
                    this.m_swffileDecoder.addEventListener(Event.COMPLETE, this.onSwfComplete);
                    this.m_swffileDecoder.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSwfError);
                    this.m_swffileDecoder.addEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
                    this.clearBytes();
                    if (this.m_decodeFunc != null){
                        _local_2 = this.m_decodeFunc(this.m_bytes, key);
                    } else {
                        _local_2 = this.m_bytes;
                    };
                    this.m_realBytes = new ByteArray();
                    _local_2.position = 0;
                    _local_2.readBytes(this.m_realBytes);
                    this.m_realBytes.position = 0;
                    this.m_swffileDecoder.loadBytes(this.m_realBytes, this.m_lc);
                } else {
                    this.m_swffileDecoder.removeEventListener(Event.COMPLETE, this.onSwfComplete);
                    this.m_swffileDecoder.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSwfError);
                    this.m_swffileDecoder.removeEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
                    this.m_swffileDecoder.unload();
                    this.m_swffileDecoder = null;
                    this.m_bytes = null;
                };
            };
        }

        private function clearBytes():void
        {
            var _local_1:int;
            if (this.m_realBytes){
                _local_1 = 0;
                while (_local_1 < 7) {
                    this.m_realBytes[_local_1] = Math.round(10);
                    _local_1++;
                };
                this.m_realBytes.clear();
                this.m_realBytes = null;
            };
        }

        private function onSwfComplete(_arg_1:Event):void
        {
            this.clearBytes();
            this.m_content = this.m_swffileDecoder.content;
            this.m_swffileDecoder.removeEventListener(Event.COMPLETE, this.onSwfComplete);
            this.m_swffileDecoder.removeEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
            this.m_swffileDecoder.unload();
            this.onSwfLoaded();
        }

        private function onSwfLoaded():void
        {
            _isLoaded = true;
            var _local_1:SwfLoadEvent = new SwfLoadEvent(SwfLoadEvent.COMPLETE);
            _local_1.key = _key;
            _local_1.url = _url;
            dispatchEvent(_local_1);
            onTaskEnd();
        }

        private function onSwfError(_arg_1:*):void
        {
            if (((!((this._url == null))) && (!((this._url == ""))))){
                logToServer([1, 3], [this._url, Redirect.redirect(this._url)]);
            } else {
                logToServer([1, 3], [this._key, this._key]);
            };
            this.clearBytes();
            var _local_2:SwfLoadEvent = new SwfLoadEvent(SwfLoadEvent.ERROR);
            _local_2.key = _key;
            _local_2.url = _url;
            _local_2.code = SwfLoadEvent.CODE_IO_ERROR;
            _local_2.message = "文件流错误";
            dispatchEvent(_local_2);
            onTaskEnd();
        }

        private function useFileLoader(_arg_1:Boolean):void
        {
            if (this.m_fileLoader != null){
                if (_arg_1){
                    this.m_fileLoader.content.addEventListener(TaskEvent.COMPLETE, this.onFileLoaded);
                    this.m_fileLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onFileError);
                    this.m_fileLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onFileError);
                    this.m_fileLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onFileError);
                    this.m_fileLoader.content.addEventListener(TaskEvent.PROGRESS, this.onFileProgress);
                    this.m_fileLoader.load();
                } else {
                    this.m_fileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onFileLoaded);
                    this.m_fileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onFileError);
                    this.m_fileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onFileError);
                    this.m_fileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onFileError);
                    this.m_fileLoader.content.removeEventListener(TaskEvent.PROGRESS, this.onFileProgress);
                    this.m_fileLoader.unload();
                    this.m_fileLoader = null;
                };
            };
        }

        private function onFileLoaded(_arg_1:TaskEvent):Boolean
        {
            if (this.m_fileLoader != null){
                if (this.m_fileLoader.content.isLoaded()){
                    this.m_bytes = IFile(this.m_fileLoader.content).bytes;
                    this.useSwfLoader(true);
                    this.useFileLoader(false);
                    return (true);
                };
            };
            return (false);
        }

        private function onFileError(_arg_1:TaskEvent):void
        {
            var _local_2:SwfLoadEvent = new SwfLoadEvent(SwfLoadEvent.ERROR);
            _local_2.key = _key;
            _local_2.url = _url;
            switch (_arg_1.type){
                case TaskEvent.IO_ERROR:
                    _local_2.code = SwfLoadEvent.CODE_IO_ERROR;
                    _local_2.message = "文件流错误";
                    break;
                case TaskEvent.SECURITY_ERROR:
                    _local_2.code = SwfLoadEvent.CODE_SECURITY_ERROR;
                    _local_2.message = "安全错误";
                    break;
                default:
                    _local_2.code = SwfLoadEvent.CODE_CHECK_ERROR;
                    _local_2.message = "验证错误";
            };
            dispatchEvent(_local_2);
            onTaskEnd();
        }

        private function onFileProgress(_arg_1:TaskEvent):void
        {
            var _local_2:SwfLoadEvent = new SwfLoadEvent(SwfLoadEvent.PROGRESS);
            _local_2.key = _key;
            _local_2.url = _url;
            _local_2.bytesLoaded = _arg_1.bytesLoaded;
            _local_2.bytesTotal = _arg_1.bytesTotal;
            dispatchEvent(_local_2);
        }

        override protected function updateInfo(_arg_1:ILoader):void
        {
            super.updateInfo(_arg_1);
            var _local_2:Object = _arg_1.loadInfo;
            if (_local_2 != null){
                this.m_lc = _local_2.lc;
                this.m_bytes = _local_2.bytes;
                this.m_decodeFunc = _local_2.decodeFunc;
            };
        }

        public function getContent():DisplayObject
        {
            return (this.m_content);
        }

        public function getLoaderContext():LoaderContext
        {
            return (this.m_lc);
        }

        override public function start(_arg_1:*):void
        {
            super.start(_arg_1);
            if (!isLoaded()){
                this.m_swffileDecoder = (_arg_1 as SwfFileDecoder);
                if (this.m_bytes != null){
                    this.useSwfLoader(true);
                } else {
                    this.m_fileLoader = new FileLoader((key as String));
                    if (!this.onFileLoaded(null)){
                        this.m_fileLoader.url = _url;
                        this.m_fileLoader.priority = _priority;
                        this.m_fileLoader.saveSO = _saveSO;
                        this.useFileLoader(true);
                    };
                };
            } else {
                Schedule.addInvoke(new CFunction(this.onSwfLoaded), 1);
            };
        }

        override public function end()
        {
            this.useSwfLoader(false);
            this.useFileLoader(false);
            return (super.end());
        }

        override public function release():void
        {
            this.m_lc = null;
            this.m_content = null;
        }

        public /*  ©init. */ function _SafeStr_41()
        {
        }


    }
}//package com.tencent.free.core.swf.impl

// _SafeStr_41 = " SwfFile" (String#1388)


