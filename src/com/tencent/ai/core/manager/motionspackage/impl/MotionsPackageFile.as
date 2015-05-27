// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.motionspackage.impl.MotionsPackageFile

package com.tencent.ai.core.manager.motionspackage.impl
{
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.ai.core.manager.motionspackage.IMotionsPackageFile;
    import com.tencent.ai.core.manager.framespackage.IFramesPackageFile;
    import com.tencent.ai.core.manager.framespackage.FramesPackageLoader;
    import com.tencent.ai.core.asset.config.MotionsPackage;
    import flash.utils.Dictionary;
    import com.tencent.free.utils.Schedule;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.manager.framespackage.FrameFile;
    import com.tencent.ai.core.asset.config.MotionTemplate;
    import com.tencent.ai.core.render.MotionAsset;
    import com.tencent.ai.core.render.BitmapTimeline;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.BitmapKeyFrame;
    import com.tencent.ai.core.asset.config.FrameRef;
    import com.tencent.ai.core.manager.framespackage.FramesAssetFile;
    import com.tencent.ai.core.asset.config.FrameInfo;
    import com.tencent.ai.core.render.NullBKF;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_674;
    import __AS3__.vec.*;

    public class MotionsPackageFile extends Task implements IMotionsPackageFile 
    {

        protected var _fpFile:IFramesPackageFile;
        protected var _fploader:FramesPackageLoader;
        protected var _motionsPackage:MotionsPackage;
        protected var _motionAssets:Dictionary;

        public function MotionsPackageFile(_arg_1:*)
        {
            super(_arg_1);
        }

        public function get motionsPackage():MotionsPackage
        {
            return (this._motionsPackage);
        }

        public function set motionsPackage(_arg_1:MotionsPackage):void
        {
            this._motionsPackage = _arg_1;
        }

        public function get motionAssets():Dictionary
        {
            return (this._motionAssets);
        }

        public function set motionAssets(_arg_1:Dictionary):void
        {
            this._motionAssets = _arg_1;
        }

        public function get framesPackageFile():IFramesPackageFile
        {
            return (this._fpFile);
        }

        public function findFile(_arg_1:String, ... _args):Object
        {
            if (this._fpFile != null){
                _args.unshift(_arg_1);
                return (this._fpFile.findFile.apply(this._fpFile, _args));
            };
            return (null);
        }

        override public function start(_arg_1:*):void
        {
            super.start(_arg_1);
            if (((!((this._fploader == null))) && (this._fploader.content.isLoaded()))){
                Schedule.addInvoke(new CFunction(this.onMotionsPackageLoaded), 1);
            } else {
                this._fploader = new FramesPackageLoader(_key);
                this._fploader.priority = priority;
                this._fploader.saveSO = this._saveSO;
                if (this._fploader.content.isLoaded()){
                    this.process();
                    Schedule.addInvoke(new CFunction(this.onMotionsPackageLoaded), 1);
                } else {
                    this._fploader.content.addEventListener(TaskEvent.COMPLETE, this.onCompleteFileLoaded);
                    this._fploader.content.addEventListener(TaskEvent.IO_ERROR, this.onErrorFileLoaded);
                    this._fploader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onErrorFileLoaded);
                    this._fploader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onErrorFileLoaded);
                    this._fploader.content.addEventListener(TaskEvent.PROGRESS, this.onProgressFile);
                    this._fploader.load();
                };
            };
        }

        override public function release():void
        {
            end();
            this._motionAssets = null;
            this._motionsPackage = null;
            if (this._fploader){
                this._fploader.content.removeEventListener(TaskEvent.COMPLETE, this.onCompleteFileLoaded);
                this._fploader.content.removeEventListener(TaskEvent.IO_ERROR, this.onErrorFileLoaded);
                this._fploader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onErrorFileLoaded);
                this._fploader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onErrorFileLoaded);
                this._fploader.content.removeEventListener(TaskEvent.PROGRESS, this.onProgressFile);
                this._fploader.unload();
                this._fploader = null;
            };
            this._fpFile = null;
        }

        protected function onCompleteFileLoaded(_arg_1:TaskEvent):void
        {
            var _local_2:TaskEvent;
            if (this._fploader.content.isLoaded()){
                this.process();
                this.onMotionsPackageLoaded();
            } else {
                _local_2 = new TaskEvent(TaskEvent.IO_ERROR);
                _local_2.key = _key;
                _local_2.url = _url;
                _local_2.content = this;
                dispatchEvent(_local_2);
                onTaskEnd();
            };
        }

        protected function onErrorFileLoaded(_arg_1:TaskEvent):void
        {
            dispatchEvent(_arg_1);
            onTaskEnd();
        }

        protected function onProgressFile(_arg_1:TaskEvent):void
        {
            dispatchEvent(_arg_1);
        }

        protected function onMotionsPackageLoaded():void
        {
            _isLoaded = true;
            var _local_1:TaskEvent = new TaskEvent(TaskEvent.COMPLETE);
            _local_1.key = _key;
            _local_1.url = _url;
            _local_1.content = this;
            dispatchEvent(_local_1);
            onTaskEnd();
        }

        protected function notFoundFrameFile(_arg_1:int, _arg_2:int):FrameFile
        {
            return (null);
        }

        protected function buildMotionAssets(_arg_1:Vector.<MotionTemplate>):Dictionary
        {
            var _local_6:MotionTemplate;
            var _local_7:int;
            var _local_8:MotionAsset;
            var _local_9:BitmapTimeline;
            var _local_10:Vector.<BitmapKeyFrame>;
            var _local_11:Vector.<FrameRef>;
            var _local_12:int;
            var _local_13:int;
            var _local_14:BitmapKeyFrame;
            var _local_15:FrameRef;
            var _local_16:int;
            var _local_17:int;
            var _local_18:FramesAssetFile;
            var _local_19:FrameFile;
            var _local_20:FrameInfo;
            var _local_21:int;
            var _local_22:int;
            var _local_2:Dictionary = new Dictionary();
            var _local_3:int = _arg_1.length;
            var _local_4:Dictionary = this._fpFile.framesAssetFiles;
            var _local_5:int;
            while (_local_5 < _local_3) {
                _local_6 = _arg_1[_local_5];
                _local_7 = _local_6.motionID;
                _local_8 = _local_2[_local_7];
                if (_local_8 == null){
                    _local_9 = new BitmapTimeline(null, _local_6.frameLabels);
                    _local_10 = new Vector.<BitmapKeyFrame>();
                    _local_11 = _local_6.frameRefs;
                    _local_12 = _local_6.totalFrame;
                    _local_13 = 0;
                    while (_local_13 < _local_12) {
                        _local_15 = _local_11[_local_13];
                        if (_local_15.refID != -1){
                            _local_16 = (((_local_15.refAsset == -1)) ? _local_6.assetID : _local_15.refAsset);
                            _local_17 = _local_15.refID;
                            _local_18 = _local_4[_local_16];
                            _local_19 = (((_local_18)!=null) ? _local_18.getFrameFile(_local_17) : null);
                            if (_local_19 == null){
                                _local_19 = this.notFoundFrameFile(_local_16, _local_17);
                            };
                            _local_20 = _local_19.config;
                            _local_21 = ((_local_6.offsetX + _local_15.offsetX) + (_local_20.offsetX * _local_15.scaleX));
                            _local_22 = ((_local_6.offsetY + _local_15.offsetY) + (_local_20.offsetY * _local_15.scaleY));
                            _local_14 = new BitmapKeyFrame(_local_21, _local_22, _local_15.alpha, _local_15.dAlpha, _local_15.rotation, _local_15.scaleX, _local_15.scaleY, _local_19.bitmapData, _local_15.eventType, _local_15.times, _local_15.fireEventTime, _local_15.usePlayRate, _local_15.scripts);
                            _local_14.hcs = _local_15.hcs;
                            _local_14.ac = _local_15.ac;
                        } else {
                            _local_14 = new NullBKF(_local_15.times, _local_15.eventType, _local_15.scripts, _local_15.usePlayRate);
                        };
                        _local_10.push(_local_14);
                        _local_13++;
                    };
                    _local_9.totalFrame = _local_12;
                    _local_9.bitmapFrames = _local_10;
                    _local_8 = new MotionAsset(_local_6.motionID, _local_9);
                    _local_8.motionName = _local_6.name;
                    _local_2[_local_7] = _local_8;
                };
                _local_5++;
            };
            return (_local_2);
        }

        protected function process():void
        {
            this._fpFile = (this._fploader.content as IFramesPackageFile);
            this._motionsPackage = new MotionsPackage();
            this._motionsPackage.decode(new XML(this._fpFile.findFile(Constants.ASSET_XMLMOTIONS_NAME)));
            this._motionAssets = this.buildMotionAssets(this._motionsPackage.motionTemplates);
        }

        public /*  ©init. */ function _SafeStr_674()
        {
        }


    }
}//package com.tencent.ai.core.manager.motionspackage.impl

// _namespace_2 = "com.tencent.free.core.manager.content:IContent"


// _SafeStr_674 = " MotionsPackageFile" (String#15935)


