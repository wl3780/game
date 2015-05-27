// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.BasePet

package com.tencent.ai.core.pet
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.pet.view.BasePetView;
    import com.tencent.ai.core.enum.ActorRank;
    import com.tencent.ai.core.element.shadow.ShadowPools;
    import com.tencent.ai.core.enum.ShadowType;
    import com.tencent.ai.core.enum.CommonValueDef;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ItemConstants;
    import com.tencent.ai.core.events.AIMovieEvent;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.PetModelEvent;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.monster.actions.SimpleIDELAction;
    import com.tencent.ai.core.monster.actions.SimpleWalkAction;
    import com.tencent.ai.core.action.BeHurtAction;
    import com.tencent.ai.core.action.CaughtAction;
    import com.tencent.ai.core.action.BethrownAction;
    import com.tencent.ai.core.action.CaptiveAction;
    import com.tencent.ai.core.action.DynamicAction;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.action.DynamicAttackAction;
    import flash.display.BitmapData;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.data.PetAIInfo;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.monster.AIFactory;
    import com.tencent.ai.core.enum.VisibleValueDef;
    import  ©init._SafeStr_827;

    public class BasePet extends BaseActor 
    {

        public var playerID:PlayerID;
        public var petSID:int;
        protected var m_hasCountDown:Boolean;
        protected var m_effectInfo:EffectInfo;
        protected var m_visibleValue:int = 0;

        public function BasePet()
        {
            super(ElementType.ET_PET, new PetModel());
        }

        override protected function initThis():void
        {
            super.initThis();
            setActorView(new BasePetView());
            setMoveEnabled(true);
            setGravityEnabled(true);
            this.m_hasCountDown = false;
        }

        override protected function buildShadow(_arg_1:Object=null):void
        {
            var _local_3:Boolean;
            var _local_4:int;
            var _local_2 = (m_actorInfo.rank == ActorRank.BOSS);
            if (_local_2){
                m_shadow = ShadowPools.createShadowElement(ShadowType.EFFECT_ASSET);
                m_shadow.setTarget(this);
                m_shadow.initialize(CommonValueDef.EID_BOSS_SHADOW);
            } else {
                _local_3 = (m_actorInfo.groupID == ElementGroupDef.PVE_PLAYER);
                if (_local_3){
                    _local_4 = ShadowType.SHADOW_TYPE_3;
                } else {
                    if (m_isAirElement == 2){
                        _local_4 = ShadowType.SHADOW_TYPE_2;
                    } else {
                        _local_4 = ShadowType.SHADOW_TYPE_1;
                    };
                };
                super.buildShadow(_local_4);
            };
        }

        private function createEffectInfo(_arg_1:int):void
        {
            if (this.m_effectInfo == null){
                this.m_effectInfo = new EffectInfo();
                this.m_effectInfo.location = new MapPosition();
            };
            this.m_effectInfo.eid = _arg_1;
            this.m_effectInfo.location.deepOffset = 0;
            m_actorView.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
        }

        protected function initHeadView(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            var _local_4:String = ((("<font color='#ffffff'>Lv." + _arg_2) + " ") + ItemConstants.getNameColorHTML(_arg_3, (_arg_1 - 1)));
            m_actorView.height = actorHeight;
            m_actorView.setHeadText(_local_4);
            m_actorView.setHeadVisible(true);
            m_model.htmlName = _local_4;
        }

        protected function onUpDateShowInfo(_arg_1:PetModelEvent):void
        {
            var _local_3:AIMovieEvent;
            var _local_2:PetInfo = this.getPetInfo();
            this.initHeadView(_local_2.aptitude, _local_2.level, _local_2.nickname);
            if (_arg_1.data == "level"){
                this.createEffectInfo(7014);
                _local_3 = new AIMovieEvent(AIMovieEvent.ON_LEVELUP_PLAY);
                _local_3.setTarget(this);
                AICore.dispatchAIEvent(_local_3);
            };
        }

        public function buildActions():void
        {
            this.m_actionsNum = (7 + MonsterEnum.ACTION_COUNT);
            addAction(new SimpleIDELAction());
            addAction(new SimpleWalkAction());
            addAction(new BeHurtAction());
            addAction(new CaughtAction());
            addAction(new BethrownAction());
            addAction(new CaptiveAction());
            addAction(new DynamicAction(BaseActionIDDef.APPEAR));
            var _local_1:int;
            while (_local_1 < MonsterEnum.ACTION_COUNT) {
                addAction(new DynamicAttackAction((MonsterEnum.ACTION_ID_START + _local_1)));
                _local_1++;
            };
        }

        override public function setDirection(_arg_1:int):void
        {
            if (!m_controller.isLock){
                super.setDirection(_arg_1);
            };
        }

        public function getPetView():BasePetView
        {
            return ((m_view as BasePetView));
        }

        public function getHeadIcon():BitmapData
        {
            if (m_view != null){
                return (BasePetView(m_view).getAsset().headIcon);
            };
            return (null);
        }

        public function getPetModel():PetModel
        {
            return (PetModel(m_model));
        }

        public function createNewPetInfo():PetInfo
        {
            var _local_1:PetInfo = (m_actorInfo as PetInfo);
            var _local_2:MapPosition = _local_1.mapPosition;
            if (_local_2 != null){
                _local_2.x = mapX;
                _local_2.y = mapY;
                _local_2.z = mapZ;
                _local_2.deepOffset = m_deepOffset;
            } else {
                _local_1.mapPosition = getMapPosition();
            };
            if (m_aiCom != null){
                _local_1.currentLifeTime = m_aiCom.getCurrentLifeTime();
            };
            return (_local_1);
        }

        public function getPetInfo():PetInfo
        {
            return ((m_actorInfo as PetInfo));
        }

        public function initialize(_arg_1:PetInfo):void
        {
            var _local_2:MonsterStaticInfo = _arg_1.staticInfo;
            var _local_3:PetAIInfo = PetAIInfo(_arg_1.aiInfo);
            this.id = _arg_1.id;
            this.playerID = ((_arg_1.playerID) ? _arg_1.playerID.clone() : null);
            this.petSID = _arg_1.petSID;
            this.materialType = _local_2.materialType;
            this.m_isAirElement = (((_local_3)!=null) ? _local_3.isFlyMonster : false);
            this.actorHeight = _local_2.height;
            m_model.copyValues(_arg_1);
            __initialize(_arg_1);
            if (_arg_1.activateAI){
                this.setPetAIParams((_arg_1.masterElement as BaseActor), _local_3);
            } else {
                setAIComponent(null);
            };
            setMapPosition(_arg_1.mapPosition);
            this.setDirection(_arg_1.diretion);
            inputVKey((((_arg_1.appearActionID == 0)) ? VKeyDef.EMPTY : _arg_1.appearActionID));
            this.initHeadView(_arg_1.aptitude, _arg_1.level, _arg_1.nickname);
            m_model.addEventListener(PetModelEvent.ON_UPDATE_SHOWINFO, this.onUpDateShowInfo);
            m_model.vigourValue = _arg_1.hungry;
        }

        public function setPetAIParams(_arg_1:BaseActor, _arg_2:PetAIInfo=null):void
        {
            var _local_4:int;
            var _local_5:BaseAIComponent;
            var _local_3:PetInfo = PetInfo(m_actorInfo);
            if (_arg_2 == null){
                _arg_2 = PetAIInfo(_local_3.aiInfo);
            };
            if (_arg_2 != null){
                _local_4 = _arg_2.aiType;
                _local_5 = AIFactory.createInstance(_local_4);
                setAIComponent(_local_5);
                m_aiCom.setCurrentLifeTime(_local_3.currentLifeTime);
                m_aiCom.setAIInfo(_arg_2);
                setMaster(_arg_1);
                m_aiCom.stateIn(_arg_1);
            };
        }

        override public function inputActionID(_arg_1:int):void
        {
            m_controller.inputActionID(_arg_1);
        }

        public function getIsServerDead():Boolean
        {
            var _local_1:PetModel = (m_model as PetModel);
            if (_local_1 != null){
                return (_local_1.isServerDead);
            };
            return (false);
        }

        public function setIsServerDead(_arg_1:Boolean):void
        {
            var _local_2:PetModel = (m_model as PetModel);
            if (_local_2 != null){
                _local_2.isServerDead = _arg_1;
            };
        }

        override public function reset():void
        {
            this.playerID = null;
            this.petSID = 0;
            if (m_model != null){
                m_model.removeEventListener(PetModelEvent.ON_UPDATE_SHOWINFO, this.onUpDateShowInfo);
            };
            this.setVisibleValue(VisibleValueDef.ALL_VISIBLE);
            super.reset();
        }

        public function setVisibleValue(_arg_1:int):void
        {
            if (this.m_visibleValue != _arg_1){
                this.m_visibleValue = _arg_1;
                m_shadow.getDisplay().visible = !((_arg_1 == VisibleValueDef.NOTHING_VISIBLE));
                this.getPetView().setVisibleValue(_arg_1);
            };
        }

        public function getVisibleValue():int
        {
            return (this.m_visibleValue);
        }

        public /*  ©init. */ function _SafeStr_827()
        {
        }


    }
}//package com.tencent.ai.core.pet

// _SafeStr_827 = " BasePet" (String#14411)


