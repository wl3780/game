// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.FollowUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIFollowElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_738;

    public class FollowUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var attackYDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var followElement:AIFollowElement;
        private var hasmoved:Boolean = false;
        protected var findElement:AIFindElement;
        protected var monsterAIParams:MonsterAISkillParam;

        public function FollowUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.followElement = _arg_1.getAIFollowElement();
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
            this.onTick();
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
            this.monsterAIParams = _arg_1;
        }

        public function run():void
        {
            this.hasmoved = false;
            this.currentCycles = 120;
            this.followElement.setAimElement(this.brain.getMaster());
            this.moveNow();
        }

        public function onTick():void
        {
            this.currentCycles = (this.currentCycles - 1);
            if ((((this.followElement.aimElement == null)) || (this.followElement.aimElement.getIsDead()))){
                this.breakUnit();
            };
            if (this.followElement.onChasing()){
                this.breakUnit();
            };
        }

        public function breakUnit():void
        {
            this.currentCycles = 0;
            this.followElement.cancel();
            this.hasmoved = true;
        }

        public function canBreak():Boolean
        {
            return (((this.hasmoved) || ((this.currentCycles <= 0))));
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
            this.followElement.cancel();
        }

        public /*  ©init. */ function _SafeStr_738()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_738 = " FollowUnit" (String#17183)


