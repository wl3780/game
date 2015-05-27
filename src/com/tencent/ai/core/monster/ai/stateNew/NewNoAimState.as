// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewNoAimState

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.YMoveUnit;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.unit.LeisureUnit;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.SimpleMonsterAI;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_727;

    public class NewNoAimState implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var nothingUnit:NothingUnit;
        protected var yMoveUnit:YMoveUnit;
        protected var roamUnit:RoamUnit;
        protected var leisureUnit:LeisureUnit;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var currentUnit:IAIUnit;
        protected var currentSight:int = 0;
        protected var changedSightTime:int = 100;
        protected var group:int = 2;
        protected var param:MonsterAIInfo;
        private var dialogTime:int = 1;
        protected var checkSuicideList:Array;
        protected var checkLeisureList:Array;

        public function NewNoAimState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.nothingUnit = new NothingUnit();
            this.roamUnit = new RoamUnit(_arg_1);
            this.yMoveUnit = new YMoveUnit(_arg_1);
            this.leisureUnit = new LeisureUnit(_arg_1);
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
            this.checkSuicideList = (_arg_1 as SimpleMonsterAI).monsterSuicideSightLines.slice();
            this.checkLeisureList = (_arg_1 as SimpleMonsterAI).monsterLeisureSightLines.slice();
        }

        protected function randomUnit():IAIUnit
        {
            this.brain.setMonsterCurrentPosition();
            var _local_1:Number = (DEFINE.RANDOM_FLOAT() * 80);
            if (((this.findElement.isFlyMonster) && ((_local_1 > 76)))){
                return (this.yMoveUnit);
            };
            if (_local_1 < (this.brain.getMonsterAIInfo().roamP * 10)){
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
            this.yMoveUnit.reset();
            this.roamUnit.reset();
        }

        public function stateIn():void
        {
            this.changedSightTime = 100;
            this.currentSight = this.chaseElement.chasetRR;
            this.setCurrentUnit(this.randomUnit());
            this.dialogTime = 1;
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
                if (this.findElement.resElement != null){
                    _local_2 = (this.findElement.resElement.mapX - this.brain.getMonster().mapX);
                    this.brain.getMonster().setDirection((((_local_2 > 0)) ? Direction.RIGHT : Direction.LEFT));
                };
                if (this.dialogTime > 100){
                    this.getBubbleDialog(1);
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
            this.dialogTime++;
            this.dialogTime = (this.dialogTime % 300);
            if (this.dialogTime == 0){
                this.getBubbleDialog(2);
            };
            return (-1);
        }

        private function getBubbleDialog(_arg_1:int=1):void
        {
            var _local_5:int;
            var _local_6:BubbleDialog;
            var _local_7:Number;
            var _local_2:Array = this.param.bDialogId2;
            if (_arg_1 == 1){
                _local_2 = this.param.bDialogId;
            } else {
                _local_2 = this.param.bDialogId2;
            };
            var _local_3:int = _local_2.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                if (_local_2[_local_4] != ""){
                    _local_5 = _local_2[_local_4];
                    _local_6 = AICore.data.getBubbleDialogInfo(_local_5);
                    if (_local_6 != null){
                        _local_7 = (DEFINE.RANDOM_FLOAT() * 10000);
                        if (_local_7 <= _local_6.randomP){
                            this.brain.getMonster().speakBubble(_local_6.content, 1, 100);
                            return;
                        };
                    };
                };
                _local_4++;
            };
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

        public /*  ©init. */ function _SafeStr_727()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_727 = " NewNoAimState" (String#15845)


