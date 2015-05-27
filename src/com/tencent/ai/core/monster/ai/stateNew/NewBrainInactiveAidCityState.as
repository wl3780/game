// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.stateNew.NewBrainInactiveAidCityState

package com.tencent.ai.core.monster.ai.stateNew
{
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_707;

    public class NewBrainInactiveAidCityState implements IMonsterBrainState 
    {

        protected var attackType:int;
        protected var brain:IMonsterBrain;
        protected var group:int = 1;
        protected var param:MonsterAIInfo;

        public function NewBrainInactiveAidCityState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
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
            this.getBubbleDialog();
        }

        public function stateOut():void
        {
        }

        public function onThinking(_arg_1:int):int
        {
            return (1);
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

        public /*  ©init. */ function _SafeStr_707()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.stateNew

// _SafeStr_707 = " NewBrainInactiveAidCityState" (String#14486)


