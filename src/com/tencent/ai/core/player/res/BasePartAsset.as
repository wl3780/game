// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.res.BasePartAsset

package com.tencent.ai.core.player.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.moviepackage.MoviePackageLoader;
    import com.tencent.ai.core.enum.AssetPart;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.manager.moviepackage.IMoviePackageFile;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.render.MotionAsset;
    import  ©init._SafeStr_843;

    public class BasePartAsset extends BaseAsset 
    {

        public var layerMotionAssets:Dictionary;
        public var refAsset:BasePartAsset;
        public var refEID:int = 0;
        public var refPosType:int = 0;
        protected var m_refLoading:Boolean = false;
        protected var m_baseURL:String;
        protected var m_baseKey:String;
        protected var m_basempLoader:MoviePackageLoader;
        protected var m_extraURL:String;
        protected var m_extraKey:String;
        protected var m_extrampLoader:MoviePackageLoader;
        protected var m_bytesTotalBase:int;
        protected var m_bytesLoadBase:int;
        protected var m_bytesTotalExtra:int;
        protected var m_bytesLoadExtra:int;
        protected var m_bBaseLoaded:Boolean;
        protected var m_bExtraLoaded:Boolean;
        protected var m_baseLayerAssets:Dictionary;
        protected var m_extraLayerAssets:Dictionary;
        protected var m_loadState:int;
        protected var m_aimLoadState:int;

        public function BasePartAsset(_arg_1:String, _arg_2:BasePartAsset=null)
        {
            this.m_bBaseLoaded = false;
            this.m_bytesTotalBase = 0;
            this.m_bytesLoadBase = 0;
            this.m_bExtraLoaded = false;
            this.m_bytesTotalExtra = 0;
            this.m_bytesLoadExtra = 0;
            this.m_loadState = AssetPart.PART_NULL;
            this.m_aimLoadState = AssetPart.PART_NULL;
            this.m_baseURL = (_arg_1 + AssetPart.BASE_URL);
            this.m_baseKey = this.m_baseURL;
            this.m_extraURL = (_arg_1 + AssetPart.EXTRA_URL);
            this.m_extraKey = this.m_extraURL;
            this.refAsset = _arg_2;
        }

        protected function listen(_arg_1:Boolean, _arg_2:MoviePackageLoader):void
        {
            if (_arg_2 == null){
                return;
            };
            var _local_3:IContent = _arg_2.content;
            if (_arg_1){
                _local_3.addEventListener(TaskEvent.COMPLETE, this.onMoviePackageComplete);
                _local_3.addEventListener(TaskEvent.IO_ERROR, this.onMoviePackageError);
                _local_3.addEventListener(TaskEvent.PROGRESS, this.onMoviePackageProgress);
            } else {
                _local_3.removeEventListener(TaskEvent.COMPLETE, this.onMoviePackageComplete);
                _local_3.removeEventListener(TaskEvent.IO_ERROR, this.onMoviePackageError);
                _local_3.removeEventListener(TaskEvent.PROGRESS, this.onMoviePackageProgress);
            };
        }

        protected function baseLoadStart():void
        {
            var _local_1:Object;
            if (this.m_basempLoader == null){
                this.m_basempLoader = new MoviePackageLoader(this.m_baseKey);
                this.m_basempLoader.priority = priority;
                this.m_basempLoader.url = this.m_baseURL;
                this.m_basempLoader.saveSO = m_bSaveSO;
                if (this.refAsset != null){
                    _local_1 = this.m_basempLoader.loadInfo;
                    _local_1.useRefXMLMovie = true;
                    _local_1.refFPF = this.refAsset.getMoviePackageFile(AssetPart.BASE_URL).framesPackageFile;
                };
                this.listen(true, this.m_basempLoader);
            };
            this.m_basempLoader.load();
        }

        protected function extraLoadStart():void
        {
            var _local_1:Object;
            if (this.m_extrampLoader == null){
                this.m_extrampLoader = new MoviePackageLoader(this.m_extraKey);
                this.m_extrampLoader.priority = priority;
                this.m_extrampLoader.url = this.m_extraURL;
                this.m_extrampLoader.saveSO = m_bSaveSO;
                if (this.refAsset != null){
                    _local_1 = this.m_extrampLoader.loadInfo;
                    _local_1.useRefXMLMovie = true;
                    _local_1.refFPF = this.refAsset.getMoviePackageFile(AssetPart.EXTRA_URL).framesPackageFile;
                };
                this.listen(true, this.m_extrampLoader);
            };
            this.m_extrampLoader.load();
        }

        protected function onRefAssetLoaded(_arg_1:AssetLoadEvent):void
        {
            if (this.m_refLoading){
                this.m_refLoading = false;
                this.refAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.onRefAssetLoaded);
            };
            if (this.m_aimLoadState >= AssetPart.PART_BASE){
                this.baseLoadStart();
            } else {
                this.baseLoadStart();
                this.extraLoadStart();
            };
        }

        protected function loadRefAsset():void
        {
            if (this.refAsset == null){
                this.onRefAssetLoaded(null);
            } else {
                if (!this.m_refLoading){
                    this.m_refLoading = true;
                    this.refAsset.addEventListener(AssetLoadEvent.COMPLETE, this.onRefAssetLoaded);
                };
                this.refAsset.priority = priority;
                this.refAsset.load(this.m_aimLoadState);
            };
        }

        override public function load(... _args):void
        {
            this.m_aimLoadState = _args[0];
            if (this.m_aimLoadState > AssetPart.PART_BASE){
                this.m_aimLoadState = AssetPart.PART_BASE;
            };
            if (this.m_loadState == this.m_aimLoadState){
                if (m_isLoading){
                    return;
                };
                if (m_isLoaded){
                    asynInvoke(new CFunction(assetLoaded, this));
                    return;
                };
            } else {
                if (this.m_loadState > this.m_aimLoadState){
                    m_isLoaded = false;
                };
            };
            m_isLoading = true;
            this.loadRefAsset();
        }

        override public function unload():void
        {
            if (this.m_refLoading){
                this.m_refLoading = false;
                this.refAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.onRefAssetLoaded);
            };
            if (this.m_basempLoader){
                this.listen(false, this.m_basempLoader);
                this.m_basempLoader.unload();
                this.m_basempLoader = null;
            };
            if (this.m_extrampLoader){
                this.listen(false, this.m_extrampLoader);
                this.m_extrampLoader.unload();
                this.m_extrampLoader = null;
            };
            this.refAsset = null;
            this.m_loadState = AssetPart.PART_NULL;
            this.m_aimLoadState = AssetPart.PART_NULL;
            this.m_bBaseLoaded = false;
            this.m_bExtraLoaded = false;
            super.unload();
        }

        public function set aimLoadState(_arg_1:int):void
        {
            if (this.m_aimLoadState >= _arg_1){
                this.m_aimLoadState = _arg_1;
            };
        }

        public function get aimLoadState():int
        {
            return (this.m_aimLoadState);
        }

        public function get currentLoadState():int
        {
            return (this.m_loadState);
        }

        public function getMoviePackageFile(_arg_1:String):IMoviePackageFile
        {
            var _local_2:IContent = (((_arg_1 == AssetPart.BASE_URL)) ? (this.m_basempLoader.content) : this.m_extrampLoader.content);
            return (IMoviePackageFile(_local_2));
        }

        public function onMoviePackageComplete(_arg_1:TaskEvent):void
        {
            var _local_2:IMoviePackageFile;
            var _local_3:LayerAsset;
            var _local_4:Dictionary;
            var _local_5:Dictionary;
            var _local_6:MotionAsset;
            if (m_isLoading){
                if (this.m_baseKey == _arg_1.key){
                    this.m_bBaseLoaded = true;
                    _local_2 = IMoviePackageFile(this.m_basempLoader.content);
                    this.m_baseLayerAssets = _local_2.layerAssets;
                } else {
                    if ((((this.m_extraKey == _arg_1.key)) && ((this.m_aimLoadState == AssetPart.PART_FULL)))){
                        this.m_bExtraLoaded = true;
                        _local_2 = IMoviePackageFile(this.m_extrampLoader.content);
                        this.m_extraLayerAssets = _local_2.layerAssets;
                    };
                };
                if ((((((this.m_aimLoadState == AssetPart.PART_BASE)) && (this.m_bBaseLoaded))) || ((((((this.m_aimLoadState == AssetPart.PART_FULL)) && (this.m_bBaseLoaded))) && (this.m_bExtraLoaded))))){
                    m_isLoading = false;
                    m_isLoaded = true;
                    if (this.layerMotionAssets == null){
                        this.layerMotionAssets = new Dictionary();
                    };
                    if (this.m_baseLayerAssets != null){
                        for each (_local_3 in this.m_baseLayerAssets) {
                            _local_5 = this.layerMotionAssets[_local_3.layerID];
                            if (_local_5 == null){
                                _local_5 = new Dictionary();
                                this.layerMotionAssets[_local_3.layerID] = _local_5;
                            };
                            _local_4 = _local_3.motionAssets;
                            for each (_local_6 in _local_4) {
                                _local_5[_local_6.motionID] = _local_6;
                            };
                        };
                    };
                    if (this.m_extraLayerAssets){
                        for each (_local_3 in this.m_extraLayerAssets) {
                            _local_5 = this.layerMotionAssets[_local_3.layerID];
                            if (_local_5 == null){
                                _local_5 = new Dictionary();
                                this.layerMotionAssets[_local_3.layerID] = _local_5;
                            };
                            _local_4 = _local_3.motionAssets;
                            for each (_local_6 in _local_4) {
                                _local_5[_local_6.motionID] = _local_6;
                            };
                        };
                    };
                    this.m_loadState = this.m_aimLoadState;
                    assetLoaded();
                };
            };
        }

        public function onMoviePackageError(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            onError(String(_arg_1.key), -1);
        }

        public function onMoviePackageProgress(_arg_1:TaskEvent):void
        {
            onProgress(String(_arg_1.key), _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        public /*  ©init. */ function _SafeStr_843()
        {
        }


    }
}//package com.tencent.ai.core.player.res

// _SafeStr_843 = " BasePartAsset" (String#14675)


