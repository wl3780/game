// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.icon.impl.Icon

package com.tencent.ai.core.manager.icon.impl
{
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.ai.core.manager.icon.IIcon;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import com.tencent.free.core.filesystem.FileLoader;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.utils.Schedule;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.tencent.free.core.filesystem.IFile;
    import flash.display.Bitmap;

    public class Icon extends Task implements IIcon 
    {

        private var _id:int;
        private var _bitmapdata:BitmapData;
        private var _loader:Loader;
        private var _fileLoader:FileLoader;

        public function Icon(_arg_1:*)
        {
            super(_arg_1);
            this._id = (_arg_1 as int);
            this._url = ((DEFINE.ICON_RES_SRC + this._id) + ".png");
        }

        public function get ID():int
        {
            return (this._id);
        }

        public function get icon():BitmapData
        {
            return (this._bitmapdata);
        }

        override public function start(_arg_1:*):void
        {
            super.start(_arg_1);
            if (this._bitmapdata){
                Schedule.addInvoke(new CFunction(this.onBitmapDataLoaded), 1);
            } else {
                if (((this._loader) || (this._fileLoader))){
                    this.end();
                };
                this._loader = (this._res as Loader);
                this._fileLoader = new FileLoader(this._url);
                if (this._fileLoader.content.isLoaded()){
                    this.loadBytes();
                } else {
                    this._fileLoader.priority = _priority;
                    this._fileLoader.saveSO = _saveSO;
                    this._fileLoader.content.addEventListener(TaskEvent.COMPLETE, this.onCompleteFileLoaded);
                    this._fileLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onErrorFileLoaded);
                    this._fileLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onErrorFileLoaded);
                    this._fileLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onErrorFileLoaded);
                    this._fileLoader.content.addEventListener(TaskEvent.PROGRESS, this.onProgressFile);
                    this._fileLoader.load();
                };
            };
        }

        override public function end()
        {
            if (this._loader){
                this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onCompleteBitmapData);
                this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onErrorBitmapData);
                this._loader.unload();
                this._loader = null;
            };
            if (this._fileLoader){
                this._fileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onCompleteFileLoaded);
                this._fileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onErrorFileLoaded);
                this._fileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onErrorFileLoaded);
                this._fileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onErrorFileLoaded);
                this._fileLoader.content.removeEventListener(TaskEvent.PROGRESS, this.onProgressFile);
                this._fileLoader.unload();
                this._fileLoader = null;
            };
            return (super.end());
        }

        private function onCompleteFileLoaded(_arg_1:TaskEvent):void
        {
            if (this._fileLoader.content.isLoaded()){
                this.loadBytes();
            };
        }

        private function onErrorFileLoaded(_arg_1:TaskEvent):void
        {
            this.dispatchEvent(_arg_1);
            this.onTaskEnd();
        }

        private function onProgressFile(_arg_1:TaskEvent):void
        {
            this.dispatchEvent(_arg_1);
        }

        private function loadBytes():void
        {
            var _local_1:IFile = (this._fileLoader.content as IFile);
            this._loader = this._res;
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onCompleteBitmapData);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onErrorBitmapData);
            if (((!((_local_1.bytes == null))) && ((_local_1.bytes.length > 0)))){
                this._loader.loadBytes(_local_1.bytes);
            } else {
                Schedule.addInvoke(new CFunction(this.onErrorBitmapData, this));
            };
        }

        private function onCompleteBitmapData(_arg_1:Event):void
        {
            var _local_2:Bitmap = Bitmap(this._loader.content);
            this._bitmapdata = _local_2.bitmapData;
            this.onBitmapDataLoaded();
            this.onTaskEnd();
        }

        private function onErrorBitmapData(_arg_1:Event):void
        {
            var _local_2:TaskEvent = new TaskEvent(TaskEvent.IO_ERROR);
            _local_2.key = this._key;
            _local_2.url = this._url;
            this.dispatchEvent(_local_2);
            this.onTaskEnd();
        }

        private function onBitmapDataLoaded():void
        {
            var _local_3:IFile;
            var _local_1:int;
            if (this._fileLoader){
                _local_3 = (this._fileLoader.content as IFile);
                _local_1 = _local_3.bytes.length;
            };
            var _local_2:TaskEvent = new TaskEvent(TaskEvent.PROGRESS);
            _local_2.key = this._key;
            _local_2.url = this._url;
            var _local_4 = _local_1;
            _local_2.bytesTotal = _local_4;
            _local_2.bytesLoaded = _local_4;
            this.dispatchEvent(_local_2);
            this._isLoaded = true;
            _local_2 = new TaskEvent(TaskEvent.COMPLETE);
            _local_2.key = this._key;
            _local_2.url = this._url;
            _local_2.content = this;
            _local_2.bytesLoaded = (_local_2.bytesTotal = _local_1);
            this.dispatchEvent(_local_2);
        }

        override public function release():void
        {
            if (this._bitmapdata != null){
                this._bitmapdata.dispose();
                this._bitmapdata = null;
            };
        }


    }
}//package com.tencent.ai.core.manager.icon.impl

// _namespace_2 = "com.tencent.free.core.manager.content:IContent"
// _namespace_3 = "com.tencent.free.core.filesystem:IFile"


