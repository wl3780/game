// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.BaseAttackUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AIRunChaseElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_733;

    public class BaseAttackUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var chaseElement:AIRunChaseElement;
        protected var findElement:AIFindElement;
        private var aType:int = 0;
        private var sType:int = 0;
        protected var actionEventHandler:ActionEventHandler;
        protected var hasAttacked:Boolean = false;
        protected var movekeys:Array;

        public function BaseAttackUnit(_arg_1:IMonsterBrain)
        {
            this.movekeys = [[VKeyDef.FIGHT, VKeyDef.FIGHT_UP], [VKeyDef.JUMP, VKeyDef.JUMP_UP], [VKeyDef.BACK_JUMP, VKeyDef.JUMP_UP]];
            super();
            this.brain = _arg_1;
            this.chaseElement = _arg_1.getAIRunChaseElement();
            this.findElement = _arg_1.getAIFindElement();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        protected function attckNow():void
        {
            var _local_1:int = this.brain.getGroup();
            if (_local_1 == ElementGroupDef.PVE_MONSTER){
                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
            } else {
                this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
            };
            if (this.findElement.hasAim()){
                this.chaseElement.setAimElement(this.findElement.resElement);
            } else {
                this.breakUnit();
                return;
            };
            this.lastCycles = 90;
            this.chaseElement.setAttackParams(22500, 400);
            this.onTick();
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.currentCycles = 90;
            this.hasAttacked = false;
            this.attckNow();
        }

        public function onTick():void
        {
            var _local_1:int;
            var _local_2:Number;
            this.currentCycles = (this.currentCycles - 1);
            if (((((this.canBreak()) || ((this.isActive == false)))) || ((this.chaseElement.aimElement == null)))){
                this.breakUnit();
                return;
            };
            if (this.actionEventHandler.checkIsHurted()){
                this.brain.getMonster().inputVKey(this.movekeys[0][1]);
                this.brain.getMonster().inputVKey(this.movekeys[1][1]);
                this.brain.getMonster().inputVKey(53);
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
            if (((this.isActive) && ((this.hasAttacked == false)))){
                if (((this.chaseElement.onChasing()) && ((this.currentCycles > 0)))){
                    this.currentCycles = 5;
                    _local_1 = (this.chaseElement.aimElement.mapX - this.brain.getMonster().mapX);
                    this.brain.getMonster().setDirection((((_local_1 > 0)) ? Direction.RIGHT : Direction.LEFT));
                    _local_2 = (DEFINE.RANDOM_FLOAT() * 100);
                    if (this.actionEventHandler.checkIsJumping()){
                        this.brain.getMonster().inputVKey(this.movekeys[0][0]);
                    } else {
                        if (_local_2 < 30){
                            this.brain.getMonster().inputVKey(this.movekeys[1][0]);
                        } else {
                            if (_local_2 > 80){
                                this.brain.getMonster().inputVKey(this.movekeys[2][0]);
                            } else {
                                this.brain.getMonster().inputVKey(this.movekeys[0][0]);
                                this.hasAttacked = true;
                            };
                        };
                    };
                    return;
                };
            };
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.brain.getMonster().inputVKey(this.movekeys[0][1]);
            this.brain.getMonster().inputVKey(this.movekeys[1][1]);
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
            return (true);
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

        public /*  ©init. */ function _SafeStr_733()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_733 = " BaseAttackUnit" (String#17375)


