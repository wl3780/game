// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.bitmapdata.impl.BitmapDataFile

package com.tencent.ai.core.manager.bitmapdata.impl
{
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.ai.core.manager.bitmapdata.IBitmapDataFile;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import com.tencent.free.core.filesystem.FileLoader;
    import com.tencent.free.utils.Schedule;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.tencent.free.core.filesystem.IFile;
    import flash.display.Bitmap;
    import  ©init._SafeStr_584;

    public class BitmapDataFile extends Task implements IBitmapDataFile 
    {

        protected var _bitmapdata:BitmapData;
        protected var _loader:Loader;
        protected var _fileLoader:FileLoader;

        public function BitmapDataFile(_arg_1:*)
        {
            super(_arg_1);
        }

        public function getBitmapData():BitmapData
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
                this._fileLoader = new FileLoader(this._key);
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
            this._loader.loadBytes(_local_1.bytes);
        }

        private function onCompleteBitmapData(_arg_1:Event):void
        {
            var _local_2:Bitmap = Bitmap(this._loader.content);
            this._bitmapdata = _local_2.bitmapData;
            this.onBitmapDataLoaded();
        }

        private function onErrorBitmapData(_arg_1:Event):void
        {
            var _local_2:TaskEvent = new TaskEvent(TaskEvent.IO_ERROR);
            _local_2.key = this._key;
            _local_2.url = this._url;
            this.dispatchEvent(_local_2);
            onTaskEnd();
        }

        private function onBitmapDataLoaded():void
        {
            var _local_1:TaskEvent = new TaskEvent(TaskEvent.PROGRESS);
            _local_1.key = this._key;
            _local_1.url = this._url;
            this.dispatchEvent(_local_1);
            this._isLoaded = true;
            _local_1 = new TaskEvent(TaskEvent.COMPLETE);
            _local_1.key = this._key;
            _local_1.url = this._url;
            _local_1.content = this;
            this.dispatchEvent(_local_1);
            onTaskEnd();
        }

        override public function release():void
        {
            if (this._bitmapdata != null){
                this._bitmapdata.dispose();
                this._bitmapdata = null;
            };
        }

        public /*  ©init. */ function _SafeStr_584()
        {
        }


    }
}//package com.tencent.ai.core.manager.bitmapdata.impl

// _namespace_2 = "com.tencent.free.core.manager.content:IContent"
// _namespace_3 = "com.tencent.free.core.filesystem:IFile"


// _SafeStr_584 = " BitmapDataFile" (String#16136)


