// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.HPAttackUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIChaseElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_740;

    public class HPAttackUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var chaseElement:AIChaseElement;
        protected var findElement:AIFindElement;
        protected var monsterAIParams:MonsterAISkillParam;
        protected var actionEventHandler:ActionEventHandler;
        protected var hasAttacked:Boolean = false;

        public function HPAttackUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.chaseElement = _arg_1.getAIChaseElement();
            this.findElement = _arg_1.getAIFindElement();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        protected function attackNow(_arg_1:MonsterAISkillParam):void
        {
            var _local_2:SkillGroup;
            var _local_3:SkillInfo;
            var _local_4:int;
            if (this.chaseElement.aimElement != null){
                this.lastCycles = _arg_1.durCycles;
                _local_2 = _arg_1.skill;
                _local_3 = _local_2.skillInfos[0];
                _local_4 = _local_3.attackDX;
                this.attackXDis2 = (_local_4 * _local_4);
                _local_4 = _local_3.attackDZ;
                this.attackZDis2 = (_local_4 * _local_4);
                this.actionID = _local_2.actionID;
                this.chaseElement.setAttackParams(this.attackXDis2, this.attackZDis2);
                this.onTick();
            };
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.currentCycles = 9000;
            this.hasAttacked = false;
            this.attackNow(this.monsterAIParams);
        }

        public function onTick():void
        {
            this.currentCycles = (this.currentCycles - 1);
            if (((this.canBreak()) || ((this.isActive == false)))){
                this.breakUnit();
                return;
            };
            if (((this.actionEventHandler.checkTheId()) && ((this.hasAttacked == false)))){
                this.currentCycles = 5;
                this.brain.getMonster().inputActionID(this.actionID);
                this.getBubbleDialog();
                this.hasAttacked = true;
                return;
            };
            if ((((((this.hasAttacked == true)) && (this.actionEventHandler.checkTheId()))) && ((this.currentCycles <= 0)))){
                this.breakUnit();
                return;
            };
            if ((((this.hasAttacked == false)) && ((this.currentCycles <= 0)))){
                this.breakUnit();
                return;
            };
        }

        private function getBubbleDialog():void
        {
            var _local_4:int;
            var _local_5:BubbleDialog;
            var _local_6:Number;
            var _local_1:Array = this.monsterAIParams.bDialogId;
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

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
            this.monsterAIParams = _arg_1;
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.currentCycles = 0;
            this.chaseElement.cancel();
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
            this.chaseElement.cancel();
        }

        public /*  ©init. */ function _SafeStr_740()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_740 = " HPAttackUnit" (String#17084)


