// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.BubbleDialogUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.enum.AIUnitType;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import  ©init._SafeStr_736;

    public class BubbleDialogUnit implements IAIUnit 
    {

        protected var brain:IMonsterBrain;
        protected var isActive:Boolean = false;
        protected var dalogData:String = "";

        public function BubbleDialogUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.brain.getMonster().speakBubble(this.dalogData);
        }

        public function onTick():void
        {
        }

        public function breakUnit():void
        {
        }

        public function canBreak():Boolean
        {
            return (true);
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
            return (AIUnitType.NOTHING);
        }

        public function reset():void
        {
            this.isActive = false;
        }

        public function setDalogData(_arg_1:String):void
        {
            this.dalogData = _arg_1;
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
        }

        public /*  ©init. */ function _SafeStr_736()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_736 = " BubbleDialogUnit" (String#14702)


