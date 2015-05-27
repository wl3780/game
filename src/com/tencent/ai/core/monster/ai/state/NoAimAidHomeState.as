// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.state.NoAimAidHomeState

package com.tencent.ai.core.monster.ai.state
{
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.monster.ai.unit.NothingUnit;
    import com.tencent.ai.core.monster.ai.unit.RoamUnit;
    import com.tencent.ai.core.monster.ai.unit.LeisureUnit;
    import com.tencent.ai.core.monster.ai.unit.IAIUnit;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.SimpleAidHomeAI;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_701;

    public class NoAimAidHomeState implements IMonsterBrainState 
    {

        protected var brain:IMonsterBrain;
        protected var nothingUnit:NothingUnit;
        protected var roamUnit:RoamUnit;
        protected var leisureUnit:LeisureUnit;
        protected var currentUnit:IAIUnit;
        protected var group:int = 1;
        private var roamRR:int;
        protected var checkSuicideList:Array;
        protected var checkLeisureList:Array;
        protected var param:MonsterAIInfo;
        private var timer:int = 0;

        public function NoAimAidHomeState(_arg_1:IMonsterBrain)
        {
            this.brain = _arg_1;
            this.nothingUnit = new NothingUnit();
            this.roamUnit = new RoamUnit(_arg_1);
            this.leisureUnit = new LeisureUnit(_arg_1);
            this.checkSuicideList = (_arg_1 as SimpleAidHomeAI).monsterSuicideSightLines.slice();
            this.checkLeisureList = (_arg_1 as SimpleAidHomeAI).monsterLeisureSightLines.slice();
        }

        protected function randomUnit():IAIUnit
        {
            if ((DEFINE.RANDOM_FLOAT() * 100) < (this.brain.getMonsterAIInfo().roamP * 10)){
                return (this.roamUnit);
            };
            return (this.nothingUnit);
        }

        protected function setCurrentUnit(_arg_1:IAIUnit):int
        {
            if (this.currentUnit == this.roamUnit){
                if (this.currentUnit.canBreak()){
                    this.currentUnit.breakUnit();
                    this.currentUnit = this.nothingUnit;
                };
                return (-1);
            };
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
            };
            this.currentUnit = _arg_1;
            this.currentUnit.run();
            return (-1);
        }

        public function setAIInfo(_arg_1:MonsterAIInfo):void
        {
            this.param = _arg_1;
            this.nothingUnit.lastCycles = _arg_1.durCycles;
            this.roamUnit.lastCycles = _arg_1.durCycles;
            this.roamUnit.setProbabilityRange(0, _arg_1.roamP);
            this.roamRR = (_arg_1.roamR * _arg_1.roamR);
        }

        public function reset():void
        {
            if (this.currentUnit != null){
                this.currentUnit.breakUnit();
            };
        }

        public function stateIn():void
        {
            this.setCurrentUnit(this.randomUnit());
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
            if (this.timer == 0){
                if ((DEFINE.RANDOM_FLOAT() * 10) < 3){
                    this.getBubbleDialog();
                };
            };
            this.timer++;
            this.timer = (this.timer % 120);
            if ((((this.currentUnit == null)) || (this.currentUnit.canBreak()))){
                return (this.setCurrentUnit(this.randomUnit()));
            };
            this.currentUnit.onTick();
            return (-1);
        }

        private function getBubbleDialog():void
        {
            var _local_1:Array;
            var _local_2:int;
            var _local_3:BubbleDialog;
            var _local_4:int;
            var _local_5:Array;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:BubbleDialog;
            var _local_10:Number;
            if ((DEFINE.RANDOM_FLOAT() * 10) <= 2){
                _local_1 = new Array();
                _local_2 = 9000;
                while (_local_2 <= 9050) {
                    _local_3 = AICore.data.getBubbleDialogInfo(_local_2);
                    if (((!((_local_3 == null))) && (!((_local_3.randomP == 0))))){
                        _local_1.push(_local_3);
                    };
                    _local_2++;
                };
                if (_local_1.length > 0){
                    _local_4 = int((DEFINE.RANDOM_FLOAT() * _local_1.length));
                    this.brain.getMonster().speakBubble((_local_1[_local_4] as BubbleDialog).content);
                    return;
                };
            } else {
                _local_5 = this.param.bDialogId2;
                _local_6 = _local_5.length;
                _local_7 = 0;
                while (_local_7 < _local_6) {
                    if (_local_5[_local_7] != ""){
                        _local_8 = _local_5[_local_7];
                        _local_9 = AICore.data.getBubbleDialogInfo(_local_8);
                        if (_local_9 != null){
                            _local_10 = (DEFINE.RANDOM_FLOAT() * 10000);
                            if (_local_10 <= _local_9.randomP){
                                this.brain.getMonster().speakBubble(_local_9.content);
                                return;
                            };
                        };
                    };
                    _local_7++;
                };
            };
        }

        public function getStateType():int
        {
            return (1);
        }

        public function getGroup():int
        {
            return (this.group);
        }

        public function setGroup(_arg_1:int):void
        {
            this.group = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_701()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai.state

// _SafeStr_701 = " NoAimAidHomeState" (String#14375)


