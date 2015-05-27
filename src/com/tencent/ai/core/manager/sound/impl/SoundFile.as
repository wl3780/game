// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.sound.impl.SoundFile

package com.tencent.ai.core.manager.sound.impl
{
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.ai.core.manager.sound.ISoundFile;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.asset.decode.LibDecoder;
    import com.tencent.free.core.filesystem.FileLoader;
    import flash.media.Sound;
    import com.tencent.free.utils.Schedule;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.filesystem.IFile;
    import flash.events.Event;
    import  ©init._SafeStr_680;

    public class SoundFile extends Task implements ISoundFile 
    {

        private var _soundHash:Dictionary;
        protected var _fileDecoder:LibDecoder;
        protected var _fileLoader:FileLoader;

        public function SoundFile(_arg_1:*)
        {
            super(_arg_1);
        }

        public function getSoundByClass(_arg_1:String):Sound
        {
            if (!this._soundHash){
                this._soundHash = new Dictionary();
            };
            var _local_2:Sound = this._soundHash[_arg_1];
            if (!_local_2){
                _local_2 = (this._fileDecoder.findFile(_arg_1) as Sound);
                this._soundHash[_arg_1] = _local_2;
            };
            return (_local_2);
        }

        override public function start(_arg_1:*):void
        {
            super.start(_arg_1);
            if (this.isLoaded()){
                Schedule.addInvoke(new CFunction(this.onSoundFileLoaded), 1);
            } else {
                if (this._fileLoader){
                    this.end();
                };
                this._fileLoader = new FileLoader(this._key);
                if (this._fileLoader.content.isLoaded()){
                    this.loadSwf();
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
                this.loadSwf();
            };
        }

        private function onErrorFileLoaded(_arg_1:TaskEvent):void
        {
            this.dispatchEvent(_arg_1);
            onTaskEnd();
        }

        private function onProgressFile(_arg_1:TaskEvent):void
        {
            this.dispatchEvent(_arg_1);
        }

        private function loadSwf():void
        {
            var _local_1:IFile = (this._fileLoader.content as IFile);
            this._fileDecoder = new LibDecoder();
            this._fileDecoder.addEventListener(Event.COMPLETE, this.onCompleteSound);
            this._fileDecoder.load(this._key, _local_1.bytes);
        }

        private function onCompleteSound(_arg_1:Event):void
        {
            this._isLoaded = true;
            this.onSoundFileLoaded();
            onTaskEnd();
        }

        private function onSoundFileLoaded():void
        {
            var _local_1:TaskEvent;
            var _local_2:IFile;
            if (this._fileLoader){
                _local_2 = (this._fileLoader.content as IFile);
                _local_1 = new TaskEvent(TaskEvent.PROGRESS);
                _local_1.key = _key;
                _local_1.url = _url;
                _local_1.bytesLoaded = (_local_1.bytesTotal = _local_2.bytes.length);
                dispatchEvent(_local_1);
                _isLoaded = true;
                _local_1 = new TaskEvent(TaskEvent.COMPLETE);
                _local_1.key = _key;
                _local_1.url = _url;
                _local_1.content = this;
                _local_1.bytesLoaded = (_local_1.bytesTotal = _local_2.bytes.length);
                dispatchEvent(_local_1);
            } else {
                _local_1 = new TaskEvent(TaskEvent.PROGRESS);
                _local_1.key = _key;
                _local_1.url = _url;
                dispatchEvent(_local_1);
                _isLoaded = true;
                _local_1 = new TaskEvent(TaskEvent.COMPLETE);
                _local_1.key = _key;
                _local_1.url = _url;
                _local_1.content = this;
                dispatchEvent(_local_1);
            };
        }

        override public function release():void
        {
            var _local_1:*;
            this.end();
            if (this._fileDecoder){
                this._fileDecoder.removeEventListener(Event.COMPLETE, this.onCompleteSound);
                this._fileDecoder.unload();
                this._fileDecoder = null;
            };
            var _local_2:int;
            var _local_3:* = this._soundHash;
            for (_local_1 in this._soundHash) {
                this._soundHash[_local_1] = null;
                delete this._soundHash[_local_1];
            };
            this._soundHash = null;
        }

        public /*  ©init. */ function _SafeStr_680()
        {
        }


    }
}//package com.tencent.ai.core.manager.sound.impl

// _namespace_2 = "com.tencent.free.core.manager.content:IContent"
// _namespace_3 = "com.tencent.free.core.filesystem:IFile"


// _SafeStr_680 = " SoundFile" (String#15278)


