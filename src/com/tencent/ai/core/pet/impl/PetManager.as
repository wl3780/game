// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.impl.PetManager

package com.tencent.ai.core.pet.impl
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.pet.IPetManager;
    import com.tencent.ai.core.pet.IPetSystem;
    import com.tencent.ai.core.pet.IPetAssetManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.pet.BasePet;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.pet.IFollowPetModel;
    import com.tencent.ai.core.pet.IPetFactory;
    import com.tencent.ai.core.monster.res.MonsterAsset;
    import com.tencent.ai.core.events.PetEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import  ©init._SafeStr_823;
    import __AS3__.vec.*;

    public class PetManager extends EventDispatcher implements IPetManager 
    {

        public static var M_FOLLOW_PET_MODEL:FollowPetModel;

        protected var m_petSys:IPetSystem;
        protected var m_resManager:IPetAssetManager;
        protected var m_pets:Vector.<BasePet>;
        protected var m_currScene:IScene;
        protected var m_petClickHandler:Function;
        protected var m_isAIRun:Boolean;
        protected var m_cachePetInfos:Vector.<PetInfo>;
        private var _clearFlag:Boolean = false;

        public function PetManager(_arg_1:IPetSystem)
        {
            this.m_petSys = _arg_1;
            this.m_resManager = _arg_1.getResource();
            this.m_isAIRun = true;
            if (M_FOLLOW_PET_MODEL == null){
                M_FOLLOW_PET_MODEL = new FollowPetModel();
            };
        }

        protected function initScenePets(_arg_1:Vector.<PetInfo>):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1 != null){
                _local_2 = _arg_1.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    this.addPet(_arg_1[_local_3]);
                    _local_3++;
                };
            };
        }

        protected function clearScenePets():void
        {
            this._clearFlag = true;
            var _local_1:int = (this.m_pets.length - 1);
            while (_local_1 >= 0) {
                this.m_currScene.destoryElement(this.m_pets[_local_1]);
                _local_1--;
            };
            this.m_pets.length = 0;
            this._clearFlag = false;
        }

        protected function onPetDisappear(_arg_1:ElementEvent):void
        {
            var _local_3:PetInfo;
            var _local_4:EffectInfo;
            var _local_2:BasePet = (_arg_1.getTarget() as BasePet);
            if (_local_2 != null){
                _local_3 = _local_2.getPetInfo();
                if (_local_3.disappearEID != 0){
                    _local_4 = new EffectInfo();
                    _local_4.eid = _local_3.disappearEID;
                    _local_4.location = _local_2.getMapPosition();
                    this.m_currScene.createElement(ElementType.ET_EFFECT, _local_4);
                };
                this.m_currScene.destoryElement(_local_2);
            };
        }

        public function addPet(_arg_1:PetInfo):BasePet
        {
            var _local_3:MapPosition;
            var _local_2:MapPosition = _arg_1.mapPosition;
            if (!this.m_currScene.isWalkable(_local_2.x, _local_2.z)){
                _local_3 = _arg_1.petMasterPos;
                if (_local_3){
                    _local_2.x = _local_3.x;
                    _local_2.z = _local_3.z;
                };
            };
            return ((this.m_currScene.createElement(ElementType.ET_PET, _arg_1) as BasePet));
        }

        public function removePetByPlayer(_arg_1:PlayerID):void
        {
            var _local_2:BasePet = this.getPetByPlayer(_arg_1);
            if (_local_2 != null){
                this.m_currScene.destoryElement(_local_2);
            };
        }

        public function removePet2(_arg_1:PetInfo):void
        {
            var _local_2:BasePet = this.getPetByInfo(_arg_1);
            if (_local_2 != null){
                this.m_currScene.destoryElement(_local_2);
            };
        }

        public function indexOfPet(_arg_1:uint):int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BasePet;
            if (this.m_pets != null){
                _local_2 = this.m_pets.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_pets[_local_3];
                    if (_local_4.id == _arg_1){
                        return (_local_3);
                    };
                    _local_3++;
                };
            };
            return (-1);
        }

        public function getPetByInfo(_arg_1:PetInfo):BasePet
        {
            var _local_3:uint;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:BasePet;
            var _local_2:BasePet;
            if (((this.m_pets) && (_arg_1))){
                if (_arg_1.playerID){
                    _local_3 = _arg_1.playerID.uin;
                    _local_4 = _arg_1.petSID;
                    _local_5 = this.m_pets.length;
                    _local_6 = 0;
                    while (_local_6 < _local_5) {
                        _local_7 = this.m_pets[_local_6];
                        if (((((((_local_7) && (_local_7.playerID))) && ((_local_7.playerID.uin == _local_3)))) && ((_local_7.petSID == _local_4)))){
                            _local_2 = _local_7;
                        };
                        _local_6++;
                    };
                } else {
                    error("[PetManager] getPetInfo petInfo error:PlayerID is null.");
                };
            } else {
                error("[PetManager] getPetInfo error");
            };
            return (_local_2);
        }

        public function getPetByPlayer(_arg_1:PlayerID):BasePet
        {
            var _local_2:uint;
            var _local_3:int;
            var _local_4:int;
            var _local_5:BasePet;
            if (this.m_pets != null){
                _local_2 = _arg_1.uin;
                _local_3 = this.m_pets.length;
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = this.m_pets[_local_4];
                    if (_local_5.playerID.uin == _local_2){
                        return (_local_5);
                    };
                    _local_4++;
                };
            };
            return (null);
        }

        public function registerCachePetInfos(_arg_1:Vector.<PetInfo>):void
        {
            this.m_cachePetInfos = _arg_1;
        }

        public function getCachePetInfoByPlayer(_arg_1:PlayerID):PetInfo
        {
            var _local_2:uint;
            var _local_3:int;
            var _local_4:int;
            var _local_5:PetInfo;
            if (this.m_cachePetInfos != null){
                _local_2 = _arg_1.uin;
                _local_3 = this.m_cachePetInfos.length;
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = this.m_cachePetInfos[_local_4];
                    if (_local_5.playerID.uin == _local_2){
                        return (_local_5);
                    };
                    _local_4++;
                };
            };
            return (null);
        }

        public function removeCachePetInfoByPlayer(_arg_1:PlayerID):Boolean
        {
            var _local_2:uint;
            var _local_3:int;
            var _local_4:int;
            var _local_5:PetInfo;
            if (this.m_cachePetInfos != null){
                _local_2 = _arg_1.uin;
                _local_3 = this.m_cachePetInfos.length;
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = this.m_cachePetInfos[_local_4];
                    if (_local_5.playerID.uin == _local_2){
                        this.m_cachePetInfos.splice(_local_4, 1);
                        return (true);
                    };
                    _local_4++;
                };
            };
            return (true);
        }

        public function initialize(_arg_1:Object=null):void
        {
            this.m_pets = new Vector.<BasePet>();
        }

        public function bindScene(_arg_1:IScene, _arg_2:Vector.<PetInfo>):void
        {
            this.m_currScene = _arg_1;
            _arg_1.registerFactory(this);
            this.initScenePets(_arg_2);
        }

        public function getBindScene():IScene
        {
            return (this.m_currScene);
        }

        public function unbind():void
        {
            if (this.m_currScene != null){
                this.clearScenePets();
                this.m_currScene.unRegisterFactory(this.getElementType());
                this.m_currScene = null;
            };
            this.m_isAIRun = true;
        }

        public function set isAIRun(_arg_1:Boolean):void
        {
            var _local_2:int;
            if (this.m_isAIRun != _arg_1){
                this.m_isAIRun = _arg_1;
                _local_2 = 0;
                while (_local_2 < this.m_pets.length) {
                    this.m_pets[_local_2].isAIComRun = this.m_isAIRun;
                    _local_2++;
                };
            };
        }

        public function get isAIRun():Boolean
        {
            return (this.m_isAIRun);
        }

        public function get followPetModel():IFollowPetModel
        {
            return (M_FOLLOW_PET_MODEL);
        }

        public function updatePetHP(_arg_1:PlayerID, _arg_2:int):void
        {
            var _local_4:PetInfo;
            var _local_3:BasePet = this.getPetByPlayer(_arg_1);
            if (_local_3 != null){
                _local_3.updateHP(_arg_2);
            } else {
                _local_4 = this.getCachePetInfoByPlayer(_arg_1);
                if (_local_4 != null){
                    _local_4.hp = (_local_4.hp + _arg_2);
                    if (_local_4.isMainPet){
                        M_FOLLOW_PET_MODEL.setDHP(_arg_2);
                        M_FOLLOW_PET_MODEL.updateEvent();
                    };
                };
            };
        }

        public function updatePetHP2(_arg_1:PlayerID, _arg_2:Number):void
        {
            var _local_4:int;
            var _local_5:PetInfo;
            var _local_3:BasePet = this.getPetByPlayer(_arg_1);
            if (_local_3 != null){
                _local_4 = (_arg_2 * _local_3.getModel().maxhp);
                _local_3.updateHP(_local_4);
            } else {
                _local_5 = this.getCachePetInfoByPlayer(_arg_1);
                if (_local_5 != null){
                    _local_4 = (_arg_2 * _local_5.maxhp);
                    _local_5.hp = (_local_5.hp + _local_4);
                    if (_local_5.isMainPet){
                        M_FOLLOW_PET_MODEL.setDHP(_local_4);
                        M_FOLLOW_PET_MODEL.updateEvent();
                    };
                };
            };
        }

        public function clear():void
        {
            if (this.m_currScene != null){
                this.clearScenePets();
            };
        }

        public function dispose():void
        {
        }

        public function getPets():Vector.<BasePet>
        {
            return (this.m_pets);
        }

        public function getElementType():String
        {
            return (ElementType.ET_PET);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_2:PetInfo = (_arg_1 as PetInfo);
            var _local_3:IPetFactory = this.m_petSys.getFactory(_local_2.type);
            var _local_4:BasePet = _local_3.newPet(_local_2);
            var _local_5:MonsterAsset = this.m_resManager.getPetAsset(_local_2.staticInfo, this);
            _local_4.getPetView().addAsset(_local_5);
            _local_4.initialize(_local_2);
            this.m_pets.push(_local_4);
            if (this.m_petClickHandler != null){
                _local_4.useClickEvent = true;
                _local_4.addEventListener(ElementEvent.ON_ELEMENT_CLICK, this.m_petClickHandler);
            };
            _local_4.addEventListener(ElementEvent.ON_ELEMENT_DISAPPEAR, this.onPetDisappear);
            if (_local_2.isMainPet){
                M_FOLLOW_PET_MODEL.setPetInfo(_local_2);
                M_FOLLOW_PET_MODEL.bindModel(_local_4.getPetModel());
            };
            var _local_6:PetEvent = new PetEvent(PetEvent.ON_PET_ADDED);
            _local_6.data = _local_2;
            dispatchEvent(_local_6);
            return (_local_4);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            var _local_5:PetEvent;
            var _local_2:BasePet = (_arg_1 as BasePet);
            _local_2.removeEventListener(ElementEvent.ON_ELEMENT_DISAPPEAR, this.onPetDisappear);
            if (this.m_petClickHandler != null){
                _local_2.removeEventListener(ElementEvent.ON_ELEMENT_CLICK, this.m_petClickHandler);
            };
            var _local_3:int = this.m_pets.indexOf(_local_2);
            if (_local_3 != -1){
                this.m_pets.splice(_local_3, 1);
            };
            var _local_4:PetInfo = _local_2.getPetInfo();
            this.m_resManager.returnPetAsset(_local_2.getPetView().removeAsset(), this);
            this.m_petSys.getFactory(_local_4.type).returnPet(_local_2);
            if (_local_4.isMainPet){
                M_FOLLOW_PET_MODEL.unbindModel();
            };
            if (!this._clearFlag){
                _local_5 = new PetEvent(PetEvent.ON_PET_REMOVED);
                _local_5.data = _local_4;
                dispatchEvent(_local_5);
            };
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_GROUND);
        }

        public /*  ©init. */ function _SafeStr_823()
        {
        }


    }
}//package com.tencent.ai.core.pet.impl

// _SafeStr_823 = " PetManager" (String#17150)


