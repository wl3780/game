// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.res.SoundAsset

package com.tencent.ai.core.sound.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.data.SoundPackageInfo;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.sound.impl.SoundFile;
    import flash.media.Sound;
    import com.tencent.ai.core.manager.sound.SoundFileLoader;
    import com.tencent.ai.core.data.SoundInfo;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;

    public class SoundAsset extends BaseAsset 
    {

        public var soundPackageID:int;
        public var info:SoundPackageInfo;
        private var _loaderHash:Dictionary;
        private var _loadItems:int;
        private var _totalItems:int;

        public function SoundAsset(_arg_1:SoundPackageInfo)
        {
            this.info = _arg_1;
            this.soundPackageID = _arg_1.id;
            this._loaderHash = new Dictionary();
        }

        public function getSound(_arg_1:int, _arg_2:int):Sound
        {
            var _local_4:SoundFile;
            var _local_5:Sound;
            var _local_3:SoundFileLoader = this._loaderHash[_arg_1];
            if (((_local_3) && (_local_3.content))){
                _local_4 = (_local_3.content as SoundFile);
                _local_5 = ((_local_4.isLoaded()) ? _local_4.getSoundByClass(("S_" + _arg_2)) : null);
                return (_local_5);
            };
            return (null);
        }

        override public function load(... _args):void
        {
            var _local_2:SoundInfo;
            var _local_3:SoundFileLoader;
            if (m_isLoading){
                return;
            };
            if (m_isLoaded){
                asynInvoke(new CFunction(assetLoaded, this));
                return;
            };
            m_isLoading = true;
            this.unload();
            this._totalItems = this.info.soundInfoList.length;
            if (this._totalItems > 0){
                for each (_local_2 in this.info.soundInfoList) {
                    if (((!(this._loaderHash[_local_2.swfID])) && (!(_local_2.dontPlay)))){
                        _local_3 = new SoundFileLoader((("sound_" + _local_2.swfID) + ".swf"));
                        _local_3.content.addEventListener(TaskEvent.COMPLETE, this.onFileEnd);
                        _local_3.content.addEventListener(TaskEvent.IO_ERROR, this.onFileEnd);
                        _local_3.content.addEventListener(TaskEvent.CHECK_ERROR, this.onFileEnd);
                        _local_3.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onFileEnd);
                        _local_3.content.addEventListener(TaskEvent.PROGRESS, this.progressHandler);
                        _local_3.saveSO = m_bSaveSO;
                        _local_3.priority = priority;
                        _local_3.load();
                        this._loaderHash[_local_2.swfID] = _local_3;
                    } else {
                        this._loadItems++;
                    };
                };
            } else {
                this.m_isLoading = false;
                this.m_isLoaded = true;
                asynInvoke(new CFunction(assetLoaded, this));
            };
        }

        private function onFileEnd(_arg_1:TaskEvent):void
        {
            this._loadItems++;
            if (this._loadItems == this._totalItems){
                this.m_isLoading = false;
                this.m_isLoaded = true;
                this.assetLoaded();
            };
        }

        private function progressHandler(_arg_1:TaskEvent):void
        {
            onProgress(String(_arg_1.key), _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        override public function unload():void
        {
            var _local_1:*;
            var _local_2:SoundFileLoader;
            this._loadItems = 0;
            this._totalItems = 0;
            for (_local_1 in this._loaderHash) {
                _local_2 = this._loaderHash[_local_1];
                if (_local_2){
                    _local_2.content.removeEventListener(TaskEvent.COMPLETE, this.onFileEnd);
                    _local_2.content.removeEventListener(TaskEvent.IO_ERROR, this.onFileEnd);
                    _local_2.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onFileEnd);
                    _local_2.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onFileEnd);
                    _local_2.content.removeEventListener(TaskEvent.PROGRESS, this.progressHandler);
                    _local_2.unload();
                    _local_2 = null;
                };
                this._loaderHash[_local_1] = null;
            };
            super.unload();
        }

        override public function toString():String
        {
            return ((((("声音资源 { des:" + this.info.des) + ",id:") + this.soundPackageID) + "}"));
        }


    }
}//package com.tencent.ai.core.sound.res

