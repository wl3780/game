// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.data.DupResProfileInfo

package com.tencent.ai.core.debug.data
{
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.asset.IAsset;
    import com.tencent.ai.core.monster.res.MonsterAsset;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.interact.res.InteractItemAsset;
    import com.tencent.ai.core.sound.res.SoundAsset;
    import com.tencent.ai.core.player.res.PlayerAsset;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.render.MotionAsset;
    import  ©init._SafeStr_361;
    import __AS3__.vec.*;

    public class DupResProfileInfo 
    {

        private var _allAssetsArr:Array;
        private var _monsterVect:Vector.<DebugResVO>;
        private var _effectVect:Vector.<DebugResVO>;
        private var _interactItemVect:Vector.<DebugResVO>;
        private var _soundVect:Vector.<DebugResVO>;
        private var _playerVect:Vector.<DebugResVO>;

        public function DupResProfileInfo(_arg_1:Array)
        {
            this._monsterVect = new Vector.<DebugResVO>();
            this._effectVect = new Vector.<DebugResVO>();
            this._interactItemVect = new Vector.<DebugResVO>();
            this._soundVect = new Vector.<DebugResVO>();
            this._playerVect = new Vector.<DebugResVO>();
            super();
            this._allAssetsArr = _arg_1;
            this.checkAssets();
        }

        public function sample():Dictionary
        {
            var _local_1:Dictionary = new Dictionary();
            _local_1[DebugResType.EFFECT_TYPE] = this._effectVect;
            _local_1[DebugResType.INTERACT_TYPE] = this._interactItemVect;
            _local_1[DebugResType.MONSTER_TYPE] = this._monsterVect;
            _local_1[DebugResType.PLAYER_TYPE] = this._playerVect;
            _local_1[DebugResType.SOUND_TYPE] = this._soundVect;
            return (_local_1);
        }

        private function checkAssets():void
        {
            var _local_1:IAsset;
            for each (_local_1 in this._allAssetsArr) {
                if ((_local_1 is MonsterAsset)){
                    this.addMonsterAsset((_local_1 as MonsterAsset));
                } else {
                    if ((_local_1 is EffectAsset)){
                        this.addEffectAsset((_local_1 as EffectAsset));
                    } else {
                        if ((_local_1 is InteractItemAsset)){
                            this.addInteractItemAsset((_local_1 as InteractItemAsset));
                        } else {
                            if ((_local_1 is SoundAsset)){
                                this.addSoundAsset((_local_1 as SoundAsset));
                            } else {
                                if ((_local_1 is PlayerAsset)){
                                    this.addPlayerAsset((_local_1 as PlayerAsset));
                                };
                            };
                        };
                    };
                };
            };
        }

        private function addMonsterAsset(_arg_1:MonsterAsset):void
        {
            var _local_4:LayerAsset;
            var _local_5:MotionAsset;
            var _local_2:DebugResVO = new DebugResVO();
            _local_2.id = String(_arg_1.monsterID);
            _local_2.url = _arg_1.url;
            _local_2.size = _arg_1.totalBytes;
            var _local_3:Vector.<MotionAsset> = new Vector.<MotionAsset>();
            for each (_local_4 in _arg_1.monsterLayerAssets) {
                for each (_local_5 in _local_4.motionAssets) {
                    _local_3.push(_local_5);
                };
            };
            _local_2.motionAssetVect = _local_3;
            this._monsterVect.push(_local_2);
        }

        private function addEffectAsset(_arg_1:EffectAsset):void
        {
            var _local_4:MotionAsset;
            var _local_2:DebugResVO = new DebugResVO();
            _local_2.id = String(_arg_1.id);
            _local_2.url = _arg_1.url;
            _local_2.size = _arg_1.totalBytes;
            var _local_3:Vector.<MotionAsset> = new Vector.<MotionAsset>();
            for each (_local_4 in _arg_1.motionAssets) {
                _local_3.push(_local_4);
            };
            _local_2.motionAssetVect = _local_3;
            this._effectVect.push(_local_2);
        }

        private function addInteractItemAsset(_arg_1:InteractItemAsset):void
        {
            var _local_4:LayerAsset;
            var _local_5:MotionAsset;
            var _local_2:DebugResVO = new DebugResVO();
            _local_2.id = String(_arg_1.id);
            _local_2.url = _arg_1.url;
            _local_2.size = _arg_1.totalBytes;
            var _local_3:Vector.<MotionAsset> = new Vector.<MotionAsset>();
            for each (_local_4 in _arg_1.interactItemLayerAssets) {
                for each (_local_5 in _local_4.motionAssets) {
                    _local_3.push(_local_5);
                };
            };
            _local_2.motionAssetVect = _local_3;
            this._interactItemVect.push(_local_2);
        }

        private function addSoundAsset(_arg_1:SoundAsset):void
        {
            var _local_2:DebugResVO = new DebugResVO();
            _local_2.id = String(_arg_1.soundPackageID);
            _local_2.size = _arg_1.totalBytes;
            this._soundVect.push(_local_2);
        }

        private function addPlayerAsset(_arg_1:PlayerAsset):void
        {
            var _local_4:LayerAsset;
            var _local_5:MotionAsset;
            var _local_2:DebugResVO = new DebugResVO();
            _local_2.id = String(_arg_1.playerID.toString());
            _local_2.size = _arg_1.totalBytes;
            var _local_3:Vector.<MotionAsset> = new Vector.<MotionAsset>();
            for each (_local_4 in _arg_1.playerLayerAssets) {
                for each (_local_5 in _local_4.motionAssets) {
                    _local_3.push(_local_5);
                };
            };
            _local_2.motionAssetVect = _local_3;
            this._playerVect.push(_local_2);
        }

        public /*  ©init. */ function _SafeStr_361()
        {
        }


    }
}//package com.tencent.ai.core.debug.data

// _SafeStr_361 = " DupResProfileInfo" (String#17753)


