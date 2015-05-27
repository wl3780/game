// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.impl.File

package com.tencent.free.core.filesystem.impl
{
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.free.core.filesystem.IFile;
    import flash.net.URLStream;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.core.filesystem.SharedObjectManager;
    import com.tencent.free.core.redirect.RedirectFile;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.utils.Schedule;
    import com.tencent.free.utils.CFunction;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.ProgressEvent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.logging.logToServer;
    import com.tencent.free.logging.error;

    public class File extends Task implements IFile 
    {

        private var _loader:URLStream;
        private var _urlRequest:URLRequest;
        private var _fileBytes:ByteArray;
        private var _redireUrl:String;
        private var _hasSaveSO:Boolean = false;

        public function File(_arg_1:String)
        {
            super(_arg_1);
        }

        public function get bytes():ByteArray
        {
            return (this._fileBytes);
        }

        override protected function updateInfo(_arg_1:ILoader):void
        {
            super.updateInfo(_arg_1);
            this._redireUrl = Redirect.redirect(this._url);
            if (!this._saveSO){
                this._saveSO = SharedObjectManager.needSO(Redirect.relativePath((key as String)));
            };
            var _local_2:RedirectFile = Redirect.getRedirectFile(this._url);
            if (_local_2){
                this._hash = _local_2.len;
            };
        }

        override public function start(_arg_1:*):void
        {
            super.start(_arg_1);
            if (this._fileBytes != null){
                Schedule.addInvoke(new CFunction(this.onFileLoaded), 1);
            } else {
                this._fileBytes = SharedObjectManager.instance.getFile(key, this._redireUrl);
                if (this._fileBytes != null){
                    if (this.check(this._checkHash, _hash)){
                        this._hasSaveSO = true;
                        Schedule.addInvoke(new CFunction(this.onFileLoaded), 1);
                        return;
                    };
                    this._fileBytes = null;
                    SharedObjectManager.instance.delFile(key);
                };
                if (this._loader){
                    this.end();
                };
                this._loader = this._res;
                this._loader.addEventListener(Event.COMPLETE, this.complete);
                this._loader.addEventListener(IOErrorEvent.IO_ERROR, this.ioerror);
                this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
                this._loader.addEventListener(ProgressEvent.PROGRESS, this.progress);
                this._urlRequest = new URLRequest(this._redireUrl);
                this._loader.load(this._urlRequest);
            };
        }

        override public function end()
        {
            if (this._loader){
                this._loader.removeEventListener(Event.COMPLETE, this.complete);
                this._loader.removeEventListener(IOErrorEvent.IO_ERROR, this.ioerror);
                this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
                this._loader.removeEventListener(ProgressEvent.PROGRESS, this.progress);
                if (this._loader.connected){
                    this._loader.close();
                };
                this._loader = null;
            };
            this._urlRequest = null;
            return (super.end());
        }

        override public function check(_arg_1:Function, _arg_2:*):Boolean
        {
            if (null != _arg_1){
                if (this.bytes){
                    return (_arg_1(this._fileBytes, _arg_2));
                };
                return (false);
            };
            return (true);
        }

        private function complete(_arg_1:Event):void
        {
            var _local_2:TaskEvent;
            this._fileBytes = new ByteArray();
            this._loader.readBytes(this._fileBytes);
            this._fileBytes.position = 0;
            if (((this._fileBytes) && (this.check(this._checkHash, _hash)))){
                FileSystem.getInstance().addBytes(this._fileBytes.length);
                this.onFileLoaded();
            } else {
                if (!this.retry()){
                    logToServer([1, 4], [this._key, this._redireUrl]);
                    _local_2 = new TaskEvent(TaskEvent.CHECK_ERROR);
                    _local_2.key = this._key;
                    _local_2.url = this._url;
                    this.dispatchEvent(_local_2);
                    onTaskEnd();
                };
            };
        }

        private function ioerror(_arg_1:IOErrorEvent):void
        {
            var _local_2:TaskEvent;
            error("[File] 加载失败", _arg_1.text, this._key);
            if (!this.retry()){
                logToServer([1, 1], [this._key, this._redireUrl]);
                _local_2 = new TaskEvent(TaskEvent.IO_ERROR);
                _local_2.key = this._key;
                _local_2.url = this._url;
                this.dispatchEvent(_local_2);
                onTaskEnd();
            };
        }

        private function securityError(_arg_1:Event):void
        {
            var _local_2:TaskEvent;
            error("File", "securityError加载失败", this._key);
            if (!this.retry()){
                logToServer([1, 2], [this._key, this._redireUrl]);
                _local_2 = new TaskEvent(TaskEvent.SECURITY_ERROR);
                _local_2.key = this._key;
                _local_2.url = this._url;
                this.dispatchEvent(_local_2);
                onTaskEnd();
            };
        }

        private function progress(_arg_1:ProgressEvent):void
        {
            var _local_2:TaskEvent = new TaskEvent(TaskEvent.PROGRESS);
            _local_2.key = this._key;
            _local_2.url = this._url;
            _local_2.bytesLoaded = _arg_1.bytesLoaded;
            _local_2.bytesTotal = _arg_1.bytesTotal;
            this.dispatchEvent(_local_2);
        }

        private function onFileLoaded():void
        {
            if (((((this._saveSO) && (!(this._hasSaveSO)))) && (!((key == this._redireUrl))))){
                SharedObjectManager.instance.saveFile(key, this._redireUrl, this._fileBytes);
                this._hasSaveSO = true;
            };
            var _local_1:TaskEvent = new TaskEvent(TaskEvent.PROGRESS);
            _local_1.key = this._key;
            _local_1.url = this._url;
            _local_1.bytesLoaded = (_local_1.bytesTotal = this._fileBytes.length);
            this.dispatchEvent(_local_1);
            this._isLoaded = true;
            _local_1 = new TaskEvent(TaskEvent.COMPLETE);
            _local_1.key = this._key;
            _local_1.url = this._url;
            _local_1.content = this;
            _local_1.bytesLoaded = (_local_1.bytesTotal = this._fileBytes.length);
            this.dispatchEvent(_local_1);
            onTaskEnd();
        }

        override protected function retry():Boolean
        {
            var _local_1:String;
            if (_retryTimes > 0){
                error("[File]", "重试", this._key);
                if (this._loader.connected){
                    this._loader.close();
                };
                _local_1 = new Date().getTime().toString();
                this._urlRequest = new URLRequest(((this._redireUrl + "?q=") + _local_1));
                this._loader.load(this._urlRequest);
                this._retryTimes--;
                return (true);
            };
            return (false);
        }

        override public function release():void
        {
            if (this._fileBytes != null){
                this._fileBytes.clear();
                this._fileBytes = null;
            };
            this._redireUrl = null;
            this._hasSaveSO = false;
        }


    }
}//package com.tencent.free.core.filesystem.impl

