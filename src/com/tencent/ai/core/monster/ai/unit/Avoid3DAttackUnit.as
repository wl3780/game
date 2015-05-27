﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.Avoid3DAttackUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.AI3DAvoidElement;
    import com.tencent.ai.core.monster.ai.AIFindElement;
    import com.tencent.ai.core.monster.ai.AI3DChaseElement;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.free.logging.debug;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_731;

    public class Avoid3DAttackUnit implements IAIUnit 
    {

        protected var actionID:int;
        protected var attackXDis2:int;
        protected var attackZDis2:int;
        protected var attackYDis2:int;
        protected var lastCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentCycles:int;
        protected var isActive:Boolean = false;
        protected var aiSkills:Array;
        protected var avoidElement:AI3DAvoidElement;
        protected var findElement:AIFindElement;
        protected var chaseElement:AI3DChaseElement;
        protected var actionEventHandler:ActionEventHandler;
        protected var hasAttacked:Boolean = false;
        protected var param:MonsterAISkillParam;

        public function Avoid3DAttackUnit(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.avoidElement = _arg_1.getAI3DAvoidElement();
            this.findElement = _arg_1.getAIFindElement();
            this.chaseElement = _arg_1.getAI3DChaseElement();
            this.aiSkills = [];
            this.aiSkills = _arg_1.getMonsterSightlines();
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        protected function randomSkillParam():MonsterAISkillParam
        {
            var _local_1:int = this.aiSkills.length;
            var _local_2:MonsterAISkillParam = this.aiSkills[0][0];
            var _local_3:int;
            var _local_4:int;
            _local_3 = 0;
            while (_local_3 < _local_1) {
                if (this.aiSkills[_local_3][1] > _local_4){
                    _local_4 = this.aiSkills[_local_3][1];
                    _local_2 = this.aiSkills[_local_3][0];
                };
                _local_3++;
            };
            return (_local_2);
        }

        protected function attckNow():void
        {
            this.param = this.randomSkillParam();
            var _local_1:int = this.param.aType;
            var _local_2:int = this.param.sType;
            var _local_3:Boolean;
            var _local_4:int = this.brain.getGroup();
            if (_local_1 == 0){
                if (_local_4 == ElementGroupDef.PVE_MONSTER){
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                } else {
                    this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                };
                if (this.findElement.hasAim()){
                    this.avoidElement.setAimElement(this.findElement.resElement);
                } else {
                    this.breakUnit();
                    return;
                };
            } else {
                if (_local_1 == 1){
                    if (_local_4 == ElementGroupDef.PVE_MONSTER){
                        this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_MONSTER);
                    } else {
                        this.findElement.findElementNearest(this.chaseElement.chasetRR, ElementGroupDef.PVE_PLAYER);
                    };
                    if (this.findElement.hasAim()){
                        this.avoidElement.setAimElement(this.findElement.resElement);
                    } else {
                        this.breakUnit();
                        return;
                    };
                };
            };
            this.lastCycles = this.param.durCycles;
            var _local_5:SkillGroup = this.param.skill;
            var _local_6:SkillInfo = _local_5.skillInfos[0];
            var _local_7:int = _local_6.attackDX;
            this.attackXDis2 = _local_7;
            _local_7 = _local_6.attackDZ;
            this.attackZDis2 = _local_7;
            _local_7 = _local_6.attackDY;
            this.attackYDis2 = (_local_7 * _local_7);
            this.actionID = _local_5.actionID;
            var _local_8:Array = this.brain.getYPosArray();
            this.avoidElement.setAttackParams(this.attackXDis2, this.attackZDis2, this.attackYDis2, _local_8[this.param.yPos]);
            this.onTick();
        }

        public function addAISkillParam(_arg_1:MonsterAISkillParam):void
        {
        }

        public function run():void
        {
            debug("[Avoid3DAttackUnit] 进入立体躲避状态");
            if (this.isActive){
                return;
            };
            this.isActive = true;
            if (this.avoidElement.aimElement != null){
                this.attckNow();
            };
            this.currentCycles = 150;
            this.hasAttacked = false;
        }

        public function onTick():void
        {
            var _local_1:int;
            this.currentCycles = (this.currentCycles - 1);
            if (((((this.canBreak()) || ((this.isActive == false)))) || ((this.avoidElement.aimElement == null)))){
                this.breakUnit();
                return;
            };
            if (((((this.avoidElement.onAvoiding()) && ((this.currentCycles > 0)))) && ((this.hasAttacked == false)))){
                this.currentCycles = 5;
                _local_1 = (this.avoidElement.aimElement.mapX - this.brain.getMonster().mapX);
                this.brain.getMonster().setDirection((((_local_1 > 0)) ? Direction.RIGHT : Direction.LEFT));
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
            this.avoidElement.cancel();
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
            this.aiSkills.length = 0;
            this.isActive = false;
            this.currentCycles = 0;
            this.avoidElement.cancel();
            this.chaseElement.cancel();
        }

        public /*  ©init. */ function _SafeStr_731()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_731 = " Avoid3DAttackUnit" (String#14237)


