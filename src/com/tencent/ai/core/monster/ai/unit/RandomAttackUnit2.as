// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.RandomAttackUnit2

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIZChaseElement;
    import com.tencent.ai.core.monster.ai.AIAvoidElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_748;

    public class RandomAttackUnit2 implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var aiSkills:Array;
        protected var chaseElement:AIZChaseElement;
        protected var avoidElement:AIAvoidElement;
        protected var findElement:AIFindElement;
        private var aType:int = 0;
        private var sType:int = 0;
        protected var actionEventHandler:ActionEventHandler;
        protected var hasAttacked:Boolean = false;

        public function RandomAttackUnit2(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.chaseElement = _arg_1.getAIZChaseElement();
            this.avoidElement = _arg_1.getAIAvoidElement();
            this.findElement = _arg_1.getAIFindElement();
            this.aiSkills = [];
            this.aiSkills = _arg_1.getMonsterSightlines();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        protected function randomSkillParam():MonsterAISkillParam
        {
            var _local_21:Number;
            var _local_22:Number;
            var _local_23:Number;
            var _local_24:Array;
            var _local_25:Number;
            var _local_1:int = this.chaseElement.aimElement.mapX;
            var _local_2:int = this.chaseElement.aimElement.mapZ;
            var _local_3:int = (_local_1 - this.brain.getMonster().mapX);
            var _local_4:int = (_local_2 - this.brain.getMonster().mapZ);
            var _local_5:int = (_local_3 * _local_3);
            var _local_6:int = (_local_4 * _local_4);
            var _local_7:int = this.aiSkills.length;
            var _local_8:Number = (1 / _local_7);
            var _local_9:int;
            var _local_10:Array = new Array();
            var _local_11:Array = new Array();
            var _local_12:Array = new Array();
            var _local_13:Array = new Array();
            var _local_14:int;
            _local_14 = 0;
            while (_local_14 < _local_7) {
                _local_9 = (_local_9 + this.aiSkills[_local_14][4]);
                if (((this.xClose(this.aiSkills[_local_14][1], _local_5)) && (this.zClose(this.aiSkills[_local_14][2], _local_6)))){
                    _local_10.push(_local_8);
                } else {
                    _local_10.push(0);
                };
                _local_14++;
            };
            _local_14 = 0;
            _local_14 = 0;
            while (_local_14 < _local_7) {
                _local_21 = (this.aiSkills[_local_14][4] / _local_9);
                _local_11.push(_local_21);
                _local_14++;
            };
            var _local_15:int = this.brain.getMonsterAIInfo().monsterIQ;
            _local_14 = 0;
            _local_14 = 0;
            while (_local_14 < _local_7) {
                _local_22 = ((_local_10[_local_14] + _local_11[_local_14]) - ((_local_10[_local_14] + _local_11[_local_14]) / _local_15));
                _local_12.push(_local_22);
                _local_14++;
            };
            _local_14 = 0;
            _local_14 = 0;
            while (_local_14 < _local_7) {
                _local_23 = (_local_12[_local_14] + this.aiSkills[_local_14][3]);
                _local_13.push(_local_23);
                _local_14++;
            };
            var _local_16:Number = 0;
            _local_14 = 0;
            _local_14 = 0;
            while (_local_14 < _local_7) {
                _local_16 = (_local_16 + _local_13[_local_14]);
                _local_14++;
            };
            var _local_17:Array = new Array();
            var _local_18:Number = 0;
            var _local_19:Number = 0;
            _local_14 = 0;
            _local_14 = 0;
            while (_local_14 < _local_7) {
                _local_24 = new Array();
                _local_24.push(this.aiSkills[_local_14][0]);
                _local_18 = _local_19;
                _local_25 = (_local_13[_local_14] / _local_16);
                _local_19 = (_local_18 + _local_25);
                _local_24.push(_local_18);
                _local_24.push(_local_19);
                _local_17.push(_local_24);
                _local_14++;
            };
            var _local_20:Number = DEFINE.RANDOM_FLOAT();
            _local_14 = 0;
            _local_14 = 0;
            while (_local_14 < _local_17.length) {
                if ((((_local_17[_local_14][1] <= _local_20)) && ((_local_20 < _local_17[_local_14][2])))){
                    return (_local_17[_local_14][0]);
                };
                _local_14++;
            };
            return (_local_17[0][0]);
        }

        protected function xClose(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int = (_arg_1 * _arg_1);
            if (_local_3 >= _arg_2){
                return (true);
            };
            return (false);
        }

        protected function zClose(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int = (_arg_1 * _arg_1);
            if (_local_3 >= _arg_2){
                return (true);
            };
            return (false);
        }

        protected function attckNow():void
        {
            var _local_1:MonsterAISkillParam = this.randomSkillParam();
            this.aType = _local_1.aType;
            this.sType = _local_1.sType;
            var _local_2:Boolean;
            var _local_3:int = this.brain.getGroup();
            if (this.aType == 0){
                if (_local_3 == ElementGroupDef.PVE_MONSTER){
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                } else {
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                };
                if (this.findElement.hasAim()){
                    this.chaseElement.setAimElement(this.findElement.resElement);
                } else {
                    this.breakUnit();
                    return;
                };
            } else {
                if (this.aType == 1){
                    if (_local_3 == ElementGroupDef.PVE_MONSTER){
                        this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                    } else {
                        this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                    };
                    if (this.findElement.hasAim()){
                        this.avoidElement.setAimElement(this.findElement.resElement);
                    } else {
                        this.breakUnit();
                        return;
                    };
                };
            };
            this.lastCycles = _local_1.durCycles;
            var _local_4:SkillGroup = _local_1.skill;
            var _local_5:SkillInfo = _local_4.skillInfos[0];
            var _local_6:int = _local_5.attackDX;
            this.attackXDis2 = (_local_6 * _local_6);
            _local_6 = _local_5.attackDZ;
            this.attackZDis2 = (_local_6 * _local_6);
            this.actionID = _local_4.actionID;
            if (this.aType == 0){
                this.chaseElement.setAttackParams(this.attackXDis2, this.attackZDis2);
            } else {
                this.avoidElement.setAttackParams(this.attackXDis2, this.attackZDis2);
            };
            this.onTick();
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.currentCycles = 90;
            this.hasAttacked = false;
            if (this.chaseElement.aimElement != null){
                this.attckNow();
            };
        }

        public function onTick():void
        {
            this.currentCycles = (this.currentCycles - 1);
            if (((((this.canBreak()) || ((this.isActive == false)))) || ((this.chaseElement.aimElement == null)))){
                this.breakUnit();
                return;
            };
            if (((this.isActive) && ((this.aType == 0)))){
                if (((((this.chaseElement.onChasing()) && ((this.currentCycles > 0)))) && ((this.hasAttacked == false)))){
                    this.currentCycles = 5;
                    this.brain.getMonster().inputActionID(this.actionID);
                    this.hasAttacked = true;
                    return;
                };
            } else {
                if (((this.isActive) && ((this.aType == 1)))){
                    if (((((this.avoidElement.onAvoiding()) && ((this.currentCycles > 0)))) && ((this.hasAttacked == false)))){
                        this.currentCycles = 5;
                        this.brain.getMonster().inputActionID(this.actionID);
                        this.hasAttacked = true;
                        return;
                    };
                };
            };
            if ((((((this.hasAttacked == true)) && (this.actionEventHandler.checkTheId()))) && ((this.currentCycles <= 0)))){
                this.breakUnit();
                return;
            };
            if ((((this.hasAttacked == false)) && ((this.currentCycles <= 0)))){
                this.breakUnit();
                return;
            };
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.currentCycles = 0;
            this.chaseElement.cancel();
            this.avoidElement.cancel();
        }

        public function canBreak():Boolean
        {
            if (this.hasAttacked == false){
                return ((this.currentCycles <= 0));
            };
            return (((this.actionEventHandler.checkTheId()) && ((this.currentCycles <= 0))));
        }

        public function setProbabilityRange(_arg_1:Number, _arg_2:Number):void
        {
        }

        public function isProbability(_arg_1:Number):Boolean
        {
            return (true);
        }

        public function getUnitType():int
        {
            return (AIUnitType.ATTACK);
        }

        public function reset():void
        {
            this.aiSkills.length = 0;
            this.isActive = false;
            this.currentCycles = 0;
            this.chaseElement.cancel();
            this.avoidElement.cancel();
        }

        public /*  ©init. */ function _SafeStr_748()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_748 = " RandomAttackUnit2" (String#16334)


