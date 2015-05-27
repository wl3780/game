// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.state.BrainInactiveState

package com.tencent.ai.core.monster.ai.state
{
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.SimpleMonsterAI;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_693;

    public class BrainInactiveState implements IMonsterBrainState 
    {

        protected var aiFindElement:AIFindElement;
        protected var attackType:int;
        protected var brain:IMonsterBrain;
        protected var group:int = 2;
        protected var param:MonsterAIInfo;
        protected var checkSuicideList:Array;

        public function BrainInactiveState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.checkSuicideList = (this.brain as SimpleMonsterAI).monsterSuicideSightLines.slice();
            this.aiFindElement = this.brain.getAIFindElement();
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
            if ((this.brain as SimpleMonsterAI).canSuicide == true){
                if (this.checkSuicideList.length > 0){
                    this.brain.getMonster().inputVKey((this.checkSuicideList[0] as MonsterAISkillParam).skill.actionID);
                    (this.brain as SimpleMonsterAI).canSuicide = false;
                    return (-1);
                };
            };
            if (this.attackType == MonsterEnum.AT_POSITIVE){
                if (this.group == ElementGroupDef.PVE_MONSTER){
                    this.aiFindElement.findElementNearest(0, ElementGroupDef.PVE_PLAYER);
                } else {
                    this.aiFindElement.findElementNearest(0, ElementGroupDef.PVE_MONSTER);
                };
                if (this.aiFindElement.resElement != null){
                    return (1);
                };
                return (2);
            };
            return (-1);
        }

        private function getBubbleDialog():void
        {
            var _local_4:int;
            var _local_5:BubbleDialog;
            var _local_6:Number;
            var _local_1:Array = this.param.bDialogId;
            var _local_2:int = _local_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                if (_local_1[_local_3] != ""){
                    _local_4 = _local_1[_local_3];
                    _local_5 = AICore.data.getBubbleDialogInfo(_local_4);
                    if (_local_5 != null){
                        _local_6 = (DEFINE.RANDOM_FLOAT() * 10000);
                        if (_local_6 <= _local_5.randomP){
                            this.brain.getMonster().speakBubble(_local_5.content);
                            return;
                        };
                    };
                };
                _local_3++;
            };
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

        public /*  ©init. */ function _SafeStr_693()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.state

// _SafeStr_693 = " BrainInactiveState" (String#16958)


