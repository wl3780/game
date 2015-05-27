﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.SimplePetMonsterAI

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.monster.BaseMonster;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.data.MonsterBuffInfo;
    import com.tencent.ai.core.monster.MonsterModel;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.monster.ai.stateNew.NewBrainInactivePetMonsterState;
    import com.tencent.ai.core.monster.ai.stateNew.NewHaveAimPetMonsterState;
    import com.tencent.ai.core.monster.ai.stateNew.NewNoAimPetMonsterState;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.monster.ai.state.TimeChaseActionState;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_777;
    import __AS3__.vec.*;

    public class SimplePetMonsterAI extends BaseAIComponent implements IMonsterBrain 
    {

        protected var scene:ICombatScene;
        protected var monster:BaseMonster;
        protected var answerTimes:int = 10;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var chase3DElement:AI3DChaseElement;
        protected var chaseZElement:AIZChaseElement;
        protected var avoidElement:AIAvoidElement;
        protected var avoid3DElement:AI3DAvoidElement;
        protected var yMoveElement:AIYMoveElement;
        protected var followElement:AIFollowElement;
        protected var runAwayElement:AIRunAwayElement;
        protected var actionEventHandler:ActionEventHandler;
        protected var tickTimes:int;
        protected var aiInfo:MonsterAIInfo;
        protected var states:Vector.<IMonsterBrainState>;
        protected var currentState:IMonsterBrainState;
        public var monsterSightlines:Array;
        public var monsterTimeAttackSightLines:Array;
        public var monsterHPAttackSightLines:Array;
        public var monsterRageAttackSightLines:Array;
        public var monsterSuicideSightLines:Array;
        public var monsterRageBuffs:Vector.<MonsterBuffInfo>;
        public var monsterLeisureSightLines:Array;
        public var yPosArray:Array;
        public var group:int = 1;
        public var rageNum:int = 0;
        public var firstBloodP:Number = 1;
        public var wantBeHurtP:Number = 1;
        public var currentX:int = 100;
        public var currentZ:int = 100;
        protected var monsterModel:MonsterModel;
        private var baseSightLineR:int = 0;
        private var baseChasetR:int = 0;

        public function SimplePetMonsterAI()
        {
            this.monsterSightlines = new Array();
            this.monsterTimeAttackSightLines = new Array();
            this.monsterHPAttackSightLines = new Array();
            this.monsterRageAttackSightLines = new Array();
            this.monsterSuicideSightLines = new Array();
            this.monsterLeisureSightLines = new Array();
            this.yPosArray = new Array();
            super();
        }

        public function getMonsterSightlines():Array
        {
            return (this.monsterSightlines);
        }

        public function getYPosArray():Array
        {
            return (this.yPosArray);
        }

        protected function initThis():void
        {
            this.findElement = new AIFindElement();
            this.chaseElement = new AIChaseElement();
            this.chase3DElement = new AI3DChaseElement();
            this.chaseZElement = new AIZChaseElement();
            this.avoidElement = new AIAvoidElement();
            this.avoid3DElement = new AI3DAvoidElement();
            this.yMoveElement = new AIYMoveElement();
            this.followElement = new AIFollowElement();
            this.actionEventHandler = new ActionEventHandler();
            this.runAwayElement = new AIRunAwayElement();
            this.findElement.target = this.monster;
            this.chaseElement.target = this.monster;
            this.avoidElement.target = this.monster;
            this.chaseZElement.target = this.monster;
            this.chase3DElement.target = this.monster;
            this.avoid3DElement.target = this.monster;
            this.yMoveElement.target = this.monster;
            this.followElement.target = this.monster;
            this.runAwayElement.target = this.monster;
            this.actionEventHandler.setTarget(this.monster);
            this.actionEventHandler.addEvent();
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
            var _local_5:Array;
            var _local_6:Array;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:MonsterAISkillParam;
            var _local_10:int;
            var _local_1 = 2000;
            this.chaseElement.chasetRR = (_local_1 * _local_1);
            this.chase3DElement.chasetRR = (_local_1 * _local_1);
            this.baseChasetR = _local_1;
            _local_1 = 1800;
            this.findElement.sightLineRR = (_local_1 * _local_1);
            this.findElement.isFlyMonster = this.aiInfo.isFlyMonster;
            this.baseSightLineR = _local_1;
            _local_1 = this.aiInfo.monsterIQ;
            this.chaseElement.monsterIQ = _local_1;
            this.chase3DElement.monsterIQ = _local_1;
            this.avoid3DElement.monsterIQ = _local_1;
            this.yMoveElement.monsterIQ = _local_1;
            this.findElement.monsterIQ = _local_1;
            this.followElement.monsterIQ = _local_1;
            this.avoidElement.monsterIQ = _local_1;
            this.avoidElement.monsterTemper = this.aiInfo.monsterTemper;
            _local_1 = this.aiInfo.roamR;
            this.followElement.followLineRR = (_local_1 * _local_1);
            this.followElement.sightLineRR = (_local_1 * _local_1);
            this.rageNum = 10000;
            this.firstBloodP = this.aiInfo.firstBloodP;
            this.wantBeHurtP = this.aiInfo.wantBeHurtP;
            this.answerTimes = 1;
            this.tickTimes = this.answerTimes;
            this.monsterSightlines = [];
            this.monsterTimeAttackSightLines = [];
            this.monsterHPAttackSightLines = [];
            this.monsterRageAttackSightLines = [];
            this.monsterRageBuffs = this.aiInfo.buffParams;
            this.yPosArray = [];
            var _local_2:int = this.aiInfo.skillParams.length;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 3){
                    _local_5 = new Array();
                    _local_5.push(this.aiInfo.skillParams[_local_3]);
                    _local_6 = this.aiInfo.skillParams[_local_3].skill.skillInfos;
                    _local_5.push(_local_6[0].attackDX);
                    _local_5.push(_local_6[0].attackDZ);
                    _local_5.push(this.aiInfo.skillParams[_local_3].tRandomP);
                    _local_5.push(this.aiInfo.skillParams[_local_3].dmgTotal);
                    this.monsterSightlines.push(_local_5);
                };
                _local_3++;
            };
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 2){
                    _local_7 = new Array();
                    _local_7.push(this.aiInfo.skillParams[_local_3]);
                    _local_7.push(this.aiInfo.skillParams[_local_3].tHPP);
                    _local_7.push(this.aiInfo.skillParams[_local_3].tRandomP);
                    _local_7.push(this.aiInfo.skillParams[_local_3].tTime);
                    this.monsterHPAttackSightLines.push(_local_7);
                };
                _local_3++;
            };
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 1){
                    _local_8 = new Array();
                    _local_8.push(this.aiInfo.skillParams[_local_3]);
                    _local_8.push(this.aiInfo.skillParams[_local_3].tTime);
                    this.monsterTimeAttackSightLines.push(_local_8);
                };
                _local_3++;
            };
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 4){
                    this.monsterRageAttackSightLines.push(this.aiInfo.skillParams[_local_3]);
                };
                _local_3++;
            };
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 5){
                    this.monsterSuicideSightLines.push(this.aiInfo.skillParams[_local_3]);
                };
                _local_3++;
            };
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 6){
                    this.monsterLeisureSightLines.push(this.aiInfo.skillParams[_local_3]);
                };
                _local_3++;
            };
            this.yPosArray = [];
            this.yPosArray.push(this.aiInfo.yPos1);
            this.yPosArray.push(this.aiInfo.yPos2);
            this.yPosArray.push(this.aiInfo.yPos3);
            this.states = new Vector.<IMonsterBrainState>();
            this.states.push(new NewBrainInactivePetMonsterState(this));
            this.states.push(new NewHaveAimPetMonsterState(this));
            this.states.push(new NewNoAimPetMonsterState(this));
            var _local_4:int;
            while (_local_4 < this.states.length) {
                this.states[_local_4].setAIInfo(this.aiInfo);
                _local_4++;
            };
            this.currentState = this.states[0];
            this.currentState.stateIn();
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this.aiInfo.skillParams[_local_3].tType == 10){
                    this.chaseElement.cancel();
                    this.avoidElement.cancel();
                    this.chase3DElement.cancel();
                    this.chaseZElement.cancel();
                    this.avoid3DElement.cancel();
                    _local_9 = this.aiInfo.skillParams[_local_3];
                    _local_10 = _local_9.skill.actionID;
                    this.monster.inputActionID(_local_10);
                    return;
                };
                _local_3++;
            };
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
            this.scene = (m_environment as ICombatScene);
            this.findElement.scene = this.scene;
            this.chaseElement.scene = this.scene;
            this.chase3DElement.scene = this.scene;
            this.avoid3DElement.scene = this.scene;
            this.followElement.scene = this.scene;
            this.avoidElement.scene = this.scene;
            this.runAwayElement.scene = this.scene;
        }

        override public function attachTarget(_arg_1:BaseElement):void
        {
            super.attachTarget(_arg_1);
            this.monster = (_arg_1 as BaseMonster);
            this.initThis();
        }

        override public function enterframe(_arg_1:int):void
        {
            super.enterframe(_arg_1);
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
            if (this.findElement != null){
                this.findElement.reset();
                this.chaseElement.reset();
                this.avoidElement.reset();
                this.chase3DElement.reset();
                this.avoid3DElement.reset();
                this.yMoveElement.reset();
                this.followElement.reset();
                this.actionEventHandler.reset();
                this.runAwayElement.reset();
            };
            var _local_1:int;
            while (_local_1 < this.states.length) {
                this.states[_local_1].reset();
                _local_1++;
            };
            this.states = new Vector.<IMonsterBrainState>();
            this.monsterSightlines = [];
            this.monsterTimeAttackSightLines = [];
            this.monsterHPAttackSightLines = [];
            this.monsterRageAttackSightLines = [];
            this.monsterSuicideSightLines = [];
            this.monsterLeisureSightLines = [];
            this.yPosArray = [];
            this.scene = null;
            this.aiInfo = null;
            this.answerTimes = 10;
            this.tickTimes = 0;
            this.currentState = null;
            this.monsterRageBuffs = new Vector.<MonsterBuffInfo>();
            this.group = ElementGroupDef.PVE_PLAYER;
            this.rageNum = 0;
            this.currentX = 100;
            this.currentZ = 100;
            this.baseSightLineR = 0;
            this.baseChasetR = 0;
            this.findElement = null;
            this.chaseElement = null;
            this.avoidElement = null;
            this.chase3DElement = null;
            this.chaseZElement = null;
            this.avoid3DElement = null;
            this.yMoveElement = null;
            this.followElement = null;
            this.actionEventHandler = null;
            this.runAwayElement = null;
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
            return (this.findElement);
        }

        public function getAI3DChaseElement():AI3DChaseElement
        {
            return (this.chase3DElement);
        }

        public function getAIChaseElement():AIChaseElement
        {
            return (this.chaseElement);
        }

        public function getAIZChaseElement():AIZChaseElement
        {
            return (this.chaseZElement);
        }

        public function getAIAvoidElement():AIAvoidElement
        {
            return (this.avoidElement);
        }

        public function getAI3DAvoidElement():AI3DAvoidElement
        {
            return (this.avoid3DElement);
        }

        public function getAIYMoveElement():AIYMoveElement
        {
            return (this.yMoveElement);
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
            return (this.runAwayElement);
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
            return (null);
        }

        public function getMonsterRoamRR():int
        {
            return (0);
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
            return (10000);
        }

        public function getVigour():int
        {
            return (0);
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
        }

        public function setSightLineR(_arg_1:Number, _arg_2:int):void
        {
            var _local_3:int = ((this.baseSightLineR * _arg_1) + _arg_2);
            var _local_4:int = ((this.baseChasetR * _arg_1) + _arg_2);
            this.findElement.sightLineRR = (_local_3 * _local_3);
            this.chaseElement.chasetRR = (_local_4 * _local_4);
            this.chase3DElement.chasetRR = (_local_4 * _local_4);
            this.chaseZElement.chasetRR = (_local_4 * _local_4);
        }

        public function setChaseR(_arg_1:Number, _arg_2:int):void
        {
            var _local_3:int = ((this.baseChasetR * _arg_1) + _arg_2);
            this.chaseElement.chasetRR = (_local_3 * _local_3);
            this.chase3DElement.chasetRR = (_local_3 * _local_3);
            this.chaseZElement.chasetRR = (_local_3 * _local_3);
        }

        public function setVigour(_arg_1:int):void
        {
        }

        public function getHurtNum():int
        {
            return (100);
        }

        public function setHurtNum(_arg_1:int):void
        {
        }

        public function makeTimeChaseAttack(_arg_1:TimeChaseScriptArg):void
        {
            this.setMonsterCurrentPosition();
            this.currentState.stateOut();
            this.currentState = new TimeChaseActionState(this);
            (this.currentState as TimeChaseActionState).setTimeChaseAttackUnitParams(_arg_1);
            this.currentState.stateIn();
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
            this.rageNum = 10000;
            this.chaseElement.cancel();
            this.avoidElement.cancel();
            this.chase3DElement.cancel();
            this.avoid3DElement.cancel();
            this.runAwayElement.cancel();
            this.yMoveElement.cancel();
            this.followElement.cancel();
            this.chaseZElement.cancel();
        }

        override public function stateIn(_arg_1:Object=null):void
        {
            this.setAllData();
        }

        public /*  ©init. */ function _SafeStr_777()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_777 = " SimplePetMonsterAI" (String#14957)


