// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.RoamUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.monster.ai.ActionEventHandler;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.enum.AIUnitType;
    import  ©init._SafeStr_750;

    public class RoamUnit implements IAIUnit 
    {

        public var lastCycles:int;
        protected var movekeys:Array;
        protected var p0:Number;
        protected var p1:Number;
        protected var currentCycles:int;
        protected var brain:IMonsterBrain;
        protected var currentXMoveKey:Array;
        protected var currentZMoveKey:Array;
        protected var isActive:Boolean = false;
        protected var scene:IScene;
        protected var actionEventHandler:ActionEventHandler;

        public function RoamUnit(_arg_1:IMonsterBrain)
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT]];
            super();
            this.brain = _arg_1;
            this.lastCycles = int((30 + (DEFINE.RANDOM_FLOAT() * 60)));
            this.actionEventHandler = _arg_1.getActionEventHanlder();
        }

        public function run():void
        {
            if (this.isActive){
                return;
            };
            this.isActive = true;
            this.scene = this.brain.getCurrentScene();
            this.currentCycles = ((DEFINE.RANDOM_FLOAT() * 90) + 70);
            var _local_1:Number = (DEFINE.RANDOM_FLOAT() * 2);
            var _local_2:Number = (DEFINE.RANDOM_FLOAT() * 2);
            var _local_3:Number = (1 + this.brain.getMonsterRoamPZ());
            var _local_4:Number = (DEFINE.RANDOM_FLOAT() * _local_3);
            if (_local_4 < 1){
                if (_local_1 > 1){
                    this.currentXMoveKey = this.movekeys[3];
                } else {
                    this.currentXMoveKey = this.movekeys[2];
                };
            };
            if (_local_4 < this.brain.getMonsterRoamPZ()){
                if (_local_2 > 1){
                    this.currentZMoveKey = this.movekeys[1];
                } else {
                    this.currentZMoveKey = this.movekeys[0];
                };
            };
            var _local_5:Boolean = true;
            var _local_6:Boolean = true;
            var _local_7:Boolean = true;
            var _local_8:Boolean = true;
            _local_5 = this.scene.isWalkable((this.brain.getMonster().mapX + Constants.WALK_SIZE), this.brain.getMonster().mapZ);
            _local_6 = this.scene.isWalkable(this.brain.getMonster().mapX, (this.brain.getMonster().mapZ + Constants.WALK_SIZE));
            _local_7 = this.scene.isWalkable(this.brain.getMonster().mapX, (this.brain.getMonster().mapZ - Constants.WALK_SIZE));
            _local_8 = this.scene.isWalkable((this.brain.getMonster().mapX - Constants.WALK_SIZE), this.brain.getMonster().mapZ);
            if (((!(_local_5)) && ((this.currentXMoveKey == this.movekeys[3])))){
                this.currentXMoveKey = this.movekeys[2];
            } else {
                if (((!(_local_8)) && ((this.currentXMoveKey == this.movekeys[2])))){
                    this.currentXMoveKey = this.movekeys[3];
                };
            };
            if (((!(_local_6)) && ((this.currentZMoveKey == this.movekeys[1])))){
                this.currentZMoveKey = this.movekeys[0];
            } else {
                if (((!(_local_7)) && ((this.currentZMoveKey == this.movekeys[0])))){
                    this.currentZMoveKey = this.movekeys[1];
                };
            };
            if (this.currentXMoveKey != null){
                this.brain.getMonster().inputVKey(this.currentXMoveKey[0]);
            };
            if (this.currentZMoveKey != null){
                this.brain.getMonster().inputVKey(this.currentZMoveKey[0]);
            };
        }

        public function onTick():void
        {
            var _local_9:Number;
            var _local_10:Number;
            this.currentCycles--;
            if (((this.canBreak()) || ((this.isActive == false)))){
                this.breakUnit();
                return;
            };
            if (this.actionEventHandler.checkIsHurted()){
                this.breakUnit();
                return;
            };
            var _local_1:int = (this.brain.getMonster().mapX - this.brain.getMonsterCurrentX());
            var _local_2:int = (this.brain.getMonster().mapZ - this.brain.getMonsterCurrentZ());
            var _local_3:int = (_local_1 * _local_1);
            var _local_4:int = (_local_2 * _local_2);
            if ((((_local_3 > this.brain.getMonsterRoamRR())) || ((_local_4 > this.brain.getMonsterRoamRRZ())))){
                _local_9 = (1 + this.brain.getMonsterRoamPZ());
                _local_10 = (DEFINE.RANDOM_FLOAT() * _local_9);
                if (_local_3 > this.brain.getMonsterRoamRR()){
                    this.breakUnit();
                    return;
                };
                if (_local_4 > this.brain.getMonsterRoamRRZ()){
                    if (this.currentZMoveKey != null){
                        this.brain.getMonster().inputVKey(this.currentZMoveKey[1]);
                    };
                    if (_local_10 < this.brain.getMonsterRoamPZ()){
                        if (this.brain.getMonster().mapZ > this.brain.getMonsterCurrentZ()){
                            this.currentZMoveKey = this.movekeys[0];
                        } else {
                            this.currentZMoveKey = this.movekeys[1];
                        };
                        if (this.currentZMoveKey != null){
                            this.brain.getMonster().inputVKey(this.currentZMoveKey[0]);
                        };
                    };
                };
                return;
            };
            var _local_5:Boolean = true;
            var _local_6:Boolean = true;
            var _local_7:Boolean = true;
            var _local_8:Boolean = true;
            _local_5 = this.scene.isWalkable((this.brain.getMonster().mapX + Constants.WALK_SIZE), this.brain.getMonster().mapZ);
            _local_6 = this.scene.isWalkable(this.brain.getMonster().mapX, (this.brain.getMonster().mapZ + Constants.WALK_SIZE));
            _local_7 = this.scene.isWalkable(this.brain.getMonster().mapX, (this.brain.getMonster().mapZ - Constants.WALK_SIZE));
            _local_8 = this.scene.isWalkable((this.brain.getMonster().mapX - Constants.WALK_SIZE), this.brain.getMonster().mapZ);
            if (((!(_local_5)) && ((this.currentXMoveKey == this.movekeys[3])))){
                this.breakUnit();
                return;
            };
            if (((!(_local_8)) && ((this.currentXMoveKey == this.movekeys[2])))){
                this.breakUnit();
                return;
            };
            if (((!(_local_6)) && ((this.currentZMoveKey == this.movekeys[1])))){
                this.breakUnit();
                return;
            };
            if (((!(_local_7)) && ((this.currentZMoveKey == this.movekeys[0])))){
                this.breakUnit();
                return;
            };
        }

        public function breakUnit():void
        {
            this.isActive = false;
            this.brain.getMonster().inputVKey(this.movekeys[0][1]);
            this.brain.getMonster().inputVKey(this.movekeys[1][1]);
            this.brain.getMonster().inputVKey(this.movekeys[2][1]);
            this.brain.getMonster().inputVKey(this.movekeys[3][1]);
            this.currentXMoveKey = null;
            this.currentZMoveKey = null;
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
            this.p0 = _arg_1;
            this.p1 = _arg_2;
        }

        public function isProbability(_arg_1:Number):Boolean
        {
            return ((((_arg_1 >= this.p0)) && ((_arg_1 < this.p1))));
        }

        public function getUnitType():int
        {
            return (AIUnitType.ROAM);
        }

        public function reset():void
        {
            this.brain.getMonster().inputVKey(this.movekeys[0][1]);
            this.brain.getMonster().inputVKey(this.movekeys[1][1]);
            this.brain.getMonster().inputVKey(this.movekeys[2][1]);
            this.brain.getMonster().inputVKey(this.movekeys[3][1]);
            this.currentXMoveKey = null;
            this.currentZMoveKey = null;
            this.currentCycles = 0;
            this.isActive = false;
        }

        public /*  ©init. */ function _SafeStr_750()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.unit

// _SafeStr_750 = " RoamUnit" (String#15353)


