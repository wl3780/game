// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewHaveAimState3

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.RunAwayUnit;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.MonsterModel;
    import com.tencent.ai.core.monster.ai.SimpleMonsterAI;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import  ©init._SafeStr_720;

    public class NewHaveAimState3 implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var roamUnit:RoamUnit;
        protected var nothingUnit:NothingUnit;
        protected var runAwayUnit:RunAwayUnit;
        protected var checkSuicideList:Array;
        protected var currentUnit:IAIUnit;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var monsterModel:MonsterModel;
        protected var simpleMonsterAI:SimpleMonsterAI;
        protected var group:int = 2;
        protected var choose45:Boolean = false;

        public function NewHaveAimState3(_arg_1:IMonsterBrain)
        {
            this.initThis(_arg_1);
            this.brain = _arg_1;
        }

        protected function initThis(_arg_1:IMonsterBrain):void
        {
            var _local_2:SimpleMonsterAI = (_arg_1 as SimpleMonsterAI);
            this.simpleMonsterAI = _local_2;
            this.monsterModel = (_arg_1.getMonster().getModel() as MonsterModel);
            this.checkSuicideList = _local_2.monsterSuicideSightLines.slice();
            this.nothingUnit = new NothingUnit();
            this.runAwayUnit = new RunAwayUnit(_arg_1);
            this.roamUnit = new RoamUnit(_arg_1);
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
        }

        protected function randomUnit():IAIUnit
        {
            this.brain.setMonsterCurrentPosition();
            var _local_1:Number = (DEFINE.RANDOM_FLOAT() * (110 - (10 * this.chaseElement.monsterIQ)));
            if (_local_1 < this.chaseElement.monsterIQ){
                return (this.runAwayUnit);
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
            this.nothingUnit.lastCycles = _arg_1.durCycles;
            var _local_2:Vector.<MonsterAISkillParam> = _arg_1.skillParams;
            var _local_3:int;
            while (_local_3 < _local_2.length) {
                _local_4 = _local_2[_local_3];
                _local_5 = _local_4.tType;
                switch (_local_5){
                    case MonsterEnum.STT_RANDOM:
                        break;
                };
                _local_3++;
            };
        }

        public function reset():void
        {
            this.runAwayUnit.reset();
            this.roamUnit.reset();
        }

        public function stateIn():void
        {
            this.chaseElement.setAimElement(this.findElement.resElement);
            this.findElement.resElement = null;
            this.setCurrentUnit(this.runAwayUnit);
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
            if ((((this.currentUnit == null)) || (this.currentUnit.canBreak()))){
                if (this.simpleMonsterAI.canSuicide == true){
                    if (this.checkSuicideList.length > 0){
                        this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                        this.simpleMonsterAI.canSuicide = false;
                        return (-1);
                    };
                };
                if (this.group == ElementGroupDef.PVE_MONSTER){
                    this.findElement.findElementNearest(0, ElementGroupDef.PVE_PLAYER);
                } else {
                    this.findElement.findElementNearest(0, ElementGroupDef.PVE_MONSTER);
                };
                if (this.findElement.hasAim()){
                    this.chaseElement.setAimElement(this.findElement.resElement);
                } else {
                    return (2);
                };
                return (this.setCurrentUnit(this.randomUnit()));
            };
            this.currentUnit.onTick();
            return (-1);
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

        public /*  ©init. */ function _SafeStr_720()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_720 = " NewHaveAimState3" (String#16493)


