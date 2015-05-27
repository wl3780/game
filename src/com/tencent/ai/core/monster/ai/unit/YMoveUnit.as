// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.YMoveUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIYMoveElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_757;

    public class YMoveUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var attackYDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var moveElement:AIYMoveElement;
        private var hasmoved:Boolean = false;
        protected var findElement:AIFindElement;
        protected var monsterAIParams:MonsterAISkillParam;

        public function YMoveUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.moveElement = _arg_1.getAIYMoveElement();
            this.findElement = _arg_1.getAIFindElement();
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

        protected function moveNow():void
        {
            var _local_1:Array = this.brain.getYPosArray();
            this.moveElement.setAttackParams(_local_1[1]);
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
            this.monsterAIParams = _arg_1;
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.hasmoved = false;
            this.currentCycles = 150;
            this.moveNow();
        }

        public function onTick():void
        {
            if (((this.canBreak()) || ((this.isActive == false)))){
                this.breakUnit();
                return;
            };
            this.currentCycles = (this.currentCycles - 1);
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.currentCycles = 0;
            this.moveElement.cancel();
        }

        public function canBreak():Boolean
        {
            return (((this.moveElement.onMoving()) || ((this.currentCycles <= 0))));
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
            this.moveElement.cancel();
        }

        public /*  ©init. */ function _SafeStr_757()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_757 = " YMoveUnit" (String#15281)


