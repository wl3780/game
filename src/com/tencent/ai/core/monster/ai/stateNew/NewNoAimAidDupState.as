// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewNoAimAidDupState

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
    import com.tencent.ai.core.monster.ai.SimpleAidDupAI;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_722;

    public class NewNoAimAidDupState implements IMonsterBrainState 
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
        protected var attackType:int;
        protected var group:int = 1;
        public var master:BaseActor = null;
        private var roamRR:int;
        protected var param:MonsterAIInfo;
        protected var checkSuicideList:Array;
        protected var checkLeisureList:Array;
        private var bTimer:int = 0;

        public function NewNoAimAidDupState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.nothingUnit = new NothingUnit();
            this.roamUnit = new RoamUnit(_arg_1);
            this.followUnit = new FollowUnit(_arg_1);
            this.leisureUnit = new LeisureUnit(_arg_1);
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
            this.followElement = _arg_1.getAIFollowElement();
            this.checkSuicideList = (_arg_1 as SimpleAidDupAI).monsterSuicideSightLines.slice();
            this.checkLeisureList = (_arg_1 as SimpleAidDupAI).monsterLeisureSightLines.slice();
            this.master = this.followElement.aimElement;
        }

        protected function randomUnit():IAIUnit
        {
            this.brain.setMonsterCurrentPosition();
            var _local_1:int = (this.followElement.aimElement.mapX - this.followElement.target.mapX);
            var _local_2:int = (this.followElement.aimElement.mapZ - this.followElement.target.mapZ);
            var _local_3:int = (_local_1 * _local_1);
            var _local_4:int = (_local_2 * _local_2);
            if ((_local_3 + _local_4) > this.followElement.followLineRR){
                if ((this.brain as SimpleAidDupAI).canShine == true){
                    this.brain.getMonster().inputActionID(99);
                    return (this.nothingUnit);
                };
                return (this.followUnit);
            };
            if (((((_local_3 + _local_4) < this.roamRR)) && (((DEFINE.RANDOM_FLOAT() * 100) < 2)))){
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
            this.attackType = _arg_1.aType;
            this.nothingUnit.lastCycles = _arg_1.durCycles;
            this.roamUnit.lastCycles = _arg_1.durCycles;
            this.roamUnit.setProbabilityRange(0, _arg_1.roamP);
            this.roamRR = (_arg_1.roamR * _arg_1.roamR);
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
            var _local_3:int;
            if (this.bTimer == 0){
                if ((DEFINE.RANDOM_FLOAT() * 10) < 5){
                    this.getBubbleDialog();
                };
            };
            this.bTimer++;
            this.bTimer = (this.bTimer % 120);
            if ((this.brain as SimpleAidDupAI).canSuicide == true){
                if (this.checkSuicideList.length > 0){
                    if (this.currentUnit != null){
                        this.currentUnit.breakUnit();
                        this.currentUnit = null;
                    };
                    this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                    (this.brain as SimpleAidDupAI).canSuicide = false;
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
            var _local_2:int;
            if (((this.findElement.hasAim()) && ((this.brain.getVigour() > 10)))){
                if (this.attackType == MonsterEnum.AT_POSITIVE){
                    this.brain.setHurtNum(0);
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
                if ((((this.attackType == MonsterEnum.AT_PASSIVE)) && ((this.brain.getHurtNum() > 0)))){
                    this.brain.setHurtNum(0);
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

        private function getBubbleDialog():void
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:BubbleDialog;
            var _local_8:Number;
            if ((((this.brain.getMonster().getModel().hp <= (0.3 * this.brain.getMonster().getModel().maxhp))) && (((DEFINE.RANDOM_FLOAT() * 2) < 1)))){
                _local_4 = (DEFINE.RANDOM_FLOAT() * 10);
                if (_local_4 <= 3){
                    this.brain.getMonster().speakBubble(AICore.data.getBubbleDialogInfo(6011).content, 1, 100);
                    return;
                };
                if ((((_local_4 > 3)) && ((_local_4 < 7)))){
                    this.brain.getMonster().speakBubble(AICore.data.getBubbleDialogInfo(6012).content, 1, 100);
                    return;
                };
                if (_local_4 >= 7){
                    this.brain.getMonster().speakBubble(AICore.data.getBubbleDialogInfo(6013).content, 1, 100);
                    return;
                };
            };
            if ((((this.brain.getVigour() <= 10)) && (((DEFINE.RANDOM_FLOAT() * 2) < 1)))){
                _local_5 = (DEFINE.RANDOM_FLOAT() * 10);
                if (_local_5 <= 3){
                    this.brain.getMonster().speakBubble(AICore.data.getBubbleDialogInfo(6001).content, 1, 100);
                    return;
                };
                if ((((_local_5 > 3)) && ((_local_5 < 7)))){
                    this.brain.getMonster().speakBubble(AICore.data.getBubbleDialogInfo(6002).content, 1, 100);
                    return;
                };
                if (_local_5 >= 7){
                    this.brain.getMonster().speakBubble(AICore.data.getBubbleDialogInfo(6003).content, 1, 100);
                    return;
                };
            };
            var _local_1:Array = this.param.bDialogId2;
            var _local_2:int = _local_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                if (_local_1[_local_3] != ""){
                    _local_6 = _local_1[_local_3];
                    _local_7 = AICore.data.getBubbleDialogInfo(_local_6);
                    if (_local_7 != null){
                        _local_8 = (DEFINE.RANDOM_FLOAT() * 10000);
                        if (_local_8 <= _local_7.randomP){
                            this.brain.getMonster().speakBubble(_local_7.content, 1, 100);
                            return;
                        };
                    };
                };
                _local_3++;
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

        public /*  ©init. */ function _SafeStr_722()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_722 = " NewNoAimAidDupState" (String#14783)


