// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.SimpleAidCityAI

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.pet.BasePet;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.monster.MonsterModel;
    import com.tencent.ai.core.monster.ai.state.BrainInactiveAidCityState;
    import com.tencent.ai.core.monster.ai.state.NoAimAidCityState;
    import com.tencent.ai.core.monster.ai.stateNew.NewBrainInactiveAidCityState;
    import com.tencent.ai.core.monster.ai.stateNew.NewNoAimAidCityState;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_771;
    import __AS3__.vec.*;

    public class SimpleAidCityAI extends BaseAIComponent implements IMonsterBrain 
    {

        protected var scene:IScene;
        protected var monster:BasePet;
        protected var answerTimes:int = 10;
        protected var followElement:AIFollowElement;
        protected var actionEventHandler:ActionEventHandler;
        protected var tickTimes:int;
        protected var aiInfo:MonsterAIInfo;
        protected var states:Vector.<IMonsterBrainState>;
        public var monsterLeisureSightLines:Array;
        protected var currentState:IMonsterBrainState;
        public var yPosArray:Array;
        public var group:int = 1;
        public var master:BaseActor = null;
        public var rageNum:int = 0;
        public var rageUpNum:int = 0;
        public var rageDownNum:int = 0;
        public var vigour:int = 0;
        private var canRage:int = 0;
        public var firstBloodP:Number = 1;
        public var wantBeHurtP:Number = 1;
        public var canSuicide:Boolean = false;
        public var monsterSuicideSightLines:Array;
        public var currentX:int = 100;
        public var currentZ:int = 100;
        private var beHurtNum:int = 0;
        protected var monsterModel:MonsterModel;
        private var baseSightLineR:int = 0;
        private var baseChasetR:int = 0;

        public function SimpleAidCityAI()
        {
            this.monsterLeisureSightLines = new Array();
            this.yPosArray = new Array();
            this.monsterSuicideSightLines = new Array();
            super();
        }

        public function getMonsterSightlines():Array
        {
            return (null);
        }

        public function getYPosArray():Array
        {
            return (this.yPosArray);
        }

        protected function initThis():void
        {
            this.followElement = new AIFollowElement();
            this.actionEventHandler = new ActionEventHandler();
            this.followElement.target = this.monster;
            this.actionEventHandler.setTarget(this.monster);
            this.actionEventHandler.addEvent();
            if (this.master != null){
                this.followElement.setAimElement(this.master);
            };
            this.states = new Vector.<IMonsterBrainState>();
        }

        override public function setAIInfo(_arg_1:Object):void
        {
            var _local_2:MonsterAIInfo = (_arg_1 as MonsterAIInfo);
            if (_local_2 == null){
                return;
            };
            this.aiInfo = _local_2;
            this.setAllData();
            this.actionEventHandler.addEvent();
        }

        private function setAllData():void
        {
            var _local_1:int = ((this.aiInfo.chaseR + 100) + (30 * this.aiInfo.monsterIQ));
            this.baseChasetR = _local_1;
            _local_1 = ((this.aiInfo.sightLineR + 100) + (20 * this.aiInfo.monsterIQ));
            this.baseSightLineR = _local_1;
            _local_1 = this.aiInfo.monsterIQ;
            this.followElement.monsterIQ = _local_1;
            this.followElement.followLineRR = 2500;
            this.followElement.sightLineRR = 2500;
            this.rageUpNum = this.aiInfo.monsterRageUp;
            this.firstBloodP = this.aiInfo.firstBloodP;
            this.wantBeHurtP = this.aiInfo.wantBeHurtP;
            this.answerTimes = 1;
            this.tickTimes = this.answerTimes;
            var _local_2:int;
            while (_local_2 < this.aiInfo.skillParams.length) {
                if (this.aiInfo.skillParams[_local_2].tType == 6){
                    this.monsterLeisureSightLines.push(this.aiInfo.skillParams[_local_2]);
                };
                _local_2++;
            };
            this.yPosArray = [];
            this.yPosArray.push(this.aiInfo.yPos1);
            this.yPosArray.push(this.aiInfo.yPos2);
            this.yPosArray.push(this.aiInfo.yPos3);
            this.states = new Vector.<IMonsterBrainState>();
            if (this.aiInfo.aiEditionType == 0){
                this.states.push(new BrainInactiveAidCityState(this));
                this.states.push(new NoAimAidCityState(this));
            } else {
                this.states.push(new NewBrainInactiveAidCityState(this));
                this.states.push(new NewNoAimAidCityState(this));
            };
            var _local_3:int;
            while (_local_3 < this.states.length) {
                this.states[_local_3].setAIInfo(this.aiInfo);
                _local_3++;
            };
            this.currentState = this.states[0];
            this.currentState.stateIn();
            this.monsterModel = (this.monster.getModel() as MonsterModel);
            this.setSightLineR(this.monsterModel.sightRate, this.monsterModel.sightValue);
            this.monsterModel.addEventListener(ActorModelEvent.ON_SIGHT_DATA_CHANGE, this.onSightDataChange);
            this.setVigour(this.monsterModel.vigourValue);
            this.monsterModel.addEventListener(ActorModelEvent.ON_BASE_DATA_UPDATE, this.onVigourChange);
        }

        private function onSightDataChange(_arg_1:ActorModelEvent):void
        {
            this.setSightLineR(this.monsterModel.sightRate, this.monsterModel.sightValue);
        }

        private function onVigourChange(_arg_1:ActorModelEvent):void
        {
            this.setVigour(this.monsterModel.vigourValue);
        }

        override public function updateEnvironment():void
        {
            super.updateEnvironment();
            this.scene = (m_environment as IScene);
            this.followElement.scene = this.scene;
        }

        override public function attachTarget(_arg_1:BaseElement):void
        {
            super.attachTarget(_arg_1);
            this.monster = (_arg_1 as BasePet);
            this.initThis();
        }

        override public function enterframe(_arg_1:int):void
        {
            super.enterframe(_arg_1);
            if (this.canRage > 0){
                this.canRage--;
            };
            if (this.rageNum > 0){
                this.rageNum = (this.rageNum - this.rageDownNum);
            };
            if (m_lifeTime == 1){
                this.canSuicide = true;
            };
            if (m_lifeTime > 1){
                m_lifeTime--;
            };
            var _local_2:int = this.currentState.onThinking(_arg_1);
            this.tickTimes--;
            if (this.tickTimes <= 0){
                this.tickTimes = this.answerTimes;
                if (((!((_local_2 == -1))) && (!((this.currentState == this.states[_local_2]))))){
                    this.setMonsterCurrentPosition();
                    this.currentState.stateOut();
                    this.currentState = this.states[_local_2];
                    this.currentState.stateIn();
                };
            };
        }

        override public function reset():void
        {
            if (this.monsterModel != null){
                this.monsterModel.removeEventListener(ActorModelEvent.ON_SIGHT_DATA_CHANGE, this.onSightDataChange);
                this.monsterModel.removeEventListener(ActorModelEvent.ON_BASE_DATA_UPDATE, this.onVigourChange);
            };
            this.monsterModel = null;
            if (this.followElement != null){
                this.followElement.reset();
                this.actionEventHandler.reset();
            };
            var _local_1:int;
            while (_local_1 < this.states.length) {
                this.states[_local_1].reset();
                _local_1++;
            };
            this.states = new Vector.<IMonsterBrainState>();
            this.monsterSuicideSightLines = [];
            this.monsterLeisureSightLines = [];
            this.yPosArray = [];
            this.rageNum = 0;
            this.scene = null;
            this.aiInfo = null;
            this.monster = null;
            this.answerTimes = 10;
            this.tickTimes = 0;
            this.currentState = null;
            this.group = ElementGroupDef.PVE_PLAYER;
            this.master = null;
            this.rageNum = 0;
            this.rageUpNum = 0;
            this.rageDownNum = 0;
            this.canRage = 0;
            this.canSuicide = false;
            this.currentX = 100;
            this.currentZ = 100;
            this.baseSightLineR = 0;
            this.baseChasetR = 0;
            this.followElement = null;
            this.actionEventHandler = null;
            super.reset();
        }

        public function getCurrentScene():IScene
        {
            return ((this.scene as IScene));
        }

        public function getMonster():BaseActor
        {
            return (this.monster);
        }

        public function getMonsterAIInfo():MonsterAIInfo
        {
            return (this.aiInfo);
        }

        public function getAIFindElement():AIFindElement
        {
            return (null);
        }

        public function getAI3DChaseElement():AI3DChaseElement
        {
            return (null);
        }

        public function getAIChaseElement():AIChaseElement
        {
            return (null);
        }

        public function getAIZChaseElement():AIZChaseElement
        {
            return (null);
        }

        public function getAIAvoidElement():AIAvoidElement
        {
            return (null);
        }

        public function getAI3DAvoidElement():AI3DAvoidElement
        {
            return (null);
        }

        public function getAIYMoveElement():AIYMoveElement
        {
            return (null);
        }

        public function getMonsterCurrentState():IMonsterBrainState
        {
            return (this.currentState);
        }

        public function getAIFollowElement():AIFollowElement
        {
            return (this.followElement);
        }

        public function getAIRunAwayElement():AIRunAwayElement
        {
            return (null);
        }

        public function getActionEventHanlder():ActionEventHandler
        {
            return (this.actionEventHandler);
        }

        public function getGroup():int
        {
            return (this.group);
        }

        public function getMonsterCurrentX():int
        {
            return (this.currentX);
        }

        public function getMonsterCurrentZ():int
        {
            return (this.currentZ);
        }

        public function setMonsterCurrentPosition():void
        {
            this.currentX = this.monster.mapX;
            this.currentZ = this.monster.mapZ;
        }

        public function getMaster():BaseActor
        {
            return (this.master);
        }

        public function getMonsterRoamRR():int
        {
            return (this.followElement.followLineRR);
        }

        public function getMonsterRoamRRZ():int
        {
            return (0);
        }

        public function getMonsterRoamPZ():Number
        {
            return (0);
        }

        public function getRageNum():int
        {
            return (this.rageNum);
        }

        public function getVigour():int
        {
            return (this.vigour);
        }

        public function getAIXRunElement():AIXRunElement
        {
            return (null);
        }

        public function getActionEventHanlder2():ActionEventHandler
        {
            return (null);
        }

        public function getAIRunChaseElement():AIRunChaseElement
        {
            return (null);
        }

        public function setRageNum(_arg_1:int, _arg_2:int=90):void
        {
            this.rageNum = _arg_1;
            this.canRage = _arg_2;
        }

        public function setSightLineR(_arg_1:Number, _arg_2:int):void
        {
            var _local_3:int = ((this.baseSightLineR * _arg_1) + _arg_2);
            var _local_4:int = ((this.baseChasetR * _arg_1) + _arg_2);
        }

        public function setChaseR(_arg_1:Number, _arg_2:int):void
        {
            var _local_3:int = ((this.baseChasetR * _arg_1) + _arg_2);
        }

        public function setVigour(_arg_1:int):void
        {
            this.vigour = _arg_1;
        }

        public function getHurtNum():int
        {
            return (this.beHurtNum);
        }

        public function setHurtNum(_arg_1:int):void
        {
            this.beHurtNum = _arg_1;
        }

        public function makeTimeChaseAttack(_arg_1:TimeChaseScriptArg):void
        {
        }

        override public function setGroup(_arg_1:int):void
        {
            this.group = _arg_1;
            var _local_2:int;
            while (_local_2 < this.states.length) {
                this.states[_local_2].setGroup(_arg_1);
                _local_2++;
            };
        }

        override public function beHurt(_arg_1:AttackInfo):void
        {
            if (this.canRage <= 0){
                this.rageNum = (this.rageNum + this.rageUpNum);
            };
            if (this.rageNum >= 10000){
                this.rageNum = 10000;
            };
            this.beHurtNum = (this.beHurtNum + 1);
            this.followElement.cancel();
        }

        override public function stateIn(_arg_1:Object=null):void
        {
            this.master = (_arg_1 as BaseActor);
            this.followElement.setAimElement(this.master);
            this.setGroup(this.master.groupID);
            this.setAllData();
        }

        public /*  ©init. */ function _SafeStr_771()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_771 = " SimpleAidCityAI" (String#15188)


