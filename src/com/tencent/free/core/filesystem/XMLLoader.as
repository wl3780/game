// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.XMLLoader

package com.tencent.free.core.filesystem
{
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import com.tencent.free.core.manager.loader.BaseLoader;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.mff.MFF;
    import com.tencent.free.mff.MFFFile;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.utils.XString;
    import flash.net.URLLoaderDataFormat;
    import flash.events.Event;
    import flash.events.ErrorEvent;

    public class XMLLoader extends EventDispatcher 
    {

        public var bytes:ByteArray;
        public var data:Object;
        public var dataFormat:String = "text";
        protected var file:FileLoader;
        protected var m_priority:int;
        protected var m_saveSO:Boolean;
        protected var m_expireTime:int;

        public function XMLLoader(_arg_1:int=100, _arg_2:Boolean=false, _arg_3:int=-1)
        {
            this.m_priority = _arg_1;
            this.m_saveSO = _arg_2;
            this.m_expireTime = (((_arg_3)==-1) ? BaseLoader.defaultExpireTime : _arg_3);
        }

        protected function listen(_arg_1:Boolean):void
        {
            if (this.file == null){
                return;
            };
            var _local_2:IContent = this.file.content;
            if (_arg_1){
                _local_2.addEventListener(TaskEvent.COMPLETE, this.onLoadEvent);
                _local_2.addEventListener(TaskEvent.CHECK_ERROR, this.onLoadEvent);
                _local_2.addEventListener(TaskEvent.IO_ERROR, this.onLoadEvent);
                _local_2.addEventListener(TaskEvent.SECURITY_ERROR, this.onLoadEvent);
            } else {
                _local_2.removeEventListener(TaskEvent.COMPLETE, this.onLoadEvent);
                _local_2.removeEventListener(TaskEvent.CHECK_ERROR, this.onLoadEvent);
                _local_2.removeEventListener(TaskEvent.IO_ERROR, this.onLoadEvent);
                _local_2.removeEventListener(TaskEvent.SECURITY_ERROR, this.onLoadEvent);
            };
        }

        public function unload():void
        {
            if (this.file != null){
                this.listen(false);
                this.file.unload();
                this.file = null;
            };
            this.data = null;
        }

        public function load(_arg_1:String, _arg_2:String=""):void
        {
            this.unload();
            this.file = new FileLoader(_arg_1);
            this.listen(true);
            this.file.expireTime = this.m_expireTime;
            this.file.url = _arg_1;
            this.file.hash = _arg_2;
            this.file.priority = this.m_priority;
            this.file.saveSO = this.m_saveSO;
            this.file.load();
        }

        public function onLoadEvent(_arg_1:TaskEvent):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:MFF;
            var _local_5:MFFFile;
            if (_arg_1.type == TaskEvent.COMPLETE){
                this.bytes = IFile(this.file.content).bytes;
                if (this.bytes){
                    _local_2 = Redirect.relativePath(this.file.url);
                    _local_3 = XString.getURLExtension(Redirect.relativePath(Redirect.redirect(this.file.url)));
                    if (_local_3 == "mff"){
                        _local_4 = new MFF();
                        _local_4.decode(this.bytes);
                        _local_5 = _local_4.getMMFFileByName(_local_2);
                        if (this.dataFormat == URLLoaderDataFormat.BINARY){
                            this.data = _local_5.mffBytes;
                        } else {
                            _local_5.mffBytes.position = 0;
                            this.data = _local_5.mffBytes.readUTFBytes(_local_5.mffBytes.bytesAvailable);
                        };
                    } else {
                        if (this.dataFormat == URLLoaderDataFormat.BINARY){
                            this.data = this.bytes;
                        } else {
                            this.bytes.position = 0;
                            this.data = this.bytes.readUTFBytes(this.bytes.bytesAvailable);
                        };
                    };
                };
                dispatchEvent(new Event(Event.COMPLETE));
            } else {
                dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, ((("文件:" + _arg_1.key) + "加载失败，错误事件:") + _arg_1.type)));
            };
        }


    }
}//package com.tencent.free.core.filesystem

