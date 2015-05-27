// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.res.EquipAssetsManager

package com.tencent.ai.core.player.res
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.player.IEquipAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.data.IDataManager;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.tencent.ai.core.enum.AssetPart;
    import com.tencent.ai.core.enum.ItemConstants;
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.data.CareerWearStaticInfo;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import  ©init._SafeStr_845;

    public class EquipAssetsManager extends EventDispatcher2 implements IEquipAssetManager 
    {

        private var _equipAssets:Dictionary;
        private var _avatarsAssets:Dictionary;
        private var _data:IDataManager;
        private var _cityRefAssets:Array;
        private var _timer:Timer;
        private var _returnRefList:Array;

        public function EquipAssetsManager(_arg_1:IDataManager)
        {
            this._equipAssets = new Dictionary();
            this._avatarsAssets = new Dictionary();
            this._data = _arg_1;
            this._timer = new Timer(5000);
            this._timer.addEventListener(TimerEvent.TIMER, this.onReturnRefAsset);
            this._returnRefList = [];
        }

        private function onReturnRefAsset(_arg_1:TimerEvent):void
        {
            var _local_2:int = this._returnRefList.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.returnRefAsset(this._returnRefList[_local_3]);
                _local_3++;
            };
            this._returnRefList.length = 0;
            this._timer.stop();
        }

        private function getRefAsset(_arg_1:EquipStaticInfo, _arg_2:int=-1, _arg_3:int=-1):BasePartAsset
        {
            var _local_4:BasePartAsset;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            if (_arg_1 != null){
                _arg_2 = int((_arg_1.careerID / 100));
                _arg_3 = _arg_1.posType;
            };
            _local_5 = AssetPart.REF_ASSET_INFOS[_arg_2];
            if (_local_5 != null){
                switch (_arg_3){
                    case ItemConstants.PosTyte_WEAPON:
                        _local_6 = _local_5.weapon;
                        if (_local_6 != null){
                            _local_4 = _local_6.asset;
                            if (_local_4 == null){
                                _local_4 = new EquipAsset(_local_6.id, null, null);
                                _local_6.asset = _local_4;
                            };
                        };
                        break;
                    case ItemConstants.PosTyte_BACK:
                        _local_7 = _local_5.backEquip;
                        if (_local_7 != null){
                            _local_4 = _local_7.asset;
                            if (_local_4 == null){
                                _local_4 = new EquipAsset(_local_7.id, null, null);
                                _local_7.asset = _local_4;
                            };
                        };
                        break;
                    case ItemConstants.PosTyte_FASHION:
                        _local_8 = _local_5.ethnic;
                        if (_local_8 != null){
                            _local_4 = _local_8.asset;
                            if (_local_4 == null){
                                _local_4 = new FashionAsset(_local_8.id, null, null);
                                _local_8.asset = _local_4;
                            };
                        };
                        break;
                };
            };
            if (_local_4 != null){
                _local_4.refEID = _arg_2;
                _local_4.refPosType = _arg_3;
            };
            return (_local_4);
        }

        private function returnRefAsset(_arg_1:BasePartAsset):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            _arg_1.removeRef(this);
            if (_arg_1.getRefsLen() == 0){
                _local_2 = AssetPart.REF_ASSET_INFOS[_arg_1.refEID];
                switch (_arg_1.refPosType){
                    case ItemConstants.PosTyte_WEAPON:
                        _local_3 = _local_2.weapon;
                        if (_local_3 != null){
                            _local_3.asset = null;
                        };
                        break;
                    case ItemConstants.PosTyte_BACK:
                        _local_4 = _local_2.backEquip;
                        if (_local_4 != null){
                            _local_4.asset = null;
                        };
                        break;
                    case ItemConstants.PosTyte_FASHION:
                        _local_5 = _local_2.ethnic;
                        if (_local_5 != null){
                            _local_5.asset = null;
                        };
                        break;
                };
                _arg_1.unload();
            };
        }

        public function equalEquipAsset(_arg_1:int, _arg_2:EquipAsset):Boolean
        {
            if (_arg_2 == null){
                return (false);
            };
            var _local_3:int = -1;
            var _local_4:EquipStaticInfo = this._data.getEquipStaticInfo(_arg_1);
            if (_local_4 != null){
                _local_3 = _local_4.avatarShowID;
            };
            return ((_local_3 == _arg_2.assetID));
        }

        public function getEquipAsset(_arg_1:int, _arg_2:Object):EquipAsset
        {
            var _local_4:EquipStaticInfo;
            var _local_5:int;
            var _local_3:EquipAsset;
            if ((((_arg_1 >= 0)) && (!((_arg_2 == null))))){
                _local_4 = this._data.getEquipStaticInfo(_arg_1);
                if (_local_4 != null){
                    _local_5 = _local_4.avatarShowID;
                    _local_3 = this._equipAssets[_local_5];
                    if (_local_3 == null){
                        _local_3 = new EquipAsset(_local_5, _local_4, this.getRefAsset(_local_4));
                        this._equipAssets[_local_5] = _local_3;
                    };
                };
                if (_local_3){
                    if (_local_3.refAsset != null){
                        _local_3.refAsset.addRef(this);
                    };
                    if (_arg_2){
                        _local_3.addRef(_arg_2);
                    };
                };
            };
            return (_local_3);
        }

        public function returnEquipAsset(_arg_1:EquipAsset, _arg_2:Object):void
        {
            if (((_arg_1) && (_arg_2))){
                if (_arg_1.refAsset){
                    this._returnRefList.push(_arg_1.refAsset);
                    if (this._timer.running){
                        this._timer.reset();
                    };
                    this._timer.start();
                };
                _arg_1.removeRef(_arg_2);
                if (_arg_1.getRefsLen() == 0){
                    delete this._equipAssets[_arg_1.assetID];
                    _arg_1.unload();
                };
            };
        }

        public function equalFashionAsset(_arg_1:PlayerEquipsID, _arg_2:FashionAsset):Boolean
        {
            var _local_3:EquipStaticInfo;
            var _local_5:int;
            var _local_6:CareerWearStaticInfo;
            if (_arg_2 == null){
                return (false);
            };
            var _local_4:int = _arg_1.fashionAvatarID;
            if (_local_4 == 0){
                _local_6 = this._data.getCareerWearStaticInfo(_arg_1.careerID, _arg_1.careerLevel, _arg_1.careerType);
                _local_5 = (((_local_6 == null)) ? 10000000000 : _local_6.resourceID);
            } else {
                _local_3 = this._data.getEquipStaticInfo(_local_4);
                _local_5 = _local_3.avatarShowID;
            };
            return ((_local_5 == _arg_2.assetID));
        }

        public function getFashionAsset(_arg_1:PlayerEquipsID, _arg_2:Object):FashionAsset
        {
            var _local_4:EquipStaticInfo;
            var _local_5:int;
            var _local_6:int;
            var _local_7:CareerWearStaticInfo;
            var _local_3:FashionAsset;
            if (((_arg_1) && (_arg_2))){
                _local_5 = _arg_1.fashionAvatarID;
                if (_local_5 == 0){
                    _local_7 = this._data.getCareerWearStaticInfo(_arg_1.careerID, _arg_1.careerLevel, _arg_1.careerType);
                    _local_6 = (((_local_7 == null)) ? _arg_1.ethnicID : _local_7.resourceID);
                } else {
                    _local_4 = this._data.getEquipStaticInfo(_local_5);
                    _local_6 = _local_4.avatarShowID;
                };
                _local_3 = this._avatarsAssets[_local_6];
                if (_local_3 == null){
                    _local_3 = new FashionAsset(_local_6, _local_4, this.getRefAsset(null, _arg_1.ethnicID, ItemConstants.PosTyte_FASHION));
                    this._avatarsAssets[_local_6] = _local_3;
                };
                if (_local_3){
                    if (_local_3.refAsset){
                        _local_3.refAsset.addRef(this);
                    };
                    if (_arg_2){
                        _local_3.addRef(_arg_2);
                    };
                };
            };
            return (_local_3);
        }

        public function returnFashionAsset(_arg_1:FashionAsset, _arg_2:Object):void
        {
            if (((_arg_1) && (_arg_2))){
                if (_arg_1.refAsset){
                    this._returnRefList.push(_arg_1.refAsset);
                    if (this._timer.running){
                        this._timer.reset();
                    };
                    this._timer.start();
                };
                _arg_1.removeRef(_arg_2);
                if (_arg_1.getRefsLen() == 0){
                    delete this._avatarsAssets[_arg_1.assetID];
                    _arg_1.unload();
                };
            };
        }

        public function getCityRefAssets():Array
        {
            if (this._cityRefAssets == null){
                this._cityRefAssets = [];
            };
            return (this._cityRefAssets);
        }

        public function unloadRefAsset():void
        {
            var _local_2:int;
            var _local_3:BasePartAsset;
            var _local_1:int;
            while (_local_1 < AssetPart.REF_ASSET_INFOS.length) {
                _local_2 = (_local_1 + 1);
                _local_3 = this.getRefAsset(null, _local_2, ItemConstants.PosTyte_WEAPON);
                if (_local_3 != null){
                    _local_3.unload();
                };
                _local_3 = this.getRefAsset(null, _local_2, ItemConstants.PosTyte_FASHION);
                if (_local_3 != null){
                    _local_3.unload();
                };
                _local_3 = this.getRefAsset(null, _local_2, ItemConstants.PosTyte_BACK);
                if (_local_3 != null){
                    _local_3.unload();
                };
                _local_1++;
            };
        }

        public /*  ©init. */ function _SafeStr_845()
        {
        }


    }
}//package com.tencent.ai.core.player.res

// _SafeStr_845 = " EquipAssetsManager" (String#14006)


