// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.PreLoad

package com.tencent.free.core.filesystem
{
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.manager.task.Priority;
    import flash.events.Event;
    import  ©init._SafeStr_14;

    public class PreLoad 
    {

        public static var preLoadList:Array = new Array();
        private static var _instance:PreLoad;

        private var _hasDeal:Array;
        private var _fileLoader:FileLoader;

        public function PreLoad()
        {
            this._hasDeal = new Array();
            super();
        }

        public static function start():void
        {
            instance.startLoad();
        }

        public static function stop():void
        {
            instance.stopLoad();
        }

        public static function get instance():PreLoad
        {
            if (!_instance){
                _instance = new (PreLoad)();
            };
            return (_instance);
        }


        public function startLoad():void
        {
            this.stopLoad();
            this.doNext();
        }

        public function stopLoad():void
        {
            if (this._fileLoader){
                this._fileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.PROGRESS, this.onFileDeal);
                this._fileLoader.unload();
                this._fileLoader = null;
            };
        }

        public function doNext():void
        {
            var _local_2:String;
            var _local_1 = "";
            for each (_local_2 in preLoadList) {
                if (this._hasDeal.indexOf(_local_2) == -1){
                    _local_1 = _local_2;
                    break;
                };
            };
            if (((!((_local_1 == null))) && (!((_local_1 == ""))))){
                this._fileLoader = new FileLoader(_local_1);
                this._fileLoader.priority = Priority.PERIORITY_LOW;
                this._fileLoader.saveSO = true;
                this._fileLoader.content.addEventListener(TaskEvent.COMPLETE, this.onFileDeal);
                this._fileLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onFileDeal);
                this._fileLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onFileDeal);
                this._fileLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onFileDeal);
                this._fileLoader.load();
            } else {
                this.stopLoad();
            };
        }

        public function onFileDeal(_arg_1:Event):void
        {
            this._hasDeal.push(this._fileLoader.key);
            if (this._fileLoader){
                this._fileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onFileDeal);
                this._fileLoader.content.removeEventListener(TaskEvent.PROGRESS, this.onFileDeal);
                this._fileLoader.unload();
                this._fileLoader = null;
            };
            this.doNext();
        }

        public /*  ©init. */ function _SafeStr_14()
        {
        }


    }
}//package com.tencent.free.core.filesystem

// _SafeStr_14 = " PreLoad" (String#1583)


