// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.impl.BasePlayerFactory

package com.tencent.ai.core.player.impl
{
    import com.tencent.ai.core.player.IPlayerFactory;
    import com.tencent.ai.core.data.EthnicInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.player.BasePlayerController;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.action.DynamicAttackAction;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.enum.PlayerBodyLayer;
    import  ©init._SafeStr_840;
    import __AS3__.vec.*;

    public class BasePlayerFactory implements IPlayerFactory 
    {

        protected var m_ethnicID:int;
        protected var m_ethnicInfo:EthnicInfo;
        protected var m_playerCls:Class;
        protected var m_playerPools:Vector.<BasePlayer>;

        public function BasePlayerFactory(_arg_1:EthnicInfo, _arg_2:Class)
        {
            this.m_ethnicInfo = _arg_1;
            this.m_ethnicID = _arg_1.id;
            this.m_playerCls = _arg_2;
            this.initThis();
        }

        protected function initThis():void
        {
            this.m_playerPools = new Vector.<BasePlayer>();
        }

        protected function createPlayer():BasePlayer
        {
            var _local_4:ActionInfo;
            var _local_5:String;
            var _local_6:IElementAction;
            var _local_1:BasePlayer = (new this.m_playerCls() as BasePlayer);
            var _local_2:BasePlayerController = new BasePlayerController(_local_1);
            _local_1.setController(_local_2);
            var _local_3:Dictionary = this.m_ethnicInfo.actionInfos;
            _local_1.buildActions();
            var _local_7:int;
            var _local_8:* = _local_3;
            for each (_local_4 in _local_3) {
                _local_5 = _local_4.className;
                if (_local_5.indexOf(".DynamicAttackAction") != -1){
                    _local_6 = new DynamicAttackAction(_local_4.id);
                    _local_1.addAction(_local_6);
                };
            };
            return (_local_1);
        }

        public function getEthnicID():int
        {
            return (this.m_ethnicID);
        }

        public function getPlayerClass():Class
        {
            return (this.m_playerCls);
        }

        public function getPlayerLayerAssets():Vector.<LayerAsset>
        {
            var _local_3:LayerAsset;
            var _local_1:Vector.<LayerAsset> = new Vector.<LayerAsset>();
            var _local_2:int;
            while (_local_2 < PlayerBodyLayer.LAYER_COUNT) {
                _local_3 = new LayerAsset();
                _local_3.layerID = _local_2;
                _local_1.push(_local_3);
                _local_2++;
            };
            return (_local_1);
        }

        public function newPlayer(_arg_1:Object):BasePlayer
        {
            if (this.m_playerPools.length != 0){
                return (this.m_playerPools.pop());
            };
            return (this.createPlayer());
        }

        public function returnPlayer(_arg_1:BasePlayer):void
        {
            _arg_1.reset();
            this.m_playerPools.push(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_840()
        {
        }


    }
}//package com.tencent.ai.core.player.impl

// _SafeStr_840 = " BasePlayerFactory" (String#14189)


