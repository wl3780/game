// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.res.PlayerAssetsManager

package com.tencent.ai.core.player.res
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.player.IPlayerAssetManager;
    import com.tencent.ai.core.player.IPlayerSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import flash.utils.Dictionary;
    import com.tencent.free.core.manager.task.Priority;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.player.IEquipAssetManager;
    import  ©init._SafeStr_848;

    public class PlayerAssetsManager extends EventDispatcher2 implements IPlayerAssetManager 
    {

        private var _playerSys:IPlayerSystem;
        private var _data:IDataManager;
        private var _playerAssets:Dictionary;
        private var _equipAssetManager:EquipAssetsManager;

        public function PlayerAssetsManager(_arg_1:IPlayerSystem, _arg_2:IDataManager)
        {
            this._playerSys = _arg_1;
            this._data = _arg_2;
        }

        public function initialize():void
        {
            this._playerAssets = new Dictionary();
            this._equipAssetManager = new EquipAssetsManager(this._data);
        }

        public function getPlayerAsset(_arg_1:PlayerEquipsID, _arg_2:Object, _arg_3:Boolean=false):PlayerAsset
        {
            var _local_4:String = _arg_1.playerID.getKey();
            var _local_5:PlayerAsset = this._playerAssets[_local_4];
            if (_local_5 == null){
                var _local_6 = new PlayerAsset(_arg_1, this._equipAssetManager);
                _local_5 = _local_6;
                this._playerAssets[_local_4] = _local_6;
                _local_5.priority = ((_arg_3) ? Priority.PERIORITY_NORMAL_MAIN_PLAYER : Priority.PERIORITY_NORMAL_OTHER_PLAYER);
                _local_5.playerLayerAssets = this._playerSys.getFactory(_arg_1.ethnicID).getPlayerLayerAssets();
            };
            _local_5.addRef(_arg_2);
            return (_local_5);
        }

        public function returnPlayerAsset(_arg_1:PlayerAsset, _arg_2:Object):void
        {
            var _local_3:String;
            _arg_1.removeRef(_arg_2);
            if (_arg_1.getRefsLen() == 0){
                _local_3 = _arg_1.playerID.getKey();
                this._playerAssets[_local_3] = null;
                delete this._playerAssets[_local_3];
                _arg_1.unload();
            };
        }

        public function get equipAssetManager():IEquipAssetManager
        {
            return (this._equipAssetManager);
        }

        public /*  ©init. */ function _SafeStr_848()
        {
        }


    }
}//package com.tencent.ai.core.player.res

// _SafeStr_848 = " PlayerAssetsManager" (String#16661)


