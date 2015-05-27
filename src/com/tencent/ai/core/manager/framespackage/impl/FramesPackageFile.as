// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.framespackage.impl.FramesPackageFile

package com.tencent.ai.core.manager.framespackage.impl
{
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.ai.core.manager.framespackage.IFramesPackageFile;
    import com.tencent.ai.core.asset.config.FramesPackage;
    import com.tencent.ai.core.asset.decode.LibDecoder;
    import com.tencent.free.core.filesystem.FileLoader;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.framespackage.FramesAssetFile;
    import com.tencent.ai.core.manager.framespackage.FrameFile;
    import flash.display.BitmapData;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.filesystem.IFile;
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.asset.config.BD;
    import com.tencent.ai.core.asset.config.FramesAsset;
    import com.tencent.ai.core.manager.framespackage.BDFile;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_656;

    public class FramesPackageFile extends Task implements IFramesPackageFile 
    {

        protected var m_fp:FramesPackage;
        protected var m_fileDecoder:LibDecoder;
        protected var m_fileLoader:FileLoader;
        private var _bdFiles:Dictionary;
        private var _framesAssetFiles:Dictionary;
        private var _scatteredBDs:Dictionary;

        public function FramesPackageFile(_arg_1:*)
        {
            super(_arg_1);
            this._bdFiles = new Dictionary();
            this._framesAssetFiles = new Dictionary();
        }

        public function get framesPackage():FramesPackage
        {
            return (this.m_fp);
        }

        public function get bdFiles():Dictionary
        {
            return (this._bdFiles);
        }

        public function get framesAssetFiles():Dictionary
        {
            return (this._framesAssetFiles);
        }

        public function findFramesAssetFile(_arg_1:int):FramesAssetFile
        {
            return (this._framesAssetFiles[_arg_1]);
        }

        public function findFrameFile(_arg_1:int, _arg_2:int):FrameFile
        {
            var _local_3:FramesAssetFile = this._framesAssetFiles[_arg_1];
            if (_local_3 != null){
                return (_local_3.getFrameFile(_arg_2));
            };
            return (null);
        }

        public function findFile(_arg_1:String, ... _args):Object
        {
            return (this.m_fileDecoder.findFile(_arg_1, _args));
        }

        public function findBitmapData(_arg_1:String, ... _args):BitmapData
        {
            if (this._scatteredBDs == null){
                this._scatteredBDs = new Dictionary();
            };
            var _local_3:BitmapData = this._scatteredBDs[_arg_1];
            if (((!((this.m_fileDecoder == null))) && ((_local_3 == null)))){
                _local_3 = (this.m_fileDecoder.findFile(_arg_1, _args) as BitmapData);
                this._scatteredBDs[_arg_1] = _local_3;
            };
            return (_local_3);
        }

        override public function start(_arg_1:*):void
        {
            super.start(_arg_1);
            if (this.m_fp != null){
                asynInvoke(new CFunction(this.onFramesPackageLoaded), 1);
            } else {
                if (this.m_fileDecoder != null){
                    this.end();
                };
                this.m_fileLoader = new FileLoader(_key);
                if (this.m_fileLoader.content.isLoaded()){
                    this.loadSwf();
                } else {
                    this.m_fileLoader.priority = _priority;
                    this.m_fileLoader.saveSO = _saveSO;
                    this.m_fileLoader.content.addEventListener(TaskEvent.COMPLETE, this.onCompleteFileLoaded);
                    this.m_fileLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onErrorFileLoaded);
                    this.m_fileLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onErrorFileLoaded);
                    this.m_fileLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onErrorFileLoaded);
                    this.m_fileLoader.content.addEventListener(TaskEvent.PROGRESS, this.onProgressFile);
                    this.m_fileLoader.load();
                };
            };
        }

        override public function end()
        {
            if (this.m_fileLoader != null){
                this.m_fileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onCompleteFileLoaded);
                this.m_fileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onErrorFileLoaded);
                this.m_fileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onErrorFileLoaded);
                this.m_fileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onErrorFileLoaded);
                this.m_fileLoader.content.removeEventListener(TaskEvent.PROGRESS, this.onProgressFile);
                this.m_fileLoader.unload();
                this.m_fileLoader = null;
            };
            return (super.end());
        }

        private function onCompleteFileLoaded(_arg_1:TaskEvent):void
        {
            if (this.m_fileLoader.content.isLoaded()){
                this.loadSwf();
            };
        }

        private function onErrorFileLoaded(_arg_1:TaskEvent):void
        {
            dispatchEvent(_arg_1);
            onTaskEnd();
        }

        private function onProgressFile(_arg_1:TaskEvent):void
        {
            dispatchEvent(_arg_1);
        }

        private function loadSwf():void
        {
            var _local_1:IFile = (this.m_fileLoader.content as IFile);
            if (this.m_fileDecoder){
                this.m_fileDecoder.removeEventListener(Event.COMPLETE, this.onCompleteFramePackage);
                this.m_fileDecoder.unload();
                this.m_fileDecoder = null;
            };
            this.m_fileDecoder = new LibDecoder();
            this.m_fileDecoder.addEventListener(Event.COMPLETE, this.onCompleteFramePackage);
            this.m_fileDecoder.load(_key, _local_1.bytes);
        }

        private function onCompleteFramePackage(_arg_1:Event):void
        {
            this.m_fp = new FramesPackage();
            this.processFile();
            this.onFramesPackageLoaded();
            onTaskEnd();
        }

        private function onFramesPackageLoaded():void
        {
            var _local_1:TaskEvent;
            var _local_2:IFile;
            if (this.m_fileLoader){
                _local_2 = (this.m_fileLoader.content as IFile);
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
            var _local_1:BitmapData;
            var _local_2:FramesAssetFile;
            this.end();
            if (this._scatteredBDs != null){
                for each (_local_1 in this._scatteredBDs) {
                    ((_local_1) && (_local_1.dispose()));
                };
                this._scatteredBDs = null;
            };
            if (this._framesAssetFiles != null){
                for each (_local_2 in this._framesAssetFiles) {
                    _local_2.unbuild();
                };
                this._framesAssetFiles = null;
            };
            this._bdFiles = null;
            if (this.m_fileDecoder){
                this.m_fileDecoder.removeEventListener(Event.COMPLETE, this.onCompleteFramePackage);
                this.m_fileDecoder.unload();
                this.m_fileDecoder = null;
            };
            this.m_fp = null;
        }

        protected function processFile():void
        {
            var _local_2:XML;
            var _local_3:Vector.<BD>;
            var _local_4:Vector.<FramesAsset>;
            var _local_5:BDFile;
            var _local_6:int;
            var _local_7:int;
            var _local_8:BD;
            var _local_9:int;
            var _local_10:BDFile;
            var _local_11:FramesAsset;
            var _local_12:int;
            var _local_13:FramesAssetFile;
            var _local_1:Object = this.m_fileDecoder.findFile(Constants.ASSET_XMLFRAMES_NAME);
            if (_local_1 != null){
                _local_2 = new XML(_local_1);
                this.m_fp.decode(_local_2);
                _local_3 = this.m_fp.bds;
                if (_local_3 != null){
                    _local_6 = _local_3.length;
                    _local_7 = 0;
                    while (_local_7 < _local_6) {
                        _local_8 = _local_3[_local_7];
                        _local_9 = _local_8.id;
                        _local_10 = this._bdFiles[_local_9];
                        if (_local_10 == null){
                            _local_10 = new BDFile(_local_8);
                            _local_10.build(this.m_fileDecoder);
                            this._bdFiles[_local_9] = _local_10;
                        };
                        _local_7++;
                    };
                };
                _local_4 = this.m_fp.framesAssets;
                if (_local_4 != null){
                    _local_6 = _local_4.length;
                    _local_7 = 0;
                    while (_local_7 < _local_6) {
                        _local_11 = _local_4[_local_7];
                        _local_12 = _local_11.id;
                        _local_13 = this._framesAssetFiles[_local_12];
                        if (_local_13 == null){
                            _local_13 = new FramesAssetFile(_local_11);
                            _local_13.build(this._bdFiles);
                            this._framesAssetFiles[_local_12] = _local_13;
                        };
                        _local_7++;
                    };
                };
                for each (_local_5 in this._bdFiles) {
                    _local_5.unbuild();
                };
                this._bdFiles = new Dictionary();
            };
        }

        public /*  ©init. */ function _SafeStr_656()
        {
        }


    }
}//package com.tencent.ai.core.manager.framespackage.impl

// _namespace_2 = "com.tencent.free.core.manager.content:IContent"
// _namespace_3 = "com.tencent.free.core.filesystem:IFile"


// _SafeStr_656 = " FramesPackageFile" (String#13805)


