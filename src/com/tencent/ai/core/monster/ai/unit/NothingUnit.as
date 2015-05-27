// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.NothingUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_743;

    public class NothingUnit implements IAIUnit 
    {

        protected var p0:Number;
        protected var p1:Number;
        protected var currentCycles:int;
        public var lastCycles:int = 100;


        public function run():void
        {
            this.currentCycles = this.lastCycles;
        }

        public function onTick():void
        {
            this.currentCycles = (this.currentCycles - 1);
        }

        public function breakUnit():void
        {
            this.currentCycles = 0;
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
        }

        public function canBreak():Boolean
        {
            return (true);
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
        }

        public /*  ©init. */ function _SafeStr_743()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_743 = " NothingUnit" (String#14813)


