// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.state.TimeChaseActionState

package com.tencent.ai.core.monster.ai.state
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.monster.ai.unit.TimeChaseAttackUnit;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import  ©init._SafeStr_706;

    public class TimeChaseActionState implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var findElement:AIFindElement;
        protected var chaseElement:AIChaseElement;
        protected var currentUnit:IAIUnit;
        protected var timeChaseAttackUnit:TimeChaseAttackUnit;
        protected var group:int = 2;
        private var m_timeChaseScriptArg:TimeChaseScriptArg;

        public function TimeChaseActionState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAIChaseElement();
            this.timeChaseAttackUnit = new TimeChaseAttackUnit(_arg_1);
        }

        public function setTimeChaseAttackUnitParams(_arg_1:TimeChaseScriptArg):void
        {
            this.m_timeChaseScriptArg = _arg_1;
        }

        public function setAIInfo(_arg_1:MonsterAIInfo):void
        {
        }

        public function reset():void
        {
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
            };
            this.timeChaseAttackUnit.reset();
        }

        public function stateIn():void
        {
            if (this.group == ElementGroupDef.PVE_MONSTER){
                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
            } else {
                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
            };
            if (this.findElement.hasAim()){
                this.chaseElement.setAimElement(this.findElement.resElement);
            };
            this.currentUnit = this.timeChaseAttackUnit;
            this.timeChaseAttackUnit.addScriptParam(this.m_timeChaseScriptArg);
        }

        public function stateOut():void
        {
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
                this.currentUnit = null;
            };
        }

        public function onThinking(_arg_1:int):int
        {
            if (this.currentUnit == null){
                if (this.group == ElementGroupDef.PVE_MONSTER){
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                } else {
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                };
                if (this.findElement.hasAim()){
                    this.chaseElement.setAimElement(this.findElement.resElement);
                };
                this.currentUnit = this.timeChaseAttackUnit;
                this.timeChaseAttackUnit.addScriptParam(this.m_timeChaseScriptArg);
                return (-1);
            };
            this.currentUnit.onTick();
            return (-1);
        }

        public function getStateType():int
        {
            return (3);
        }

        public function getGroup():int
        {
            return (this.group);
        }

        public function setGroup(_arg_1:int):void
        {
            this.group = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_706()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.state

// _SafeStr_706 = " TimeChaseActionState" (String#17231)


