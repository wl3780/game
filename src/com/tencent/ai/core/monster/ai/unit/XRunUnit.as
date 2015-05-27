// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.XRunUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIXRunElement;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_756;

    public class XRunUnit 
    {

        protected var brain:IMonsterBrain;
        protected var isActive:Boolean = false;
        protected var runElement:AIXRunElement;
        protected var actionEventHandler:ActionEventHandler;
        protected var aiSkills:Array;
        private var hasmoved:Boolean = true;
        private var hasAttacked:Boolean = false;
        private var timer:int = 0;

        public function XRunUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            if (_arg_1.getMonsterAIInfo().aType == 1){
                _arg_1.getMonster().setDirection(Direction.LEFT);
            };
            this.runElement = _arg_1.getAIXRunElement();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.hasmoved = false;
            this.hasAttacked = false;
            if (this.brain.getMonsterAIInfo().aType == 1){
                this.brain.getMonster().setDirection(Direction.LEFT);
            };
            this.timer = 0;
        }

        public function onTick():void
        {
            var _local_1:MonsterAISkillParam;
            if (this.brain.getMonsterAIInfo().aType == 1){
                this.brain.getMonster().setDirection(Direction.LEFT);
            };
            this.timer++;
            if (this.hasAttacked){
                return;
            };
            this.aiSkills = this.brain.getMonsterSightlines();
            if (((((!((this.aiSkills == null))) && ((this.aiSkills.length > 0)))) && ((this.timer > 2)))){
                _local_1 = this.aiSkills[0][0];
                this.brain.getMonster().inputActionID(_local_1.skill.actionID);
                this.hasAttacked = true;
            };
            if (this.actionEventHandler.checkTheId()){
                this.run();
            };
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.runElement.cancel();
        }

        public function canBreak():Boolean
        {
            if (this.hasmoved){
                return (false);
            };
            return (this.runElement.onMoving());
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
            return (AIUnitType.ROAM);
        }

        public function reset():void
        {
            this.isActive = false;
            this.runElement.cancel();
            this.hasmoved = true;
            this.hasAttacked = false;
        }

        public /*  ©init. */ function _SafeStr_756()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_756 = " XRunUnit" (String#14936)


