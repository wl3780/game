// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.TimeChaseAttackUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_752;

    public class TimeChaseAttackUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var chaseElement:AIChaseElement;
        protected var findElement:AIFindElement;
        protected var monsterAIParams:MonsterAISkillParam;
        protected var actionEventHandler:ActionEventHandler;
        protected var hasAttacked:Boolean = false;

        public function TimeChaseAttackUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.chaseElement = _arg_1.getAIChaseElement();
            this.findElement = _arg_1.getAIFindElement();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
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

        protected function attackNow(_arg_1:MonsterAISkillParam):void
        {
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
            this.monsterAIParams = _arg_1;
        }

        public function addScriptParam(_arg_1:TimeChaseScriptArg):void
        {
            this.currentCycles = _arg_1.moveTime;
            var _local_2:int = _arg_1.attackX;
            this.attackXDis2 = (_local_2 * _local_2);
            _local_2 = _arg_1.attackZ;
            this.attackZDis2 = (_local_2 * _local_2);
            this.actionID = _arg_1.actionID;
            this.chaseElement.setAttackParams(this.attackXDis2, this.attackZDis2);
            this.hasAttacked = false;
            this.run();
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
        }

        public function onTick():void
        {
            if (((this.canBreak()) || ((this.isActive == false)))){
                this.breakUnit();
                return;
            };
            var _local_1:int = this.brain.getGroup();
            if (_local_1 == ElementGroupDef.PVE_MONSTER){
                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
            } else {
                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
            };
            if (this.findElement.hasAim()){
                this.chaseElement.setAimElement(this.findElement.resElement);
            };
            if (this.currentCycles <= 0){
                this.currentCycles = 5;
                this.brain.getMonster().inputActionID(this.actionID);
                return;
            };
            if (this.chaseElement.onChasing2()){
                this.currentCycles = 5;
                this.brain.getMonster().inputActionID(this.actionID);
                return;
            };
            this.currentCycles = (this.currentCycles - 1);
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.hasAttacked = true;
            this.currentCycles = 0;
            this.chaseElement.cancel();
        }

        public function canBreak():Boolean
        {
            return (this.hasAttacked);
        }

        public function setProbabilityRange(_arg_1:Number, _arg_2:Number):void
        {
        }

        public function isProbability(_arg_1:Number):Boolean
        {
            return (false);
        }

        public function getUnitType():int
        {
            return (AIUnitType.ATTACK);
        }

        public function reset():void
        {
            this.isActive = false;
            this.currentCycles = 0;
            this.hasAttacked = false;
            this.chaseElement.cancel();
        }

        public /*  ©init. */ function _SafeStr_752()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_752 = " TimeChaseAttackUnit" (String#16325)


