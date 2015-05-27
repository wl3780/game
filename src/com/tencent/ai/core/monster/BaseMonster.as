// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.BaseMonster

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.monster.view.BaseMonsterView;
    import com.tencent.ai.core.enum.ActorRank;
    import com.tencent.ai.core.element.shadow.ShadowPools;
    import com.tencent.ai.core.enum.ShadowType;
    import com.tencent.ai.core.enum.CommonValueDef;
    import com.tencent.ai.core.enum.ElementGroupDef;
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
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.enum.MonsterDeadReason;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_787;

    public class BaseMonster extends BaseActor 
    {

        private static var _SPAWNMANAGER:ISpawnManager;

        protected var m_hpmp:Boolean;
        protected var m_hasCountDown:Boolean;
        private var _disappearEvent:ElementEvent;
        private var _deadEvent:ElementEvent;

        public function BaseMonster()
        {
            super(ElementType.ET_MONSTER, new MonsterModel());
        }

        override protected function initThis():void
        {
            super.initThis();
            setActorView(new BaseMonsterView());
            setMoveEnabled(true);
            setGravityEnabled(true);
            this.m_hpmp = false;
            this.m_hasCountDown = false;
            this._deadEvent = new ElementEvent(ElementEvent.ON_ELEMENT_DEAD, this);
            this._disappearEvent = new ElementEvent(ElementEvent.ON_ELEMENT_DISAPPEAR, this);
            needGroupChange = true;
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

        protected function initHeadView(_arg_1:int, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_4 = "";
            m_actorView.height = actorHeight;
            if (_arg_3){
                _local_4 = (("<font color='#00FF00'>Lv." + _arg_2) + "</font>");
                this.m_hpmp = true;
                m_actorView.setHeadText(_local_4);
                m_actorView.setHeadBarVisible(true);
                this.updateHP(0);
                this.updateMP(0);
            } else {
                if (_arg_1 == ActorRank.BOSS){
                    _local_4 = (("<font color='#FF0000'>Lv." + _arg_2) + "</font>");
                } else {
                    if (_arg_1 >= ActorRank.ELITE){
                        _local_4 = (("<font color='#8B64BF'>Lv." + _arg_2) + "</font>");
                    };
                };
                m_actorView.setHeadText(_local_4);
            };
            m_model.htmlName = (((_local_4 == "")) ? (("<font color='#FFFFFF'>Lv." + _arg_2) + "</font>") : _local_4);
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

        public function getMonsterView():BaseMonsterView
        {
            return ((m_view as BaseMonsterView));
        }

        public function getHeadIcon():BitmapData
        {
            if (m_view != null){
                return (BaseMonsterView(m_view).getAsset().headIcon);
            };
            return (null);
        }

        public function getMonsterModel():MonsterModel
        {
            return (MonsterModel(m_model));
        }

        public function createNewMonsterInfo():MonsterInfo
        {
            var _local_1:MonsterInfo = (m_actorInfo as MonsterInfo);
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

        public function getMonsterInfo():MonsterInfo
        {
            return ((m_actorInfo as MonsterInfo));
        }

        public function initialize(_arg_1:MonsterInfo):void
        {
            var _local_2:MonsterStaticInfo;
            _local_2 = _arg_1.staticInfo;
            var _local_3:MonsterAIInfo = _arg_1.aiInfo;
            var _local_4:Boolean;
            if (_arg_1.rank == ActorRank.CARRIER){
                _arg_1.activateAI = false;
                _arg_1.groupID = 0;
                _local_4 = true;
            };
            this.id = _arg_1.id;
            this.materialType = _local_2.materialType;
            this.m_isAirElement = (((_local_3)!=null) ? _local_3.isFlyMonster : false);
            this.actorHeight = _local_2.height;
            m_model.copyValues(_arg_1);
            __initialize(_arg_1);
            if (_arg_1.activateAI){
                this.setMonsterAIParams((_arg_1.masterElement as BaseActor), _local_3);
            } else {
                setAIComponent(null);
            };
            setMapPosition(_arg_1.mapPosition);
            this.setDirection(_arg_1.diretion);
            inputVKey((((_arg_1.appearActionID == 0)) ? VKeyDef.EMPTY : _arg_1.appearActionID));
            _local_4 = ((_local_4) || (!((m_master == null))));
            this.initHeadView(_arg_1.rank, ((_arg_1.level + " ") + _arg_1.name), _local_4);
            if (_arg_1.catchable){
                this.getMonsterView().addCatchIcon();
            };
        }

        public function setMonsterAIParams(_arg_1:BaseActor, _arg_2:MonsterAIInfo=null):void
        {
            var _local_4:int;
            var _local_5:BaseAIComponent;
            var _local_3:MonsterInfo = MonsterInfo(m_actorInfo);
            if (_arg_2 == null){
                _arg_2 = _local_3.aiInfo;
            };
            if (_arg_2 != null){
                if (_arg_2.specialAIType == 1){
                    _local_4 = MonsterEnum.AI_MONSTER_PET;
                } else {
                    _local_4 = (((_arg_1 == null)) ? (MonsterEnum.AI_TYPE_SIMPLE) : MonsterEnum.AI_TYPE_APC);
                };
                _local_5 = AIFactory.createInstance(_local_4);
                setAIComponent(_local_5);
                m_aiCom.setCurrentLifeTime(_local_3.currentLifeTime);
                m_aiCom.setAIInfo(_arg_2);
                setMaster(_arg_1);
                if (_arg_2.specialAIType == 1){
                    m_aiCom.setGroup(groupID);
                };
                m_aiCom.stateIn(_arg_1);
            };
        }

        override public function inputActionID(_arg_1:int):void
        {
            m_controller.inputActionID(_arg_1);
        }

        override public function updateHP(_arg_1:int, _arg_2:Object=null):Boolean
        {
            var _local_3:Boolean = super.updateHP(_arg_1, _arg_2);
            if (this.m_hpmp){
                m_actorView.setHeadBarHp((m_model.hp / m_model.maxhp));
            };
            return (_local_3);
        }

        override public function updateMP(_arg_1:int):void
        {
            super.updateMP(_arg_1);
            if (this.m_hpmp){
                m_actorView.setHeadBarMp((m_model.mp / m_model.maxmp));
            };
        }

        public function getIsServerDead():Boolean
        {
            var _local_1:MonsterModel = (m_model as MonsterModel);
            if (_local_1 != null){
                return (_local_1.isServerDead);
            };
            return (false);
        }

        public function setIsServerDead(_arg_1:Boolean):void
        {
            var _local_2:MonsterModel = (m_model as MonsterModel);
            if (_local_2 != null){
                _local_2.isServerDead = _arg_1;
            };
        }

        override public function suicide(_arg_1:Boolean=true):void
        {
            if (_arg_1){
                this.updateHP(int.MIN_VALUE);
            } else {
                this.sendServerDead(MonsterDeadReason.BEAT_MONSTER_SUICIDE);
                this._deadEvent.data = "suicide";
                dispatchEvent(this._deadEvent);
                dispatchEvent(this._disappearEvent);
            };
        }

        override public function sendServerDead(_arg_1:int):void
        {
            if (_SPAWNMANAGER == null){
                _SPAWNMANAGER = AICore.monsterSystem.getSpawnManager();
            };
            var _local_2:MonsterInfo = this.createNewMonsterInfo();
            _local_2.deadReason = _arg_1;
            _SPAWNMANAGER.sendServerMonsterDead(_local_2);
        }

        override public function reset():void
        {
            if (m_actorView){
                BaseMonsterView(m_actorView).removeCatchIcon();
            };
            if (this.m_hpmp){
                m_actorView.setHeadBarVisible(false);
                this.m_hpmp = false;
            };
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_787()
        {
        }


    }
}//package com.tencent.ai.core.monster

// _SafeStr_787 = " BaseMonster" (String#15176)


