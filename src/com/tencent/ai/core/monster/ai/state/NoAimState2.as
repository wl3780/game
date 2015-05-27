// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.state.NoAimState2

package com.tencent.ai.core.monster.ai.state
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.unit.LeisureUnit;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.monster.ai.SimpleMonsterAI;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_704;

    public class NoAimState2 implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var nothingUnit:NothingUnit;
        protected var roamUnit:RoamUnit;
        protected var leisureUnit:LeisureUnit;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var currentUnit:IAIUnit;
        protected var currentSight:int = 0;
        protected var changedSightTime:int = 100;
        protected var group:int = 2;
        protected var checkSuicideList:Array;
        protected var checkLeisureList:Array;

        public function NoAimState2(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.nothingUnit = new NothingUnit();
            this.roamUnit = new RoamUnit(_arg_1);
            this.leisureUnit = new LeisureUnit(_arg_1);
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
            this.checkSuicideList = (_arg_1 as SimpleMonsterAI).monsterSuicideSightLines.slice();
            this.checkLeisureList = (_arg_1 as SimpleMonsterAI).monsterLeisureSightLines.slice();
        }

        protected function randomUnit():IAIUnit
        {
            this.brain.setMonsterCurrentPosition();
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
            if (this.brain.getHurtNum() > 0){
                this.brain.setHurtNum(0);
                if (this.currentUnit != null){
                    this.currentUnit.breakUnit();
                };
            };
            if ((this.brain as SimpleMonsterAI).canSuicide == true){
                if (this.checkSuicideList.length > 0){
                    if (this.currentUnit != null){
                        this.currentUnit.breakUnit();
                        this.currentUnit = null;
                    };
                    this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                    (this.brain as SimpleMonsterAI).canSuicide = false;
                    return (-1);
                };
            };
            if (this.changedSightTime > 0){
                this.changedSightTime--;
            };
            if (this.changedSightTime == 0){
                this.changedSightTime = 0;
                this.currentSight = 0;
            };
            if (this.group == ElementGroupDef.PVE_MONSTER){
                this.findElement.findElementNearest(this.currentSight, ElementGroupDef.PVE_PLAYER);
            } else {
                this.findElement.findElementNearest(this.currentSight, ElementGroupDef.PVE_MONSTER);
            };
            if (this.findElement.hasAim()){
                if (this.currentUnit != null){
                    this.currentUnit.breakUnit();
                    this.currentUnit = null;
                };
                return (1);
            };
            if ((((this.currentUnit == null)) || (this.currentUnit.canBreak()))){
                if ((((this.checkLeisureList.length > 0)) && (((DEFINE.RANDOM_FLOAT() * 100) < 2)))){
                    _local_2 = (DEFINE.RANDOM_FLOAT() * (this.checkLeisureList.length - 1));
                    this.brain.getMonster().inputVKey((this.checkLeisureList[_local_2] as MonsterAISkillParam).skill.actionID);
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

        public /*  ©init. */ function _SafeStr_704()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.state

// _SafeStr_704 = " NoAimState2" (String#15287)


