// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.impl.PlayerSystem

package com.tencent.ai.core.player.impl
{
    import com.tencent.ai.core.player.IPlayerSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.net.INetwork;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.player.res.PlayerAssetsManager;
    import com.tencent.ai.core.player.IPlayerModelManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EthnicInfo;
    import __AS3__.vec.Vector;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.player.IPlayerFactory;
    import com.tencent.ai.core.player.IPlayerAssetManager;
    import com.tencent.ai.core.player.IPlayerManager;
    import  ©init._SafeStr_842;

    public class PlayerSystem implements IPlayerSystem 
    {

        protected var data:IDataManager;
        protected var net:INetwork;
        protected var effect:IEffectManager;
        protected var resManager:PlayerAssetsManager;
        protected var modelManager:IPlayerModelManager;
        protected var playerFactorys:Dictionary;


        public function initialize(_arg_1:IDataManager, _arg_2:INetwork, _arg_3:IEffectManager, _arg_4:IPlayerModelManager):void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:EthnicInfo;
            var _local_9:int;
            this.data = _arg_1;
            this.net = _arg_2;
            this.effect = _arg_3;
            this.playerFactorys = new Dictionary();
            var _local_5:Vector.<EthnicInfo> = _arg_1.getAllEthnicInfos();
            if (_local_5 != null){
                _local_6 = _local_5.length;
                _local_7 = 0;
                while (_local_7 < _local_6) {
                    _local_8 = _local_5[_local_7];
                    if (_local_8 != null){
                        _local_9 = _local_8.id;
                        this.playerFactorys[_local_9] = (CLASS.current.tryNewInstance(_local_8.factoryClass, [_local_8]) as IPlayerFactory);
                    };
                    _local_7++;
                };
            };
            this.resManager = new PlayerAssetsManager(this, _arg_1);
            this.resManager.initialize();
            this.modelManager = _arg_4;
            if (_arg_4 != null){
                this.modelManager.initialize();
            };
        }

        public function getResource():IPlayerAssetManager
        {
            return (this.resManager);
        }

        public function newManager(_arg_1:Class=null):IPlayerManager
        {
            if (_arg_1 == null){
                _arg_1 = BasePlayerManager;
            };
            return ((new (_arg_1)(this) as IPlayerManager));
        }

        public function getFactory(_arg_1:int):IPlayerFactory
        {
            return (this.playerFactorys[_arg_1]);
        }

        public function getPlayerModelManager():IPlayerModelManager
        {
            return (this.modelManager);
        }

        public /*  ©init. */ function _SafeStr_842()
        {
        }


    }
}//package com.tencent.ai.core.player.impl

// _SafeStr_842 = " PlayerSystem" (String#15323)


