// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.RunAwayUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIRunAwayElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_751;

    public class RunAwayUnit implements IAIUnit 
    {

        protected var currentCycles:int = 0;
        protected var brain:IMonsterBrain;
        protected var runAwayElement:AIRunAwayElement;
        protected var findElement:AIFindElement;
        protected var isActive:Boolean = false;
        protected var scene:IScene;

        public function RunAwayUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.runAwayElement = _arg_1.getAIRunAwayElement();
            this.findElement = _arg_1.getAIFindElement();
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.scene = this.brain.getAIChaseElement().scene;
            this.currentCycles = 0;
            if (this.findElement.hasAim()){
                this.runAwayElement.setAimElement(this.findElement.resElement);
                this.currentCycles = ((DEFINE.RANDOM_FLOAT() * 90) + 90);
                this.runAwayElement.randomRunPos();
            };
        }

        public function onTick():void
        {
            if (((this.canBreak()) || ((this.isActive == false)))){
                this.breakUnit();
                return;
            };
            if (this.runAwayElement.onAvoiding()){
                this.breakUnit();
            };
            this.currentCycles = (this.currentCycles - 1);
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.runAwayElement.cancel();
            this.currentCycles = 0;
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
        }

        public function canBreak():Boolean
        {
            return ((this.currentCycles <= 0));
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
            this.currentCycles = 0;
            this.isActive = false;
        }

        public /*  ©init. */ function _SafeStr_751()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_751 = " RunAwayUnit" (String#17546)


