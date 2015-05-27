// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.SoundManager

package com.tencent.ai.core.sound
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SoundPackageInfo;
    import com.tencent.ai.core.sound.res.SoundAssetManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.enum.AssetLoadType;
    import flash.events.Event;
    import  ©init._SafeStr_1257;

    public class SoundManager implements ISoundManager 
    {

        private var _assetManager:ISoundAssetManager;
        private var _soundPlayHash:Dictionary;
        private var _soundPackageHash:Dictionary;
        private var _effectVolume:int = 100;
        private var _mp3PlayManager:Mp3PlayManager;


        public function initialize():void
        {
            var _local_3:SoundPackageInfo;
            var _local_4:int;
            this._assetManager = new SoundAssetManager();
            this._soundPlayHash = new Dictionary();
            this._soundPackageHash = new Dictionary();
            this._mp3PlayManager = new Mp3PlayManager();
            var _local_1:IDataManager = AICore.data;
            var _local_2:Array = SoundDef.CITY_LOAD_SOUND_IDS;
            var _local_5:int;
            while (_local_5 < _local_2.length) {
                _local_4 = int(_local_2[_local_5]);
                if (_local_4 != 0){
                    _local_3 = _local_1.getSoundPackageInfo(_local_4);
                    if (_local_3 != null){
                        _local_3.loadType = AssetLoadType.TYPE_CITY_LOAD;
                    };
                };
                _local_5++;
            };
            _local_2 = SoundDef.DUP_LOAD_SOUND_IDS;
            _local_5 = 0;
            while (_local_5 < _local_2.length) {
                _local_4 = int(_local_2[_local_5]);
                if (_local_4 != 0){
                    _local_3 = _local_1.getSoundPackageInfo(_local_4);
                    if (_local_3 != null){
                        _local_3.loadType = AssetLoadType.TYPE_DUP_LOAD;
                    };
                };
                _local_5++;
            };
        }

        public function play(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=100, _arg_5:int=0, _arg_6:ISoundSource=null, _arg_7:Boolean=true):int
        {
            var _local_10:SoundPackageInfo;
            var _local_8:SoundPackage = this._soundPackageHash[_arg_1];
            if (!_local_8){
                _local_10 = AICore.data.getSoundPackageInfo(_arg_1);
                if (_local_10){
                    _local_8 = new SoundPackage(_local_10, this._assetManager);
                    this._soundPackageHash[_arg_1] = _local_8;
                } else {
                    return (-1);
                };
            };
            var _local_9:SoundPlay = _local_8.play(_arg_2, _arg_3, ((_arg_4 * this._effectVolume) * 0.01), _arg_5, _arg_6, _arg_7);
            if (_local_9){
                _local_9.addEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
                this._soundPlayHash[_local_9.id] = _local_9;
                return (_local_9.id);
            };
            return (-1);
        }

        public function stop(_arg_1:int):void
        {
            var _local_2:SoundPlay = this._soundPlayHash[_arg_1];
            if (_local_2){
                _local_2.stop();
                this.removeSoundPlay(_local_2);
            };
        }

        public function stopSoundPackage(_arg_1:int):void
        {
            var _local_2:SoundPlay;
            for each (_local_2 in this._soundPlayHash) {
                if (_local_2.soundPackageID == _arg_1){
                    _local_2.stop();
                    this.removeSoundPlay(_local_2);
                };
            };
        }

        public function setEffectVolume(_arg_1:int):void
        {
            var _local_2:SoundPlay;
            for each (_local_2 in this._soundPlayHash) {
                _local_2.volume = ((_local_2.volume / (this._effectVolume * 0.01)) * (_arg_1 * 0.01));
            };
            this._effectVolume = _arg_1;
        }

        public function getEffectVolume():int
        {
            return (this._effectVolume);
        }

        public function setPlayVolume(_arg_1:int, _arg_2:int):void
        {
            var _local_3:SoundPlay = this._soundPlayHash[_arg_1];
            if (_local_3){
                _local_3.volume = ((_arg_2 * this._effectVolume) * 0.01);
            };
        }

        private function onSoundComplete(_arg_1:Event):void
        {
            var _local_2:SoundPlay = (_arg_1.currentTarget as SoundPlay);
            this.removeSoundPlay(_local_2);
        }

        private function removeSoundPlay(_arg_1:SoundPlay):void
        {
            _arg_1.removeEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
            this._soundPlayHash[_arg_1.id] = null;
            delete this._soundPlayHash[_arg_1.id];
        }

        public function getResource():ISoundAssetManager
        {
            return (this._assetManager);
        }

        public function playMp3(_arg_1:Object, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=true):void
        {
            this._mp3PlayManager.play(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function disposeRef(_arg_1:Object):void
        {
            this._mp3PlayManager.disposeRef(_arg_1);
        }

        public function disposeMp3(_arg_1:Object, _arg_2:String):void
        {
            this._mp3PlayManager.disposeMp3(_arg_1, _arg_2);
        }

        public function setMp3Volume(_arg_1:int):void
        {
            this._mp3PlayManager.volume = _arg_1;
        }

        public function getMp3Volume():int
        {
            return (this._mp3PlayManager.volume);
        }

        public function exsitMp3(_arg_1:Object, _arg_2:String):Boolean
        {
            return (this._mp3PlayManager.exist(_arg_1, _arg_2));
        }

        public function get mp3PlayManager():Mp3PlayManager
        {
            return (this._mp3PlayManager);
        }

        public /*  ©init. */ function _SafeStr_1257()
        {
        }


    }
}//package com.tencent.ai.core.sound

// _SafeStr_1257 = " SoundManager" (String#15308)


