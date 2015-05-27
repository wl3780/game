﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.state.HaveAimAPCState

package com.tencent.ai.core.monster.ai.state
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.unit.TimingAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.HPAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.RandomAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.AvoidAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.Timing3DAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.HP3DAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.RageAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.Random3DAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.Avoid3DAttackUnit;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.FollowUnit;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.AI3DChaseElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIAvoidElement;
    import com.tencent.ai.core.monster.ai.AI3DAvoidElement;
    import com.tencent.ai.core.monster.ai.unit.YMoveUnit;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.MonsterBuffInfo;
    import com.tencent.ai.core.monster.MonsterModel;
    import com.tencent.ai.core.monster.ai.SimpleAPCAI;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.func.asyn_apply_funcs;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.Direction;
    import  ©init._SafeStr_695;

    public class HaveAimAPCState implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var roamUnit:RoamUnit;
        protected var timingAttackUnit:TimingAttackUnit;
        protected var hpAttackUnit:HPAttackUnit;
        protected var randomAttackUnit:RandomAttackUnit;
        protected var avoidAttackUnit:AvoidAttackUnit;
        protected var timing3DAttackUnit:Timing3DAttackUnit;
        protected var hp3DAttackUnit:HP3DAttackUnit;
        protected var rageAttackUnit:RageAttackUnit;
        protected var random3DAttackUnit:Random3DAttackUnit;
        protected var avoid3DAttackUnit:Avoid3DAttackUnit;
        protected var nothingUnit:NothingUnit;
        protected var followUnit:FollowUnit;
        protected var currentUnit:IAIUnit;
        protected var chaseElement:AIChaseElement;
        protected var chase3DElement:AI3DChaseElement;
        protected var findElement:AIFindElement;
        protected var avoidElement:AIAvoidElement;
        protected var avoid3DElement:AI3DAvoidElement;
        protected var yMoveUnit:YMoveUnit;
        protected var checkrageBuffs:Vector.<MonsterBuffInfo>;
        protected var checkrageList:Array;
        protected var checkTimeList:Array;
        protected var checkHpList:Array;
        protected var checkSuicideList:Array;
        protected var checkRandomList:Array;
        protected var monsterModel:MonsterModel;
        protected var simpleMonsterAI:SimpleAPCAI;
        protected var group:int = 1;
        protected var choose45:Boolean = false;

        public function HaveAimAPCState(_arg_1:IMonsterBrain)
        {
            this.initThis(_arg_1);
            this.brain = _arg_1;
        }

        protected function initThis(_arg_1:IMonsterBrain):void
        {
            var _local_2:SimpleAPCAI = (_arg_1 as SimpleAPCAI);
            this.checkTimeList = _local_2.monsterTimeAttackSightLines.slice();
            this.checkHpList = _local_2.monsterHPAttackSightLines.slice();
            this.checkRandomList = _local_2.monsterSightlines.slice();
            this.checkrageList = _local_2.monsterRageAttackSightLines.slice();
            this.checkrageBuffs = _local_2.monsterRageBuffs.slice();
            this.checkSuicideList = _local_2.monsterSuicideSightLines.slice();
            this.simpleMonsterAI = _local_2;
            this.monsterModel = (_arg_1.getMonster().getModel() as MonsterModel);
            this.timingAttackUnit = new TimingAttackUnit(_arg_1);
            this.hpAttackUnit = new HPAttackUnit(_arg_1);
            this.randomAttackUnit = new RandomAttackUnit(_arg_1);
            this.avoidAttackUnit = new AvoidAttackUnit(_arg_1);
            this.timing3DAttackUnit = new Timing3DAttackUnit(_arg_1);
            this.hp3DAttackUnit = new HP3DAttackUnit(_arg_1);
            this.rageAttackUnit = new RageAttackUnit(_arg_1);
            this.random3DAttackUnit = new Random3DAttackUnit(_arg_1);
            this.avoid3DAttackUnit = new Avoid3DAttackUnit(_arg_1);
            this.nothingUnit = new NothingUnit();
            this.yMoveUnit = new YMoveUnit(_arg_1);
            this.followUnit = new FollowUnit(_arg_1);
            this.roamUnit = new RoamUnit(_arg_1);
            this.chaseElement = _arg_1.getAIChaseElement();
            this.chase3DElement = _arg_1.getAI3DChaseElement();
            this.findElement = _arg_1.getAIFindElement();
            this.avoidElement = _arg_1.getAIAvoidElement();
            this.avoid3DElement = _arg_1.getAI3DAvoidElement();
        }

        protected function randomUnit():IAIUnit
        {
            var _local_1:Number = (DEFINE.RANDOM_FLOAT() * (100 - (8 * this.chaseElement.monsterIQ)));
            var _local_2:Number = (DEFINE.RANDOM_FLOAT() * 100);
            var _local_3:Number = ((10 - this.avoidElement.monsterTemper) / 10);
            if (_local_1 < this.chaseElement.monsterIQ){
                if ((((this.monsterModel.hp < (_local_3 * this.monsterModel.maxhp))) && ((_local_2 > 50)))){
                    if (this.findElement.isFlyMonster){
                        return (this.avoid3DAttackUnit);
                    };
                    return (this.avoidAttackUnit);
                };
                if (this.findElement.isFlyMonster){
                    return (this.random3DAttackUnit);
                };
                return (this.randomAttackUnit);
            };
            if (this.findElement.isFlyMonster){
                return (this.yMoveUnit);
            };
            return (this.nothingUnit);
        }

        protected function setCurrentUnit(_arg_1:IAIUnit, _arg_2:int=3, _arg_3:MonsterAISkillParam=null):int
        {
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
            };
            this.currentUnit = _arg_1;
            if (_arg_2 != 3){
                this.currentUnit.addAISkillParam(_arg_3);
            };
            if (this.currentUnit != null){
                this.currentUnit.run();
            };
            return (-1);
        }

        public function setAIInfo(_arg_1:MonsterAIInfo):void
        {
            var _local_4:MonsterAISkillParam;
            var _local_5:int;
            this.randomAttackUnit.setProbabilityRange(0, (1 - _arg_1.idleP));
            this.nothingUnit.lastCycles = _arg_1.durCycles;
            var _local_2:Vector.<MonsterAISkillParam> = _arg_1.skillParams;
            var _local_3:int;
            while (_local_3 < _local_2.length) {
                _local_4 = _local_2[_local_3];
                _local_5 = _local_4.tType;
                switch (_local_5){
                    case MonsterEnum.STT_RANDOM:
                        this.randomAttackUnit.addAISkillParam(_local_4);
                        break;
                };
                _local_3++;
            };
        }

        public function reset():void
        {
            this.randomAttackUnit.reset();
            this.hpAttackUnit.reset();
            this.timingAttackUnit.reset();
            this.avoidAttackUnit.reset();
            this.random3DAttackUnit.reset();
            this.hp3DAttackUnit.reset();
            this.rageAttackUnit.reset();
            this.timing3DAttackUnit.reset();
            this.avoid3DAttackUnit.reset();
            this.yMoveUnit.reset();
            this.roamUnit.reset();
        }

        public function stateIn():void
        {
            this.chaseElement.setAimElement(this.findElement.resElement);
            this.avoidElement.setAimElement(this.findElement.resElement);
            this.chase3DElement.setAimElement(this.findElement.resElement);
            this.avoid3DElement.setAimElement(this.findElement.resElement);
            this.findElement.resElement = null;
            if ((((this.checkRandomList.length >= 1)) && ((DEFINE.RANDOM_FLOAT() < (this.brain as SimpleAPCAI).firstBloodP)))){
                this.setCurrentUnit(this.randomUnit());
                return;
            };
            this.setCurrentUnit(this.nothingUnit);
        }

        public function stateOut():void
        {
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
                this.currentUnit = null;
            };
        }

        public function onThinking(_arg_1:int):int
        {
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int;
            var _local_6:MonsterAISkillParam;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Array;
            var _local_10:Array;
            var _local_11:Array;
            if (this.brain.getRageNum() > 8000){
                _local_3 = 90;
                if (this.checkrageBuffs.length > 0){
                    _local_4 = new Array();
                    _local_5 = DEFINE.RANDOM_INT((this.checkrageBuffs.length - 1));
                    _local_4.push(this.checkrageBuffs[_local_5].actionID);
                    asyn_apply_funcs(this.brain.getMonster(), _local_4);
                    this.brain.setRageNum(120, this.checkrageBuffs[_local_5].timer);
                    _local_3 = this.checkrageBuffs[_local_5].timer;
                    this.choose45 = true;
                };
            };
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < this.checkTimeList.length) {
                var _local_12 = this.checkTimeList[_local_2];
                var _local_13:int = 1;
                var _local_14 = (_local_12[_local_13] - 1);
                _local_12[_local_13] = _local_14;
                _local_2++;
            };
            _local_2 = 0;
            if ((((this.currentUnit == null)) || (this.currentUnit.canBreak()))){
                if (this.simpleMonsterAI.canSuicide == true){
                    if (this.checkSuicideList.length > 0){
                        this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                        this.simpleMonsterAI.canSuicide = false;
                        return (-1);
                    };
                };
                if (this.group == ElementGroupDef.PVE_MONSTER){
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                };
                if (this.group == ElementGroupDef.PVE_PLAYER){
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                };
                if (this.findElement.hasAim()){
                    this.chaseElement.setAimElement(this.findElement.resElement);
                    this.avoidElement.setAimElement(this.findElement.resElement);
                    this.chase3DElement.setAimElement(this.findElement.resElement);
                    this.avoid3DElement.setAimElement(this.findElement.resElement);
                };
                if (!this.findElement.hasAim()){
                    return (2);
                };
                if (this.findElement.resElement != null){
                    _local_7 = (this.findElement.resElement.mapX - this.brain.getMonster().mapX);
                    this.brain.getMonster().setDirection((((_local_7 > 0)) ? Direction.RIGHT : Direction.LEFT));
                };
                if ((((this.choose45 == true)) || ((this.brain.getRageNum() > 8000)))){
                    this.choose45 = false;
                    if (this.checkrageList.length > 0){
                        _local_8 = DEFINE.RANDOM_INT((this.checkrageList.length - 1));
                        this.brain.setRageNum(120);
                        _local_6 = this.checkrageList[_local_8];
                        this.checkrageList[_local_8].num--;
                        if (this.checkrageList[_local_8].num == 0){
                            this.checkrageList.splice(_local_8, 1);
                        };
                        return (this.setCurrentUnit(this.rageAttackUnit, 4, _local_6));
                    };
                };
                _local_2 = 0;
                _local_2 = 0;
                while (_local_2 < this.checkTimeList.length) {
                    if (this.checkTimeList[_local_2][1] <= 0){
                        if (this.checkTimeList[_local_2][0].aType == 0){
                            if (this.group == ElementGroupDef.PVE_MONSTER){
                                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                            } else {
                                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                            };
                            if (this.findElement.hasAim()){
                                this.chaseElement.setAimElement(this.findElement.resElement);
                                this.avoidElement.setAimElement(this.findElement.resElement);
                                this.chase3DElement.setAimElement(this.findElement.resElement);
                                this.avoid3DElement.setAimElement(this.findElement.resElement);
                            };
                        };
                        if (this.findElement.hasAim()){
                            this.checkTimeList[_local_2][1] = this.checkTimeList[_local_2][0].tTime;
                            _local_6 = this.checkTimeList[_local_2][0];
                            this.checkTimeList[_local_2][0].num--;
                            if (this.checkTimeList[_local_2][0].num == 0){
                                this.checkTimeList.splice(_local_2, 1);
                            };
                            if (this.findElement.isFlyMonster == false){
                                return (this.setCurrentUnit(this.timingAttackUnit, 1, _local_6));
                            };
                            return (this.setCurrentUnit(this.timing3DAttackUnit, 1, _local_6));
                        };
                    };
                    _local_2++;
                };
                _local_2 = 0;
                _local_2 = 0;
                while (_local_2 < this.checkHpList.length) {
                    if (this.monsterModel.hp <= (this.checkHpList[_local_2][1] * this.monsterModel.maxhp)){
                        if (this.checkHpList[_local_2][0].aType == 0){
                            if (this.group == ElementGroupDef.PVE_MONSTER){
                                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                            } else {
                                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                            };
                            if (this.findElement.hasAim()){
                                this.chaseElement.setAimElement(this.findElement.resElement);
                                this.avoidElement.setAimElement(this.findElement.resElement);
                                this.chase3DElement.setAimElement(this.findElement.resElement);
                                this.avoid3DElement.setAimElement(this.findElement.resElement);
                            };
                        };
                        if (this.findElement.hasAim()){
                            this.checkHpList[_local_2][1] = 1073731824;
                            if (this.checkHpList[_local_2][2] != 0){
                                _local_9 = new Array();
                                _local_9.push(this.checkHpList[_local_2][0]);
                                _local_10 = this.checkHpList[_local_2][0].skill.skillInfos;
                                _local_9.push(_local_10[0].attackDX);
                                _local_9.push(_local_10[0].attackDZ);
                                _local_9.push(this.checkHpList[_local_2][0].tRandomP);
                                _local_9.push(this.checkHpList[_local_2][0].dmgTotal);
                                this.checkRandomList.push(_local_9);
                            };
                            if (this.checkHpList[_local_2][3] != 0){
                                _local_11 = new Array();
                                _local_11.push(this.checkHpList[_local_2][0]);
                                _local_11.push(this.checkHpList[_local_2][0].tTime);
                                this.checkTimeList.push(_local_11);
                            };
                            _local_6 = this.checkHpList[_local_2][0];
                            this.checkHpList[_local_2][0].num--;
                            if (this.checkHpList[_local_2][0].num == 0){
                                this.checkHpList.splice(_local_2, 1);
                            };
                            if (this.findElement.isFlyMonster == false){
                                return (this.setCurrentUnit(this.hpAttackUnit, 2, _local_6));
                            };
                            return (this.setCurrentUnit(this.hp3DAttackUnit, 2, _local_6));
                        };
                    };
                    _local_2++;
                };
                if (this.checkRandomList.length >= 1){
                    return (this.setCurrentUnit(this.randomUnit()));
                };
            } else {
                this.currentUnit.onTick();
            };
            return (-1);
        }

        private function makeDirection():void
        {
            var _local_1:int;
            if (this.findElement.resElement != null){
                _local_1 = (this.findElement.resElement.mapX - this.brain.getMonster().mapX);
                this.brain.getMonster().setDirection((((_local_1 > 0)) ? Direction.RIGHT : Direction.LEFT));
            };
        }

        public function getStateType():int
        {
            return (1);
        }

        public function getGroup():int
        {
            return (this.group);
        }

        public function setGroup(_arg_1:int):void
        {
            this.group = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_695()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.state

// _SafeStr_695 = " HaveAimAPCState" (String#16949)


