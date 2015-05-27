// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.res.SoundAssetManager

package com.tencent.ai.core.sound.res
{
    import com.tencent.ai.core.sound.ISoundAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.SoundPackageInfo;
    import com.tencent.free.core.manager.task.Priority;
    import flash.media.Sound;
    import  ©init._SafeStr_1254;

    public class SoundAssetManager implements ISoundAssetManager 
    {

        private var _assetHash:Dictionary;
        private var _data:IDataManager;

        public function SoundAssetManager()
        {
            this._assetHash = new Dictionary();
            this._data = AICore.data;
        }

        public function getSoundAssets(_arg_1:int):Array
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:SoundPackageInfo;
            var _local_2:Array = this._data.getAllSoundPackageInfos();
            var _local_3:Array = [];
            if (_local_2 != null){
                _local_4 = _local_2.length;
                _local_5 = 0;
                while (_local_5 < _local_4) {
                    _local_6 = _local_2[_local_5];
                    if (_local_6.loadType == _arg_1){
                        _local_3.push(this.getSoundAsset(_local_6.id, this));
                    };
                    _local_5++;
                };
            };
            return (_local_3);
        }

        public function getSoundAsset(_arg_1:int, _arg_2:Object):SoundAsset
        {
            var _local_4:SoundPackageInfo;
            var _local_3:SoundAsset = this._assetHash[_arg_1];
            if (!_local_3){
                _local_4 = this._data.getSoundPackageInfo(_arg_1);
                if (_local_4 != null){
                    _local_3 = new SoundAsset(_local_4);
                    _local_3.priority = Priority.PERIORITY_NORMAL_SOUND;
                    this._assetHash[_arg_1] = _local_3;
                };
            };
            if (((_arg_2) && (_local_3))){
                _local_3.addRef(_arg_2);
            };
            return (_local_3);
        }

        public function disposeSoundAsset(_arg_1:SoundAsset, _arg_2:Object):void
        {
            _arg_1.removeRef(_arg_2);
            if (_arg_1.getRefsLen() == 0){
                delete this._assetHash[_arg_1.soundPackageID];
                _arg_1.unload();
            };
        }

        public function getSound(_arg_1:int, _arg_2:int, _arg_3:int):Sound
        {
            var _local_4:SoundAsset = this._assetHash[_arg_1];
            if (!_local_4){
                return (null);
            };
            var _local_5:Sound = _local_4.getSound(_arg_2, _arg_3);
            return (_local_5);
        }

        public /*  ©init. */ function _SafeStr_1254()
        {
        }


    }
}//package com.tencent.ai.core.sound.res

// _SafeStr_1254 = " SoundAssetManager" (String#15485)


