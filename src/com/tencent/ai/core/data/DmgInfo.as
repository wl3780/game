// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DmgInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_232;

    public class DmgInfo 
    {

        public var sceneFrameIndex:int;
        public var time:int;
        public var time_score:int;
        public var operate_score:int;
        public var comboDmg_score:int;
        public var seckill_score:int;
        public var hurt_score:int;
        public var hurt_times:int;
        public var combo_pre:int;
        public var combo_dmg:int;
        public var all_dmg:int;
        public var maxCombo_times:int;
        public var currentCombo_times:int;
        public var backHurt_times:int;
        public var breakSkill_times:int;
        public var extraDmg_times:int;
        public var maxKills:int;
        public var seckills:int;
        public var secPre:int;
        public var evaluateStr:String;
        protected var m_timeCounts:int;
        protected var m_runing:Boolean = true;


        protected function upateInfo():void
        {
            this.combo_pre = int(((this.combo_dmg / this.all_dmg) * 100));
            this.secPre = int(((this.seckills / this.maxKills) * 100));
            this.operate_score = (((0 + this.breakSkill_times) + this.backHurt_times) + this.extraDmg_times);
            this.operate_score = (((this.operate_score > 20)) ? 20 : this.operate_score);
            if (this.combo_pre >= 95){
                this.comboDmg_score = 110;
            } else {
                if (this.comboDmg_score >= 90){
                    this.comboDmg_score = 100;
                } else {
                    if (this.comboDmg_score >= 85){
                        this.comboDmg_score = 90;
                    } else {
                        if (this.comboDmg_score >= 80){
                            this.comboDmg_score = 70;
                        } else {
                            if (this.comboDmg_score >= 70){
                                this.comboDmg_score = 50;
                            } else {
                                this.comboDmg_score = 10;
                            };
                        };
                    };
                };
            };
            if (this.secPre >= 90){
                this.seckill_score = 90;
            } else {
                if (this.secPre >= 80){
                    this.seckill_score = 75;
                } else {
                    if (this.secPre >= 70){
                        this.seckill_score = 55;
                    } else {
                        this.seckill_score = 10;
                    };
                };
            };
            var _local_1:int = (this.comboDmg_score + this.seckill_score);
            _local_1 = (((_local_1 > 120)) ? 120 : _local_1);
            var _local_2:int = int((this.hurt_times * 0.2));
            _local_2 = (((_local_2 > 20)) ? 20 : _local_2);
            var _local_3:int = ((this.operate_score + _local_1) - _local_2);
            _local_3 = (((_local_3 < 0)) ? 0 : _local_3);
            var _local_4:Object = AICore.data.runtime.getData(Constants.RTD_DUP);
            if (_local_4 != null){
                if (_local_4.sceneCount == _local_4.sceneCountMax){
                    _local_3 = (_local_3 + 10);
                };
            };
            if (_local_3 >= 140){
                this.evaluateStr = "SSS";
            } else {
                if (_local_3 >= 130){
                    this.evaluateStr = "SS";
                } else {
                    if (_local_3 >= 120){
                        this.evaluateStr = "S";
                    } else {
                        if (_local_3 >= 80){
                            this.evaluateStr = "A";
                        } else {
                            if (_local_3 >= 40){
                                this.evaluateStr = "B";
                            } else {
                                this.evaluateStr = "C";
                            };
                        };
                    };
                };
            };
        }

        public function reset():void
        {
            this.sceneFrameIndex = 0;
            this.time = 0;
            this.operate_score = 0;
            this.comboDmg_score = 0;
            this.seckill_score = 0;
            this.hurt_score = 0;
            this.hurt_times = 0;
            this.combo_pre = 0;
            this.combo_dmg = 0;
            this.all_dmg = 0;
            this.maxCombo_times = 0;
            this.currentCombo_times = 0;
            this.backHurt_times = 0;
            this.breakSkill_times = 0;
            this.extraDmg_times = 0;
            this.maxKills = 0;
            this.seckills = 0;
            this.secPre = 0;
            this.m_timeCounts = DEFINE.FPS;
            this.time_score = 30;
            this.evaluateStr = "C";
            this.m_runing = true;
        }

        public function hurtPlus():void
        {
            this.hurt_times = (this.hurt_times + 1);
            this.hurt_score = (this.hurt_times * 0.2);
        }

        public function comboPlus(_arg_1:int):Boolean
        {
            if (_arg_1 > this.maxCombo_times){
                this.maxCombo_times = _arg_1;
            };
            if (this.currentCombo_times != _arg_1){
                this.currentCombo_times = _arg_1;
                return (true);
            };
            return (false);
        }

        public function attackInfoPlus(_arg_1:AttackInfo):void
        {
            if (_arg_1.isBackHurt){
                this.backHurt_times = (this.backHurt_times + 1);
            };
            if (_arg_1.isBreakSkill){
                this.breakSkill_times = (this.breakSkill_times + 1);
            };
        }

        public function update(_arg_1:int):Boolean
        {
            if (this.m_runing){
                this.m_timeCounts = (this.m_timeCounts - 1);
                if (this.m_timeCounts <= 0){
                    this.sceneFrameIndex = _arg_1;
                    this.m_timeCounts = DEFINE.FPS;
                    this.time = (_arg_1 / DEFINE.FPS);
                    this.time_score = ((3 - int((this.time * 0.0017))) * 10);
                    if (this.time_score <= 0){
                        this.time_score = 0;
                    };
                    this.upateInfo();
                    return (true);
                };
            };
            return (false);
        }

        public function end():void
        {
            this.m_runing = false;
        }

        public /*  ©init. */ function _SafeStr_232()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_232 = " DmgInfo" (String#15656)


