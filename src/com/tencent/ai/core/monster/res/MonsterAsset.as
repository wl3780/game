// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.res.MonsterAsset

package com.tencent.ai.core.monster.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.AssetLayerInfo;
    import com.tencent.ai.core.render.LayerAsset;
    import flash.display.BitmapData;
    import com.tencent.ai.core.manager.icon.IconLoader;
    import com.tencent.ai.core.monster.ISegmentAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.icon.IIcon;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_781;
    import __AS3__.vec.*;

    public class MonsterAsset extends BaseAsset 
    {

        public var assetID:int;
        public var monsterID:int;
        public var monsterType:int;
        public var staticInfo:MonsterStaticInfo;
        public var assetLayerInfos:Vector.<AssetLayerInfo>;
        public var mainLayerIndex:int = 0;
        public var monsterLayerAssets:Vector.<LayerAsset>;
        public var headIcon:BitmapData;
        public var url:String;
        private var _key:String;
        private var _iconLoader:IconLoader;
        private var _segmentAM:ISegmentAssetManager;
        private var _segmentAssets:Dictionary;
        private var _totalSegment:int;

        public function MonsterAsset(_arg_1:MonsterStaticInfo, _arg_2:ISegmentAssetManager)
        {
            this.staticInfo = _arg_1;
            this._segmentAM = _arg_2;
            this.initThis();
        }

        private function initThis():void
        {
            var _local_1:int;
            var _local_2:AssetLayerInfo;
            var _local_3:int;
            var _local_4:String;
            this.assetID = this.staticInfo.assetID;
            this.monsterID = this.staticInfo.monsterID;
            this.monsterType = this.staticInfo.type;
            this.url = ((DEFINE.MONSTER_RES_SRC + this.assetID) + ".swf");
            this._key = this.url;
            m_isLoading = false;
            m_isLoaded = false;
            this._segmentAssets = new Dictionary();
            this.assetLayerInfos = this.staticInfo.assetLayerInfos;
            if (this.assetLayerInfos != null){
                _local_1 = 0;
                while (_local_1 < this.assetLayerInfos.length) {
                    _local_2 = this.assetLayerInfos[_local_1];
                    _local_3 = _local_2.assetID;
                    _local_4 = ((DEFINE.MONSTER_RES_SRC + _local_3) + ".swf");
                    if (this._segmentAssets[_local_3] == null){
                        this._segmentAssets[_local_3] = this._segmentAM.getSegmentAsset(_local_4, this);
                    };
                    if (_local_2.mainlayer){
                        this.mainLayerIndex = _local_1;
                    };
                    _local_1++;
                };
            } else {
                this._segmentAssets[this.assetID] = this._segmentAM.getSegmentAsset(this.url, this);
                this._totalSegment = 1;
            };
        }

        private function onHeadIconLoaded(_arg_1:TaskEvent):void
        {
            var _local_2:IIcon = (this._iconLoader.content as IIcon);
            this.headIcon = _local_2.icon;
        }

        private function listen(_arg_1:Boolean):void
        {
            var _local_2:SegmentAsset;
            if (this._segmentAssets != null){
                if (_arg_1){
                    for each (_local_2 in this._segmentAssets) {
                        _local_2.addEventListener(AssetLoadEvent.COMPLETE, this.onSALoadComplete);
                        _local_2.addEventListener(AssetLoadEvent.ERROR, this.onSAError);
                        _local_2.addEventListener(AssetLoadEvent.LOAD_PROCESS, this.onSAProgress);
                    };
                } else {
                    for each (_local_2 in this._segmentAssets) {
                        _local_2.removeEventListener(AssetLoadEvent.COMPLETE, this.onSALoadComplete);
                        _local_2.removeEventListener(AssetLoadEvent.ERROR, this.onSAError);
                        _local_2.removeEventListener(AssetLoadEvent.LOAD_PROCESS, this.onSAProgress);
                    };
                };
            };
        }

        private function isSegmentsLoaded():Boolean
        {
            var _local_1:SegmentAsset;
            if (!m_isLoaded){
                for each (_local_1 in this._segmentAssets) {
                    if (!_local_1.getIsLoaded()){
                        return (false);
                    };
                };
            };
            return (true);
        }

        private function onSALoadComplete(_arg_1:AssetLoadEvent):void
        {
            var _local_2:Dictionary;
            var _local_3:LayerAsset;
            var _local_4:LayerAsset;
            var _local_5:int;
            var _local_6:AssetLayerInfo;
            if (this.isSegmentsLoaded()){
                m_isLoading = false;
                m_isLoaded = true;
                this.listen(false);
                this.monsterLayerAssets = new Vector.<LayerAsset>();
                if (this.assetLayerInfos == null){
                    _local_2 = SegmentAsset(this._segmentAssets[this.assetID]).layerAssetsDict;
                    for each (_local_3 in _local_2) {
                        this.monsterLayerAssets.push(_local_3);
                    };
                } else {
                    _local_5 = 0;
                    while (_local_5 < this.assetLayerInfos.length) {
                        _local_6 = this.assetLayerInfos[_local_5];
                        _local_3 = SegmentAsset(this._segmentAssets[_local_6.assetID]).layerAssetsDict[_local_6.layerID];
                        _local_4 = new LayerAsset();
                        _local_4.layerID = _local_5;
                        _local_4.mainlayer = _local_6.mainlayer;
                        _local_4.name = _local_3.name;
                        _local_4.motionAssets = _local_3.motionAssets;
                        this.monsterLayerAssets.push(_local_4);
                        _local_5++;
                    };
                };
                assetLoaded();
            };
        }

        private function onSAError(_arg_1:AssetLoadEvent):void
        {
            m_isLoading = false;
            this.listen(false);
            onError(this._key, -1);
        }

        private function onSAProgress(_arg_1:AssetLoadEvent):void
        {
            onProgress(String(_arg_1.key), _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        override public function load(... _args):void
        {
            var _local_2:SegmentAsset;
            if (m_isLoading){
                return;
            };
            if (m_isLoaded){
                asynInvoke(new CFunction(assetLoaded, this));
                return;
            };
            m_isLoading = true;
            this.listen(true);
            for each (_local_2 in this._segmentAssets) {
                _local_2.load();
            };
            this._iconLoader = new IconLoader("", (((DEFINE.ICON_RES_SRC + "monster/head_") + this.assetID) + ".PNG"));
            this._iconLoader.retryTimes = 0;
            this._iconLoader.content.addEventListener(TaskEvent.COMPLETE, this.onHeadIconLoaded);
            this._iconLoader.load();
        }

        override public function unload():void
        {
            var _local_1:SegmentAsset;
            this.listen(false);
            if (this._segmentAssets != null){
                for each (_local_1 in this._segmentAssets) {
                    this._segmentAM.returnSegmentAsset(_local_1, this);
                };
                this._segmentAssets = null;
            };
            this._totalSegment = 0;
            this._segmentAM = null;
            this.assetLayerInfos = null;
            this.mainLayerIndex = 0;
            this.monsterLayerAssets = null;
            if (this._iconLoader){
                this._iconLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onHeadIconLoaded);
                this._iconLoader.unload();
                this._iconLoader = null;
                this.headIcon = null;
            };
            super.unload();
        }

        override public function toString():String
        {
            return ((((((((("怪物资源 { name:" + this.staticInfo.name) + ",id:") + this.monsterID) + ",assetID:") + this.assetID) + "url:") + this.url) + "}"));
        }

        public /*  ©init. */ function _SafeStr_781()
        {
        }


    }
}//package com.tencent.ai.core.monster.res

// _SafeStr_781 = " MonsterAsset" (String#17786)


