// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewNoAimAPCState

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.unit.FollowUnit;
    import com.tencent.ai.core.monster.ai.AIFollowElement;
    import com.tencent.ai.core.monster.ai.unit.LeisureUnit;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.monster.ai.SimpleAPCAI;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_724;

    public class NewNoAimAPCState implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var nothingUnit:NothingUnit;
        protected var roamUnit:RoamUnit;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var followUnit:FollowUnit;
        protected var followElement:AIFollowElement;
        protected var leisureUnit:LeisureUnit;
        protected var currentUnit:IAIUnit;
        protected var currentSight:int = 0;
        protected var changedSightTime:int = 100;
        protected var group:int = 1;
        public var master:BaseActor = null;
        protected var checkSuicideList:Array;
        protected var checkLeisureList:Array;
        protected var param:MonsterAIInfo;
        protected var actionEventHandler:ActionEventHandler;
        protected var movekeys:Array;

        public function NewNoAimAPCState(_arg_1:IMonsterBrain)
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT]];
            super();
            this.brain = _arg_1;
            this.nothingUnit = new NothingUnit();
            this.roamUnit = new RoamUnit(_arg_1);
            this.followUnit = new FollowUnit(_arg_1);
            this.leisureUnit = new LeisureUnit(_arg_1);
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
            this.followElement = _arg_1.getAIFollowElement();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
            this.checkSuicideList = (_arg_1 as SimpleAPCAI).monsterSuicideSightLines.slice();
            this.checkLeisureList = (_arg_1 as SimpleAPCAI).monsterLeisureSightLines.slice();
        }

        protected function randomUnit():IAIUnit
        {
            if (!this.followElement.hasAim()){
                return (this.nothingUnit);
            };
            this.brain.setMonsterCurrentPosition();
            var _local_1:int = (this.followElement.aimElement.mapX - this.followElement.target.mapX);
            var _local_2:int = (this.followElement.aimElement.mapZ - this.followElement.target.mapZ);
            var _local_3:int = (_local_1 * _local_1);
            var _local_4:int = (_local_2 * _local_2);
            if ((_local_3 + _local_4) > 90000){
                return (this.followUnit);
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
            if (this.actionEventHandler.checkIsHurted()){
                this.brain.getMonster().inputVKey(this.movekeys[0][1]);
                this.brain.getMonster().inputVKey(this.movekeys[1][1]);
                this.brain.getMonster().inputVKey(this.movekeys[2][1]);
                this.brain.getMonster().inputVKey(this.movekeys[3][1]);
            };
            if (!this.followElement.hasAim()){
                if (this.param.aType == 4){
                    return (-1);
                };
                if (this.currentUnit == this.followUnit){
                    this.brain.setMonsterCurrentPosition();
                    this.currentUnit.breakUnit();
                };
            };
            if (this.brain.getHurtNum() > 0){
                this.brain.setHurtNum(0);
                if (this.currentUnit != null){
                    this.currentUnit.breakUnit();
                };
            };
            if ((this.brain as SimpleAPCAI).canSuicide == true){
                if (this.checkSuicideList.length > 0){
                    if (this.currentUnit != null){
                        this.currentUnit.breakUnit();
                        this.currentUnit = null;
                    };
                    this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                    (this.brain as SimpleAPCAI).canSuicide = false;
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
            if (this.group == ElementGroupDef.PVE_PLAYER){
                this.findElement.findElementNearest(this.currentSight, ElementGroupDef.PVE_MONSTER);
            } else {
                this.findElement.findElementNearest(this.currentSight, ElementGroupDef.PVE_PLAYER);
            };
            if (((this.findElement.hasAim()) && (!((this.param.aType == MonsterEnum.AT_PASSIVE))))){
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

        public /*  ©init. */ function _SafeStr_724()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_724 = " NewNoAimAPCState" (String#15035)


