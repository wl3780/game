// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewNoAimPetMonsterState

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.unit.LeisureUnit;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.SimplePetMonsterAI;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import  ©init._SafeStr_726;

    public class NewNoAimPetMonsterState implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var nothingUnit:NothingUnit;
        protected var roamUnit:RoamUnit;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var leisureUnit:LeisureUnit;
        protected var currentUnit:IAIUnit;
        protected var currentSight:int = 0;
        protected var changedSightTime:int = 100;
        protected var group:int;
        protected var checkLeisureList:Array;
        protected var param:MonsterAIInfo;

        public function NewNoAimPetMonsterState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.nothingUnit = new NothingUnit();
            this.roamUnit = new RoamUnit(_arg_1);
            this.leisureUnit = new LeisureUnit(_arg_1);
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
            this.group = _arg_1.getGroup();
            this.checkLeisureList = (_arg_1 as SimplePetMonsterAI).monsterLeisureSightLines.slice();
        }

        protected function randomUnit():IAIUnit
        {
            this.brain.setMonsterCurrentPosition();
            if ((DEFINE.RANDOM_FLOAT() * 100) < 20){
                return (this.roamUnit);
            };
            return (this.nothingUnit);
        }

        protected function setCurrentUnit(_arg_1:IAIUnit):int
        {
            if (this.currentUnit == this.roamUnit){
                if (this.currentUnit.canBreak()){
                    this.currentUnit.breakUnit();
                    this.currentUnit = this.nothingUnit;
                };
                return (-1);
            };
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
            };
            this.currentUnit = _arg_1;
            this.currentUnit.run();
            return (-1);
        }

        public function setAIInfo(_arg_1:MonsterAIInfo):void
        {
            this.param = _arg_1;
            this.nothingUnit.lastCycles = _arg_1.durCycles;
            this.roamUnit.lastCycles = _arg_1.durCycles;
            this.roamUnit.setProbabilityRange(0, _arg_1.roamP);
        }

        public function reset():void
        {
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
            };
        }

        public function stateIn():void
        {
            this.changedSightTime = 100;
            this.currentSight = this.chaseElement.chasetRR;
            this.setCurrentUnit(this.randomUnit());
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
            var _local_2:int;
            var _local_3:int;
            if (this.brain.getHurtNum() > 0){
                this.brain.setHurtNum(0);
                if (this.currentUnit != null){
                    this.currentUnit.breakUnit();
                };
            };
            if (this.changedSightTime > 0){
                this.changedSightTime--;
            };
            if (this.changedSightTime == 0){
                this.changedSightTime = 0;
                this.currentSight = 0;
            };
            if (this.group == ElementGroupDef.PVE_PLAYER){
                this.findElement.findElementNearest(this.currentSight, ElementGroupDef.PVE_MONSTER);
            } else {
                this.findElement.findElementNearest(this.currentSight, ElementGroupDef.PVE_PLAYER);
            };
            if (((this.findElement.hasAim()) && ((this.param.aType == MonsterEnum.AT_POSITIVE)))){
                if (this.currentUnit != null){
                    this.currentUnit.breakUnit();
                    this.currentUnit = null;
                };
                if (this.findElement.resElement != null){
                    _local_2 = (this.findElement.resElement.mapX - this.brain.getMonster().mapX);
                    this.brain.getMonster().setDirection((((_local_2 > 0)) ? Direction.RIGHT : Direction.LEFT));
                };
                return (1);
            };
            if ((((this.currentUnit == null)) || (this.currentUnit.canBreak()))){
                if ((((this.checkLeisureList.length > 0)) && (((DEFINE.RANDOM_FLOAT() * 100) < 2)))){
                    _local_3 = (DEFINE.RANDOM_FLOAT() * (this.checkLeisureList.length - 1));
                    this.brain.getMonster().inputVKey((this.checkLeisureList[_local_3] as MonsterAISkillParam).skill.actionID);
                    return (-1);
                };
                return (this.setCurrentUnit(this.randomUnit()));
            };
            this.currentUnit.onTick();
            return (-1);
        }

        public function getStateType():int
        {
            return (2);
        }

        public function getGroup():int
        {
            return (this.group);
        }

        public function setGroup(_arg_1:int):void
        {
            this.group = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_726()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_726 = " NewNoAimPetMonsterState" (String#17666)


