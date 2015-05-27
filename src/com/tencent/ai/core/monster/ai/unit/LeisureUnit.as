// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.LeisureUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_742;

    public class LeisureUnit implements IAIUnit 
    {

        protected var p0:Number;
        protected var p1:Number;
        protected var actionID:int;
        public var lastCycles:int = 100;
        protected var isActive:Boolean = false;
        protected var hasAttacked:Boolean = false;
        protected var currentCycles:int;
        protected var monsterAIParams:MonsterAISkillParam;
        protected var brain:IMonsterBrain;
        protected var actionEventHandler:ActionEventHandler;
        protected var param:MonsterAISkillParam;

        public function LeisureUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        protected function attackNow(_arg_1:MonsterAISkillParam):void
        {
            this.param = _arg_1;
            var _local_2:SkillGroup = _arg_1.skill;
            var _local_3:SkillInfo = _local_2.skillInfos[0];
            this.actionID = _local_2.actionID;
            this.brain.getMonster().inputActionID(this.actionID);
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.attackNow(this.monsterAIParams);
            this.currentCycles = 150;
            this.hasAttacked = true;
        }

        public function onTick():void
        {
            this.currentCycles = (this.currentCycles - 1);
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.currentCycles = 0;
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
            this.monsterAIParams = _arg_1;
        }

        public function canBreak():Boolean
        {
            return (this.actionEventHandler.checkTheId());
        }

        public function setProbabilityRange(_arg_1:Number, _arg_2:Number):void
        {
            this.p0 = _arg_1;
            this.p1 = _arg_2;
        }

        public function isProbability(_arg_1:Number):Boolean
        {
            return ((((_arg_1 >= this.p0)) && ((_arg_1 < this.p1))));
        }

        public function getUnitType():int
        {
            return (AIUnitType.NOTHING);
        }

        public function reset():void
        {
            this.isActive = false;
            this.currentCycles = 0;
        }

        public /*  ©init. */ function _SafeStr_742()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_742 = " LeisureUnit" (String#15620)


