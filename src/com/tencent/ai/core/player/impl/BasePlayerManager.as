// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.impl.BasePlayerManager

package com.tencent.ai.core.player.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.player.IPlayerSystem;
    import com.tencent.ai.core.player.IPlayerAssetManager;
    import com.tencent.ai.core.player.IPlayerModelManager;
    import com.tencent.ai.core.player.BasePlayer;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.pet.IPetManager;
    import com.tencent.ai.core.enum.AssetPart;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.pet.BasePet;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.player.IPlayerFactory;
    import com.tencent.ai.core.player.res.PlayerAsset;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.data.PlayerID;
    import  ©init._SafeStr_841;
    import __AS3__.vec.*;

    public class BasePlayerManager extends EventDispatcher2 implements IPlayerManager 
    {

        protected var m_playerSys:IPlayerSystem;
        protected var m_resManager:IPlayerAssetManager;
        protected var m_modelManager:IPlayerModelManager;
        protected var m_mainPlayer:BasePlayer;
        protected var m_players:Vector.<BasePlayer>;
        protected var m_cachePlayerInfos:Vector.<PlayerInfo>;
        protected var m_currScene:IScene;
        protected var m_part:int;
        protected var m_playClickHandler:Function;
        protected var m_petManger:IPetManager;

        public function BasePlayerManager(_arg_1:IPlayerSystem)
        {
            this.m_playerSys = _arg_1;
            this.m_resManager = _arg_1.getResource();
            this.m_modelManager = _arg_1.getPlayerModelManager();
            this.m_part = AssetPart.PART_BASE;
        }

        protected function initScenePlayers(_arg_1:Vector.<PlayerInfo>):void
        {
            var _local_2:int = _arg_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.addPlayer(_arg_1[_local_3]);
                _local_3++;
            };
        }

        protected function addPlayerPet2(_arg_1:BasePlayer, _arg_2:PetInfo, _arg_3:Boolean=true):BasePet
        {
            if (_arg_3){
                _arg_1.getPlayerInfo().followPetInfo = _arg_2;
                _arg_2.petState = 0;
            };
            _arg_2.masterElement = _arg_1;
            _arg_2.isMainPet = _arg_1.isMain();
            return (this.m_petManger.addPet(_arg_2));
        }

        public function addPlayerPet(_arg_1:uint, _arg_2:PetInfo):void
        {
            var _local_3:BasePlayer = this.getPlayerByID(_arg_1);
            this.addPlayerPet2(_local_3, _arg_2);
        }

        public function removePlayerPet(_arg_1:uint):void
        {
            var _local_2:BasePlayer;
            _local_2 = this.getPlayerByID(_arg_1);
            var _local_3:PetInfo = _local_2.getPlayerInfo().followPetInfo;
            _local_3.petState = 1;
            _local_2.getPlayerInfo().followPetInfo = null;
            this.m_petManger.removePet2(_local_3);
            _local_3.masterElement = null;
        }

        public function addPlayer(_arg_1:PlayerInfo):BasePlayer
        {
            var _local_2:BasePlayer = (this.m_currScene.createElement(ElementType.ET_PLAYER, _arg_1) as BasePlayer);
            var _local_3:int = _arg_1.vKey;
            if (((!((_local_2 == null))) && (!((_local_3 == VKeyDef.EMPTY))))){
                _local_2.inputVKey(_local_3);
            };
            if (((((!((_arg_1.followPetInfo == null))) && (!((this.m_petManger == null))))) && ((_arg_1.followPetInfo.petState == 0)))){
                _arg_1.followPetInfo.masterElement = _local_2;
                this.addPlayerPet2(_local_2, _arg_1.followPetInfo, false);
            };
            return (_local_2);
        }

        public function removePlayer(_arg_1:uint):void
        {
            var _local_3:PetInfo;
            var _local_2:BasePlayer = this.getPlayerByID(_arg_1);
            if (_local_2 != null){
                _local_3 = _local_2.getPlayerInfo().followPetInfo;
                if (((!((_local_3 == null))) && (!((this.m_petManger == null))))){
                    this.m_petManger.removePet2(_local_3);
                };
                this.m_currScene.destoryElement(_local_2);
            };
        }

        public function indexOfPlayer(_arg_1:uint):int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BasePlayer;
            if (this.m_players != null){
                _local_2 = this.m_players.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_players[_local_3];
                    if (_local_4.id == _arg_1){
                        return (_local_3);
                    };
                    _local_3++;
                };
            };
            return (-1);
        }

        public function getPlayerByID(_arg_1:uint):BasePlayer
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BasePlayer;
            if (this.m_players != null){
                _local_2 = this.m_players.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_players[_local_3];
                    if (_local_4.id == _arg_1){
                        return (_local_4);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        public function getBindScene():IScene
        {
            return (this.m_currScene);
        }

        public function initialize(_arg_1:Object=null):void
        {
            this.m_players = new Vector.<BasePlayer>();
            if (!(((_arg_1 == null)) || (!(_arg_1.hasOwnProperty("petManager"))))){
                this.m_petManger = (_arg_1.petManager as IPetManager);
            };
        }

        public function clearPlayers():void
        {
            var _local_1:int = (this.m_players.length - 1);
            while (_local_1 >= 0) {
                this.m_currScene.destoryElement(this.m_players[_local_1]);
                _local_1--;
            };
            this.m_players.length = 0;
        }

        public function getMainPlayer():BasePlayer
        {
            return (this.m_mainPlayer);
        }

        public function getPlayers():Vector.<BasePlayer>
        {
            return (this.m_players);
        }

        public function getPlayerCount():int
        {
            return (this.m_players.length);
        }

        public function getElementType():String
        {
            return (ElementType.ET_PLAYER);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_4:IPlayerFactory;
            var _local_5:PlayerAsset;
            var _local_2:PlayerInfo = (_arg_1 as PlayerInfo);
            var _local_3:BasePlayer;
            if (_local_2 != null){
                _local_4 = this.m_playerSys.getFactory(_local_2.ethnicID);
                if (_local_4 != null){
                    _local_3 = _local_4.newPlayer(_local_2);
                    _local_5 = this.m_resManager.getPlayerAsset(_local_2.equipsID, this, _local_2.isMain);
                    _local_3.getPlayerView().addAsset(_local_5);
                    _local_3.initialize(_local_2);
                    if (this.m_playClickHandler != null){
                        _local_3.useClickEvent = true;
                        _local_3.addEventListener(ElementEvent.ON_ELEMENT_CLICK, this.m_playClickHandler);
                    };
                    if (_local_2.isMain){
                        _local_3.useClickEvent = false;
                        this.m_mainPlayer = _local_3;
                    };
                    this.m_players.push(_local_3);
                    if (this.m_modelManager != null){
                        this.m_modelManager.registPlayerModel(_local_3.getPlayerModel());
                    };
                };
            };
            return (_local_3);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            var _local_3:int;
            var _local_4:PlayerInfo;
            var _local_2:BasePlayer = (_arg_1 as BasePlayer);
            if (_local_2 != null){
                _local_3 = this.m_players.indexOf(_local_2);
                if (_local_3 != -1){
                    this.m_players.splice(_local_3, 1);
                };
                if (this.m_playClickHandler != null){
                    _local_2.removeEventListener(ElementEvent.ON_ELEMENT_CLICK, this.m_playClickHandler);
                };
                if (this.m_modelManager != null){
                    this.m_modelManager.unregistPlayerModel(_local_2.getPlayerModel());
                };
                _local_4 = _local_2.getPlayerInfo();
                if (_local_4.isMain){
                    this.m_mainPlayer = null;
                };
                this.m_resManager.returnPlayerAsset(_local_2.getPlayerView().removeAsset(), this);
                this.m_playerSys.getFactory(_local_4.ethnicID).returnPlayer(_local_2);
            };
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_GROUND);
        }

        public function getPlayerByPlayerID(_arg_1:PlayerID):BasePlayer
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BasePlayer;
            if (this.m_players != null){
                _local_2 = this.m_players.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_players[_local_3];
                    if (_local_4.getPlayerInfo().playerID.equal(_arg_1)){
                        return (_local_4);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        public function getCachePlayerInfoByID(_arg_1:uint):PlayerInfo
        {
            var _local_2:int;
            var _local_3:PlayerInfo;
            if (this.m_cachePlayerInfos != null){
                _local_2 = 0;
                while (_local_2 < this.m_cachePlayerInfos.length) {
                    _local_3 = this.m_cachePlayerInfos[_local_2];
                    if (_local_3.id == _arg_1){
                        return (_local_3);
                    };
                    _local_2++;
                };
            };
            return (null);
        }

        public function removeCachePlayerInfo(_arg_1:uint):Boolean
        {
            var _local_2:int;
            var _local_3:PlayerInfo;
            if (this.m_cachePlayerInfos != null){
                _local_2 = 0;
                while (_local_2 < this.m_cachePlayerInfos.length) {
                    _local_3 = this.m_cachePlayerInfos[_local_2];
                    if (_local_3.playerID.uin == _arg_1){
                        this.m_cachePlayerInfos.splice(_local_2, 1);
                        this.m_petManger.removeCachePetInfoByPlayer(_local_3.playerID);
                        return (true);
                    };
                    _local_2++;
                };
            };
            return (false);
        }

        public function registerCachePlayerInfos(_arg_1:Vector.<PlayerInfo>):void
        {
            this.m_cachePlayerInfos = _arg_1;
        }

        public function unbind():void
        {
            this.clearPlayers();
            if (this.m_currScene){
                this.m_currScene.focus = null;
                this.m_currScene.unRegisterFactory(this.getElementType());
                this.m_currScene = null;
            };
        }

        public /*  ©init. */ function _SafeStr_841()
        {
        }


    }
}//package com.tencent.ai.core.player.impl

// _SafeStr_841 = " BasePlayerManager" (String#17372)


