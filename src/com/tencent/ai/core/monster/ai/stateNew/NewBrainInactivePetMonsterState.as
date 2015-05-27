// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewBrainInactivePetMonsterState

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import  ©init._SafeStr_711;

    public class NewBrainInactivePetMonsterState implements IMonsterBrainState 
    {

        protected var aiFindElement:AIFindElement;
        protected var attackType:int;
        protected var brain:IMonsterBrain;
        protected var group:int;
        protected var param:MonsterAIInfo;

        public function NewBrainInactivePetMonsterState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.aiFindElement = this.brain.getAIFindElement();
            this.group = this.brain.getGroup();
        }

        public function setAIInfo(_arg_1:MonsterAIInfo):void
        {
            this.param = _arg_1;
            this.attackType = _arg_1.aType;
        }

        public function reset():void
        {
            this.attackType = 0;
        }

        public function stateIn():void
        {
        }

        public function stateOut():void
        {
        }

        public function onThinking(_arg_1:int):int
        {
            if (this.group == ElementGroupDef.PVE_PLAYER){
                this.aiFindElement.findElementNearest(0, ElementGroupDef.PVE_MONSTER);
            } else {
                this.aiFindElement.findElementNearest(0, ElementGroupDef.PVE_PLAYER);
            };
            if (this.aiFindElement.resElement != null){
                return (1);
            };
            return (2);
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

        public /*  ©init. */ function _SafeStr_711()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_711 = " NewBrainInactivePetMonsterState" (String#17342)


