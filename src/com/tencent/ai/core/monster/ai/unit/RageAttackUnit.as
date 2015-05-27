// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.RageAttackUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_744;

    public class RageAttackUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var lastCycles:int = 0;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var findElement:AIFindElement;
        protected var monsterAIParams:MonsterAISkillParam;
        protected var actionEventHandler:ActionEventHandler;
        protected var hasAttacked:Boolean = false;
        protected var param:MonsterAISkillParam;

        public function RageAttackUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.findElement = _arg_1.getAIFindElement();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
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

        protected function attackNow(_arg_1:MonsterAISkillParam):void
        {
            this.param = _arg_1;
            var _local_2:SkillGroup = _arg_1.skill;
            var _local_3:SkillInfo = _local_2.skillInfos[0];
            var _local_4:int = _local_3.attackDX;
            this.attackXDis2 = (_local_4 * _local_4);
            _local_4 = _local_3.attackDZ;
            this.attackZDis2 = (_local_4 * _local_4);
            this.actionID = _local_2.actionID;
            this.onTick();
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
            this.attackNow(this.monsterAIParams);
            this.currentCycles = 150;
            this.hasAttacked = false;
            this.onTick();
        }

        public function onTick():void
        {
            var _local_1:int;
            this.currentCycles = (this.currentCycles - 1);
            if (((this.canBreak()) || ((this.isActive == false)))){
                this.breakUnit();
                return;
            };
            if (this.hasAttacked == false){
                this.currentCycles = 5;
                if (this.findElement.resElement != null){
                    _local_1 = (this.findElement.resElement.mapX - this.brain.getMonster().mapX);
                    this.brain.getMonster().setDirection((((_local_1 > 0)) ? Direction.RIGHT : Direction.LEFT));
                };
                this.brain.getMonster().inputActionID(this.actionID);
                this.getBubbleDialog();
                this.hasAttacked = true;
                return;
            };
            if ((((this.hasAttacked == true)) && (this.actionEventHandler.checkTheId()))){
                this.breakUnit();
                return;
            };
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
                            this.brain.getMonster().speakBubble(_local_5.content, 1, 100);
                            return;
                        };
                    };
                };
                _local_3++;
            };
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.currentCycles = 0;
        }

        public function canBreak():Boolean
        {
            if (this.hasAttacked == false){
                return ((this.currentCycles <= 0));
            };
            return (((this.actionEventHandler.checkTheId()) && ((this.currentCycles <= 0))));
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
            return (AIUnitType.ATTACK);
        }

        public function reset():void
        {
            this.isActive = false;
            this.currentCycles = 0;
        }

        public /*  ©init. */ function _SafeStr_744()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_744 = " RageAttackUnit" (String#15215)


