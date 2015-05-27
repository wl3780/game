// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.prepare.AssetPrepare

package com.tencent.ai.core.asset.prepare
{
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.asset.IAsset;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import flash.utils.clearTimeout;
    import com.tencent.free.logging.error;
    import flash.utils.getQualifiedClassName;
    import flash.utils.setTimeout;
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.free.logging.logToServer;
    import com.tencent.free.logging.debug;
    import  ©init._SafeStr_69;

    public class AssetPrepare extends EventDispatcher 
    {

        protected var m_arrAssets:Array;
        protected var m_soundArr:Array;
        protected var m_dicState:Dictionary;
        protected var m_isLoaded:Boolean = false;
        protected var m_bLoading:Boolean = false;
        protected var m_totalItem:int = 0;
        protected var m_loadItem:int = 0;
        protected var m_soundIndex:int = 0;
        private var _loadingMessage:String;
        private var _passTimeID:int;

        public function AssetPrepare(_arg_1:Array=null)
        {
            this.prepare(_arg_1);
        }

        protected function addEvent():void
        {
            var _local_1:IAsset;
            if (this.m_arrAssets){
                for each (_local_1 in this.m_arrAssets) {
                    _local_1.addEventListener(AssetLoadEvent.COMPLETE, this.onComplete);
                    _local_1.addEventListener(AssetLoadEvent.ERROR, this.onError);
                };
            };
        }

        protected function removeEvent():void
        {
            var _local_1:IAsset;
            if (this.m_arrAssets){
                for each (_local_1 in this.m_arrAssets) {
                    _local_1.removeEventListener(AssetLoadEvent.COMPLETE, this.onComplete);
                    _local_1.removeEventListener(AssetLoadEvent.ERROR, this.onError);
                };
            };
        }

        public function prepare(_arg_1:Array):void
        {
            if (_arg_1 != null){
                this.m_arrAssets = _arg_1;
                this.m_bLoading = false;
                this.addEvent();
            };
        }

        public function start():void
        {
            var _local_1:IAsset;
            this.m_bLoading = true;
            this.m_isLoaded = false;
            this.m_loadItem = 0;
            this.m_totalItem = 0;
            this.m_dicState = new Dictionary();
            this._loadingMessage = "";
            for each (_local_1 in this.m_arrAssets) {
                if (this.m_dicState[_local_1] == null){
                    this.m_dicState[_local_1] = false;
                    this.m_totalItem++;
                    _local_1.load(_local_1.loadArg);
                };
            };
            this.checkCompleted();
        }

        public function loadSound(_arg_1:Array):void
        {
            var _local_2:IAsset;
            this.m_soundArr = _arg_1;
            this.m_soundIndex = 0;
            for each (_local_2 in _arg_1) {
                _local_2.addEventListener(AssetLoadEvent.COMPLETE, this.soundCompelteHandler);
                _local_2.addEventListener(AssetLoadEvent.ERROR, this.soundCompelteHandler);
                _local_2.load(_local_2.loadArg);
            };
        }

        public function unloadSound():void
        {
            var _local_1:IAsset;
            for each (_local_1 in this.m_soundArr) {
                _local_1.removeEventListener(AssetLoadEvent.COMPLETE, this.soundCompelteHandler);
                _local_1.removeEventListener(AssetLoadEvent.ERROR, this.soundCompelteHandler);
                _local_1.stopLoad();
            };
            this.m_soundArr = null;
        }

        public function stop():void
        {
            var _local_1:IAsset;
            this.m_bLoading = false;
            var _local_2:int;
            var _local_3:* = this.m_arrAssets;
            for each (_local_1 in this.m_arrAssets) {
                _local_1.stopLoad();
            };
        }

        public function end():void
        {
            clearTimeout(this._passTimeID);
            this.removeEvent();
            this.stop();
            this.unloadSound();
            this.m_arrAssets = null;
            this.m_dicState = null;
        }

        protected function onError(_arg_1:AssetLoadEvent):void
        {
            error("AssetPrepare error", _arg_1.key);
            dispatchEvent(_arg_1);
        }

        protected function onProgress(_arg_1:AssetLoadEvent):void
        {
        }

        protected function onComplete(_arg_1:AssetLoadEvent):void
        {
            var _local_2:IAsset;
            var _local_3:AssetLoadEvent;
            var _local_4:Boolean;
            if (!this.m_isLoaded){
                _local_2 = (_arg_1.target as IAsset);
                if (_local_2 != null){
                    _local_2.removeEventListener(AssetLoadEvent.COMPLETE, this.onComplete);
                    _local_2.removeEventListener(AssetLoadEvent.ERROR, this.onError);
                };
                this.m_dicState[_local_2] = true;
                this.m_loadItem++;
                _local_3 = new AssetLoadEvent(AssetLoadEvent.LOAD_PROCESS);
                _local_3.totalItem = this.m_totalItem;
                _local_3.loadedItem = this.m_loadItem;
                _local_3.bytesTotal = _arg_1.bytesTotal;
                _local_3.key = _arg_1.key;
                _local_3.message = getQualifiedClassName(_local_2);
                dispatchEvent(_local_3);
                _local_4 = this.checkCompleted();
                clearTimeout(this._passTimeID);
                if (!_local_4){
                    this._passTimeID = setTimeout(this.checkFileError, (60 * 1000));
                };
            };
        }

        protected function checkCompleted():Boolean
        {
            var _local_1:AssetLoadEvent;
            if (this.m_totalItem == this.m_loadItem){
                this.m_isLoaded = true;
                _local_1 = new AssetLoadEvent(AssetLoadEvent.COMPLETE);
                _local_1.totalItem = this.m_totalItem;
                _local_1.loadedItem = this.m_loadItem;
                dispatchEvent(_local_1);
                return (true);
            };
            return (false);
        }

        private function checkFileError():void
        {
            var _local_2:Object;
            var _local_3:IAsset;
            var _local_1 = "";
            for (_local_2 in this.m_dicState) {
                _local_3 = (_local_2 as IAsset);
                if (((!((this.m_dicState[_local_3] == true))) && ((_local_3 is BaseAsset)))){
                    _local_1 = (_local_1 + (BaseAsset(_local_3).toString() + ","));
                };
            };
            if (_local_1.length){
                logToServer([7, 1], [_local_1]);
                debug(("资源加载失败" + _local_1));
            };
        }

        private function soundCompelteHandler(_arg_1:AssetLoadEvent):void
        {
            var _local_2:IAsset = (_arg_1.target as IAsset);
            if (_local_2){
                _local_2.removeEventListener(AssetLoadEvent.COMPLETE, this.soundCompelteHandler);
                _local_2.removeEventListener(AssetLoadEvent.ERROR, this.soundCompelteHandler);
            };
            this.m_soundIndex++;
            if (this.m_soundIndex >= this.m_soundArr.length){
                dispatchEvent(new AssetLoadEvent(AssetLoadEvent.SOUND_COMPLETE));
            };
        }

        public /*  ©init. */ function _SafeStr_69()
        {
        }


    }
}//package com.tencent.ai.core.asset.prepare

// _SafeStr_69 = " AssetPrepare" (String#14129)


