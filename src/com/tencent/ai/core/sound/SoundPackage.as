// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.SoundPackage

package com.tencent.ai.core.sound
{
    import com.tencent.ai.core.sound.ISoundAssetManager;
    import com.tencent.ai.core.data.SoundPackageInfo;
    import com.tencent.ai.core.data.SoundInfo;
    import com.tencent.ai.core.enum.SoundPackageType;
    import flash.media.Sound;
    import flash.events.Event;
    import com.tencent.ai.core.sound.ISoundSource;
    import  ©init._SafeStr_1258;
    import com.tencent.ai.core.sound.*;

    class SoundPackage 
    {

        private var _assetManager:ISoundAssetManager;
        private var _info:SoundPackageInfo;
        private var _currentSoundInfo:SoundInfo;
        private var _play_instance_counter:int;

        public function SoundPackage(_arg_1:SoundPackageInfo, _arg_2:ISoundAssetManager)
        {
            this._info = _arg_1;
            this._assetManager = _arg_2;
        }

        public function play(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0, _arg_5:ISoundSource=null, _arg_6:Boolean=false):SoundPlay
        {
            var _local_7:SoundInfo;
            if (this._play_instance_counter >= this._info.maxPlayLimit){
                return (null);
            };
            switch (this._info.type){
                case SoundPackageType.RANDOM:
                    _local_7 = this.getRandomSoundInfo();
                    break;
                case SoundPackageType.SHUFFLE:
                    if (((!(this._currentSoundInfo)) || (((this._currentSoundInfo.id + 1) == this._info.soundInfoList.length)))){
                        _local_7 = this._info.soundInfoList[0];
                    } else {
                        _local_7 = this._info.soundInfoList[(this._currentSoundInfo.id + 1)];
                    };
                    break;
                case SoundPackageType.RANDOM_NO_REPEAT:
                    do  {
                        _local_7 = this.getRandomSoundInfo();
                    } while ((((((this._info.soundInfoList.length > 1)) && (this._currentSoundInfo))) && ((_local_7.id == this._currentSoundInfo.id))));
                    break;
            };
            this._currentSoundInfo = _local_7;
            if ((((this._currentSoundInfo == null)) || (this._currentSoundInfo.dontPlay))){
                return (null);
            };
            var _local_8:Sound = this._assetManager.getSound(this._info.id, this._currentSoundInfo.swfID, this._currentSoundInfo.mp3ID);
            if (!_local_8){
                return (null);
            };
            this._play_instance_counter++;
            var _local_9:SoundPlay = new SoundPlay(this._info.id);
            _local_9.play(_local_8, _arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
            _local_9.addEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
            return (_local_9);
        }

        private function getRandomSoundInfo():SoundInfo
        {
            var _local_4:SoundInfo;
            var _local_1:Number = Math.random();
            var _local_2:Number = 0;
            var _local_3:int = this._info.soundInfoList.length;
            var _local_5:int;
            while (_local_5 < _local_3) {
                _local_4 = this._info.soundInfoList[_local_5];
                _local_2 = (_local_2 + _local_4.rate);
                if (_local_1 < _local_2) break;
                _local_5++;
            };
            return (_local_4);
        }

        private function onSoundComplete(_arg_1:Event):void
        {
            var _local_2:SoundPlay = (_arg_1.currentTarget as SoundPlay);
            _local_2.removeEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
            this._play_instance_counter--;
        }

        public /*  ©init. */ function _SafeStr_1258()
        {
        }


    }
}//package com.tencent.ai.core.sound

// _SafeStr_1258 = " SoundPackage" (String#16886)


