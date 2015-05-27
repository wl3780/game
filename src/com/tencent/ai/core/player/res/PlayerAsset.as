// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.res.PlayerAsset

package com.tencent.ai.core.player.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.player.IEquipAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.PlayerBodyLayer;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.ai.core.asset.IAsset;
    import com.tencent.ai.core.enum.AssetPart;
    import  ©init._SafeStr_847;
    import __AS3__.vec.*;

    public class PlayerAsset extends BaseAsset 
    {

        public var playerID:PlayerID;
        public var equipsID:PlayerEquipsID;
        public var playerLayerAssets:Vector.<LayerAsset>;
        private var _equipResManager:IEquipAssetManager;
        private var _requireAssets:Vector.<BasePartAsset>;
        private var _aimState:int = 2;
        private var _currloadState:int = 2;
        private var _eachPlayerBytes:int;
        private var _allPlayerBytes:int;

        public function PlayerAsset(_arg_1:PlayerEquipsID, _arg_2:IEquipAssetManager)
        {
            this.playerID = _arg_1.playerID;
            this.equipsID = _arg_1;
            this._equipResManager = _arg_2;
        }

        private function fillAllLayers(_arg_1:Boolean=false):void
        {
            var _local_4:BasePartAsset;
            var _local_2:int = this._requireAssets.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this._requireAssets[_local_3];
                if (_local_4 != null){
                    this.fillTheLayerAsset(_local_4, _local_3, _arg_1);
                };
                _local_3++;
            };
        }

        private function fillTheLayerAsset(_arg_1:BasePartAsset, _arg_2:int, _arg_3:Boolean=false):void
        {
            var _local_4:Dictionary;
            var _local_5:Dictionary;
            if (_arg_1 != null){
                _local_4 = _arg_1.layerMotionAssets;
                if ((((_local_4 == null)) && (_arg_3))){
                    _arg_1 = _arg_1.refAsset;
                    if (_arg_1 != null){
                        _local_4 = _arg_1.layerMotionAssets;
                    };
                };
                if (_local_4 != null){
                    switch (_arg_2){
                        case PlayerBodyLayer.LAYER_RES_WEAPON:
                            this.playerLayerAssets[PlayerBodyLayer.L_WEAPON_EFFECT].motionAssets = _local_4[PlayerBodyLayer.RES_WEAPON_EFFECT];
                            this.playerLayerAssets[PlayerBodyLayer.L_WEAPON].motionAssets = _local_4[PlayerBodyLayer.RES_WEAPON];
                            this.playerLayerAssets[PlayerBodyLayer.L_WEAPON_EFFECT_1].motionAssets = _local_4[PlayerBodyLayer.RES_WEAPON_EFFECT_1];
                            this.playerLayerAssets[PlayerBodyLayer.L_WEAPON_1].motionAssets = _local_4[PlayerBodyLayer.RES_WEAPON_1];
                            return;
                        case PlayerBodyLayer.LAYER_RES_FASHION:
                            _local_5 = _local_4[PlayerBodyLayer.L_AVATAR];
                            if (_local_5 == null){
                                _local_5 = _local_4[0];
                            };
                            this.playerLayerAssets[PlayerBodyLayer.L_AVATAR].motionAssets = _local_5;
                            return;
                        case PlayerBodyLayer.LAYER_RES_AVATAR_BACK:
                            this.playerLayerAssets[PlayerBodyLayer.L_BACK_AVATAR].motionAssets = _local_4[PlayerBodyLayer.RES_BACK];
                            this.playerLayerAssets[PlayerBodyLayer.L_BACK_AVATAR_1].motionAssets = _local_4[PlayerBodyLayer.RES_BACK_1];
                            return;
                    };
                };
            };
        }

        private function colloctionAssets():void
        {
            if (this._requireAssets == null){
                this._requireAssets = new Vector.<BasePartAsset>(PlayerBodyLayer.LAYER_RES_COUNT);
            };
            var _local_1:int = this.equipsID.weaponID;
            var _local_2:EquipAsset = (this._requireAssets[PlayerBodyLayer.LAYER_RES_WEAPON] as EquipAsset);
            if (!this._equipResManager.equalEquipAsset(_local_1, _local_2)){
                this._equipResManager.returnEquipAsset(_local_2, this);
                _local_2 = this._equipResManager.getEquipAsset(_local_1, this);
                this._requireAssets[PlayerBodyLayer.LAYER_RES_WEAPON] = _local_2;
            };
            var _local_3:FashionAsset = (this._requireAssets[PlayerBodyLayer.LAYER_RES_FASHION] as FashionAsset);
            if (!this._equipResManager.equalFashionAsset(this.equipsID, _local_3)){
                this._equipResManager.returnFashionAsset(_local_3, this);
                _local_3 = this._equipResManager.getFashionAsset(this.equipsID, this);
                this._requireAssets[PlayerBodyLayer.LAYER_RES_FASHION] = _local_3;
            };
            var _local_4:int = this.equipsID.backID;
            var _local_5:EquipAsset = (this._requireAssets[PlayerBodyLayer.LAYER_RES_AVATAR_BACK] as EquipAsset);
            if (_local_4 != 0){
                if (!this._equipResManager.equalEquipAsset(_local_4, _local_5)){
                    this._equipResManager.returnEquipAsset(_local_5, this);
                    _local_5 = this._equipResManager.getEquipAsset(this.equipsID.backID, this);
                    this._requireAssets[PlayerBodyLayer.LAYER_RES_AVATAR_BACK] = _local_5;
                };
            } else {
                if (_local_5 != null){
                    this._equipResManager.returnEquipAsset(_local_5, this);
                    this._requireAssets[PlayerBodyLayer.LAYER_RES_AVATAR_BACK] = null;
                    this.playerLayerAssets[PlayerBodyLayer.L_BACK_AVATAR].motionAssets = null;
                    this.playerLayerAssets[PlayerBodyLayer.L_BACK_AVATAR_1].motionAssets = null;
                };
            };
            this.fillAllLayers(true);
        }

        private function addEvent():void
        {
            var _local_2:BaseAsset;
            var _local_1:int;
            while (_local_1 < this._requireAssets.length) {
                _local_2 = this._requireAssets[_local_1];
                if (_local_2 != null){
                    _local_2.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetComplete);
                    _local_2.addEventListener(AssetLoadEvent.ERROR, this.onAssetError);
                    _local_2.addEventListener(AssetLoadEvent.LOAD_PROCESS, this.onAssetProgress);
                };
                _local_1++;
            };
        }

        private function removeEvent():void
        {
            var _local_1:int;
            var _local_2:BaseAsset;
            if (this._requireAssets != null){
                _local_1 = 0;
                while (_local_1 < this._requireAssets.length) {
                    _local_2 = (this._requireAssets[_local_1] as BaseAsset);
                    if (_local_2 != null){
                        _local_2.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetComplete);
                        _local_2.removeEventListener(AssetLoadEvent.ERROR, this.onAssetError);
                        _local_2.removeEventListener(AssetLoadEvent.LOAD_PROCESS, this.onAssetProgress);
                    };
                    _local_1++;
                };
            };
        }

        private function isRequireLoaded():Boolean
        {
            var _local_2:BaseAsset;
            var _local_1:int;
            while (_local_1 < this._requireAssets.length) {
                _local_2 = (this._requireAssets[_local_1] as BaseAsset);
                if (((!((_local_2 == null))) && ((false == _local_2.getIsLoaded())))){
                    return (false);
                };
                _local_1++;
            };
            return (true);
        }

        private function onAssetError(_arg_1:AssetLoadEvent):void
        {
            onError(_arg_1.key, _arg_1.code);
        }

        private function onAssetProgress(_arg_1:AssetLoadEvent):void
        {
            this._eachPlayerBytes = _arg_1.bytesTotal;
        }

        private function onAssetComplete(_arg_1:AssetLoadEvent):void
        {
            this._allPlayerBytes = (this._allPlayerBytes + this._eachPlayerBytes);
            if (this.isRequireLoaded()){
                m_isLoading = false;
                m_isLoaded = true;
                onProgress(String(_arg_1.key), this._allPlayerBytes, this._allPlayerBytes);
                this.removeEvent();
                this._currloadState = this._aimState;
                this.fillAllLayers();
                assetLoaded();
            };
        }

        public function updateEquipsAsset(_arg_1:PlayerEquipsID):void
        {
            this.playerID = _arg_1.playerID;
            this.equipsID = _arg_1;
            this.motionAssets = null;
            this.m_isLoading = false;
            this.m_isLoaded = false;
            this.m_loadArg = null;
            this.load(this._currloadState);
        }

        override public function load(... _args):void
        {
            var _local_3:IAsset;
            this._aimState = _args[0];
            this._allPlayerBytes = (this._eachPlayerBytes = 0);
            if (this._currloadState < this._aimState){
                m_isLoaded = false;
                m_isLoading = true;
            };
            this.removeEvent();
            this.colloctionAssets();
            this.addEvent();
            var _local_2:int;
            while (_local_2 < this._requireAssets.length) {
                _local_3 = (this._requireAssets[_local_2] as IAsset);
                if (_local_3){
                    _local_3.priority = priority;
                    _local_3.load(this._aimState);
                };
                _local_2++;
            };
            dispatchEvent(new AssetLoadEvent(AssetLoadEvent.READY_LOAD));
        }

        override public function unload():void
        {
            this.removeEvent();
            var _local_1:EquipAsset = (this._requireAssets[PlayerBodyLayer.LAYER_RES_WEAPON] as EquipAsset);
            if (_local_1 != null){
                this._equipResManager.returnEquipAsset(_local_1, this);
            };
            var _local_2:FashionAsset = (this._requireAssets[PlayerBodyLayer.LAYER_RES_FASHION] as FashionAsset);
            if (_local_2 != null){
                this._equipResManager.returnFashionAsset(_local_2, this);
            };
            _local_1 = (this._requireAssets[PlayerBodyLayer.LAYER_RES_AVATAR_BACK] as EquipAsset);
            if (_local_1 != null){
                this._equipResManager.returnEquipAsset(_local_1, this);
            };
            this._requireAssets = null;
            this._currloadState = AssetPart.PART_NULL;
            this.playerLayerAssets = null;
            super.unload();
        }

        public function readyLoadAsset():void
        {
            this.colloctionAssets();
        }

        override public function toString():String
        {
            return ((("人物资源:" + this.playerID.toString()) + "}"));
        }

        public /*  ©init. */ function _SafeStr_847()
        {
        }


    }
}//package com.tencent.ai.core.player.res

// _SafeStr_847 = " PlayerAsset" (String#15011)


