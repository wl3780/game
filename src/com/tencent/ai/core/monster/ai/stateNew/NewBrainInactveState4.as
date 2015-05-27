// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewBrainInactveState4

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.unit.XRunUnit;
    import com.tencent.ai.core.monster.ai.SimpleMonsterAI;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import  ©init._SafeStr_713;

    public class NewBrainInactveState4 implements IMonsterBrainState 
    {

        protected var attackType:int;
        protected var brain:IMonsterBrain;
        protected var group:int = 2;
        protected var param:MonsterAIInfo;
        protected var xRunUnit:XRunUnit;
        protected var checkSuicideList:Array;

        public function NewBrainInactveState4(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.xRunUnit = new XRunUnit(this.brain);
            this.checkSuicideList = (this.brain as SimpleMonsterAI).monsterSuicideSightLines.slice();
        }

        public function setAIInfo(_arg_1:MonsterAIInfo):void
        {
            this.param = _arg_1;
        }

        public function reset():void
        {
            this.attackType = 0;
        }

        public function stateIn():void
        {
            this.xRunUnit.run();
        }

        public function stateOut():void
        {
            this.xRunUnit.breakUnit();
        }

        public function onThinking(_arg_1:int):int
        {
            if (this.xRunUnit.canBreak()){
                if (this.checkSuicideList.length > 0){
                    this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                    (this.brain as SimpleMonsterAI).canSuicide = false;
                    return (-1);
                };
            };
            this.xRunUnit.onTick();
            return (-1);
        }

        public function getStateType():int
        {
            return (0);
        }

        public function getGroup():int
        {
            return (this.group);
        }

        public function setGroup(_arg_1:int):void
        {
            this.group = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_713()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_713 = " NewBrainInactveState4" (String#15056)


