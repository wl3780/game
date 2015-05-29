package com.tencent.free.core.filesystem
{
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.manager.loader.BaseLoader;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.mff.MFF;
    import com.tencent.free.mff.MFFFile;
    import com.tencent.free.utils.XString;
    
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.net.URLLoaderDataFormat;
    import flash.utils.ByteArray;

    public class XMLLoader extends EventDispatcher 
    {

        public var bytes:ByteArray;
        public var data:Object;
        public var dataFormat:String = URLLoaderDataFormat.TEXT;
        
		protected var file:FileLoader;
        protected var m_priority:int;
        protected var m_saveSO:Boolean;
        protected var m_expireTime:int;

        public function XMLLoader(_arg_1:int=100, _arg_2:Boolean=false, expireTime:int=-1)
        {
            this.m_priority = _arg_1;
            this.m_saveSO = _arg_2;
            this.m_expireTime = expireTime==-1 ? BaseLoader.defaultExpireTime : expireTime;
        }

        protected function listen(add:Boolean):void
        {
            if (this.file == null) {
                return;
            }
            var content:IContent = this.file.content;
            if (add) {
                content.addEventListener(TaskEvent.COMPLETE, onLoadEvent);
                content.addEventListener(TaskEvent.CHECK_ERROR, onLoadEvent);
                content.addEventListener(TaskEvent.IO_ERROR, onLoadEvent);
                content.addEventListener(TaskEvent.SECURITY_ERROR, onLoadEvent);
            } else {
                content.removeEventListener(TaskEvent.COMPLETE, onLoadEvent);
                content.removeEventListener(TaskEvent.CHECK_ERROR, onLoadEvent);
                content.removeEventListener(TaskEvent.IO_ERROR, onLoadEvent);
                content.removeEventListener(TaskEvent.SECURITY_ERROR, onLoadEvent);
            }
        }

        public function unload():void
        {
            if (this.file != null) {
                this.listen(false);
                this.file.unload();
                this.file = null;
            }
            this.data = null;
        }

        public function load(loadKey:String, hash:String=""):void
        {
            this.unload();
            this.file = new FileLoader(loadKey);
            this.file.hash = hash;
            this.listen(true);
            this.file.expireTime = this.m_expireTime;
            this.file.priority = this.m_priority;
            this.file.saveSO = this.m_saveSO;
            this.file.load();
        }

        public function onLoadEvent(evt:TaskEvent):void
        {
            if (evt.type == TaskEvent.COMPLETE) {
                this.bytes = IFile(this.file.content).bytes;
                if (this.bytes) {
		            var relativeURL:String = Redirect.relativePath(this.file.url);
		            var ext:String = XString.getURLExtension(Redirect.relativePath(Redirect.redirect(this.file.url)));
                    if (ext == "mff") {
			            var mff:MFF = new MFF();
                        mff.decode(this.bytes);
			            var mffFile:MFFFile = mff.getMMFFileByName(relativeURL);
                        if (this.dataFormat == URLLoaderDataFormat.BINARY) {
                            this.data = mffFile.mffBytes;
                        } else {
                            mffFile.mffBytes.position = 0;
                            this.data = mffFile.mffBytes.readUTFBytes(mffFile.mffBytes.bytesAvailable);
                        }
                    } else {
                        if (this.dataFormat == URLLoaderDataFormat.BINARY) {
                            this.data = this.bytes;
                        } else {
                            this.bytes.position = 0;
                            this.data = this.bytes.readUTFBytes(this.bytes.bytesAvailable);
                        }
                    }
                }
                this.dispatchEvent(new Event(Event.COMPLETE));
            } else {
                this.dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, "文件:" + evt.key + "加载失败，错误事件:" + evt.type);
            }
        }

    }
}
