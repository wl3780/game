// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.impl.DMGCalculator

package com.tencent.ai.core.combat.impl
{
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.enum.SDTPValuesEnum;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.HurtType;
    import com.tencent.ai.core.enum.SkillType;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_74;

    public class DMGCalculator 
    {

        private static var __instance:DMGCalculator;

        public var isActor:Boolean = false;
        public var isMiss:Boolean = false;
        public var isCRI:Boolean = false;
        public var isBackHurt:Boolean = false;
        public var isBreakSkill:Boolean = false;
        public var dmgValue:int = 0;
        public var dmgValueRate:Number = 0;
        public var dmgValueFix:Number = 0;


        public static function getInstance():DMGCalculator
        {
            if (__instance == null){
                __instance = new (DMGCalculator)();
            };
            return (__instance);
        }


        public function dmg(_arg_1:AttackInfo, _arg_2:ActorModel, _arg_3:Boolean=false):void
        {
            var _local_20:Number;
            var _local_21:SkillInfo;
            var _local_22:int;
            var _local_23:int;
            var _local_24:Number;
            var _local_25:int;
            var _local_26:int;
            var _local_27:Number;
            this.isActor = false;
            this.isMiss = false;
            this.isCRI = false;
            this.isBackHurt = false;
            this.isBreakSkill = false;
            this.dmgValue = 0;
            this.dmgValueRate = 0;
            this.dmgValueFix = 0;
            var _local_4:Number = 0;
            var _local_5:Number = 0;
            var _local_6:Number = 0;
            var _local_7:Number = 0;
            var _local_8:int;
            var _local_9:Number = 0;
            var _local_10:Number = 0;
            var _local_11:int = SDTPValuesEnum._CHECK_VALUES[0];
            var _local_12:Number = SDTPValuesEnum._CHECK_VALUES[1];
            var _local_13:Number = SDTPValuesEnum._CHECK_VALUES[3];
            var _local_14:Number = SDTPValuesEnum._CHECK_VALUES[4];
            var _local_15:Number = SDTPValuesEnum._CHECK_VALUES[5];
            var _local_16:Number = SDTPValuesEnum._CHECK_VALUES[8];
            var _local_17:Number = SDTPValuesEnum._CHECK_VALUES[13];
            var _local_18:int = SDTPValuesEnum._CHECK_VALUES[18];
            var _local_19:ActorModel = _arg_1.attackActorModel;
            if (_arg_2 != null){
                this.isBackHurt = !((_arg_2.direction == _arg_1.dir));
                _local_20 = (_local_19.hit_rate - (_arg_2.miss_rate * ((this.isBackHurt) ? 0.5 : 1)));
                if (((!(_arg_3)) && ((DEFINE.RANDOM_FLOAT() >= _local_20)))){
                    this.isMiss = true;
                    this.isBackHurt = false;
                } else {
                    if (_arg_2.isAttacking){
                        this.isBreakSkill = true;
                    };
                    _local_10 = DEFINE.RANDOM_FLOAT();
                    if (_local_10 < _local_19.cri_rate){
                        this.isCRI = true;
                    };
                    _local_21 = _arg_1.skillInfo;
                    _local_22 = _arg_1.hurtType;
                    _local_23 = _local_21.type;
                    if (_local_22 != HurtType.HURT_NOTHING){
                        _local_7 = _local_21.dmg_rate;
                        _local_8 = _local_21.dmg_value;
                        if (_local_23 == SkillType.M_SKILL){
                            _local_24 = (_local_11 + (_local_12 * _local_19.intelligence));
                            _local_25 = _arg_2.m_defend;
                            _local_5 = (_local_19.m_attack * _local_24);
                            _local_6 = ((_arg_2.mDmgReduce + (_arg_2.spirit * _local_14)) * _local_19.sAttackRate);
                            _local_4 = ((_local_11 - (_local_25 / ((_local_19.level * _local_18) + _local_25))) - _arg_2.mFixDmg_rate);
                            _local_4 = (((_local_4 < _local_13)) ? _local_13 : _local_4);
                            if (_local_7 != 0){
                                this.dmgValueRate = (((_local_5 * _local_7) * _local_4) - _local_6);
                            };
                            if (_local_8 != 0){
                                this.dmgValueFix = (((_local_8 * _local_24) * (_local_11 + _local_19.buffFixDmgRate)) - _local_6);
                            };
                        } else {
                            _local_9 = (_local_11 + (_local_12 * _local_19.strength));
                            _local_26 = _arg_2.p_defend;
                            _local_6 = ((_arg_2.pDmgReduce + (_arg_2.physicalpower * _local_14)) * _local_19.sAttackRate);
                            _local_5 = (_local_19.p_attack * _local_9);
                            _local_4 = ((_local_11 - (_local_26 / ((_local_19.level * _local_18) + _local_26))) - _arg_2.pFixDmg_rate);
                            _local_4 = (((_local_4 < _local_13)) ? _local_13 : _local_4);
                            if (_local_7 != 0){
                                this.dmgValueRate = (((_local_5 * _local_7) * _local_4) - _local_6);
                            };
                            if (_local_8 != 0){
                                this.dmgValueFix = (((_local_8 * _local_9) * (_local_11 + _local_19.buffFixDmgRate)) - _local_6);
                            };
                        };
                        _local_5 = (this.dmgValueRate + this.dmgValueFix);
                        _local_5 = (_local_5 * ((_local_11 + ((this.isCRI) ? _local_16 : 0)) + ((this.isBreakSkill) ? _local_15 : 0)));
                        this.dmgValue = int((_local_5 * (_local_17 + (_local_14 * DEFINE.RANDOM_FLOAT()))));
                        this.dmgValue = (((this.dmgValue < _local_11)) ? _local_11 : this.dmgValue);
                    };
                };
            } else {
                this.isBreakSkill = false;
                _local_10 = DEFINE.RANDOM_FLOAT();
                if (_local_10 < _local_19.cri_rate){
                    this.isCRI = true;
                };
                _local_21 = _arg_1.skillInfo;
                _local_22 = _arg_1.hurtType;
                _local_23 = _local_21.type;
                if (_local_22 != HurtType.HURT_NOTHING){
                    if (_local_23 == SkillType.M_SKILL){
                        _local_24 = (_local_11 + (_local_12 * _local_19.intelligence));
                        _local_25 = 0;
                        _local_5 = (_local_19.m_attack * _local_24);
                        _local_4 = (_local_11 - (_local_25 / ((_local_19.level * _local_18) + _local_25)));
                        _local_4 = (((_local_4 < _local_13)) ? _local_13 : _local_4);
                        if (_local_7 != 0){
                            this.dmgValueRate = (((_local_5 * _local_7) * _local_4) - _local_6);
                        };
                        if (_local_8 != 0){
                            this.dmgValueFix = (((_local_8 * _local_24) * (_local_11 + _local_19.buffFixDmgRate)) - _local_6);
                        };
                    } else {
                        _local_9 = (_local_11 + (_local_12 * _local_19.strength));
                        _local_26 = 0;
                        _local_5 = (_local_19.p_attack * _local_9);
                        _local_4 = (_local_11 - (_local_26 / ((_local_19.level * _local_18) + _local_26)));
                        _local_4 = (((_local_4 < _local_13)) ? _local_13 : _local_4);
                        if (_local_7 != 0){
                            this.dmgValueRate = (((_local_5 * _local_7) * _local_4) - _local_6);
                        };
                        if (_local_8 != 0){
                            this.dmgValueFix = (((_local_8 * _local_9) * (_local_11 + _local_19.buffFixDmgRate)) - _local_6);
                        };
                    };
                    _local_5 = (this.dmgValueRate + this.dmgValueFix);
                    _local_5 = (_local_5 * ((_local_11 + ((this.isCRI) ? _local_16 : 0)) + ((this.isBreakSkill) ? _local_15 : 0)));
                    this.dmgValue = int((_local_5 * (_local_17 + (_local_14 * DEFINE.RANDOM_FLOAT()))));
                    this.dmgValue = (((this.dmgValue < _local_11)) ? _local_11 : this.dmgValue);
                };
            };
            _arg_1.isMiss = this.isMiss;
            _arg_1.isBackHurt = this.isBackHurt;
            _arg_1.isBreakSkill = this.isBreakSkill;
            _arg_1.isCRI = this.isCRI;
            _arg_1.addDmgValue = 0;
            _arg_1.dmgValue = this.dmgValue;
            _arg_1.gatherOtherInfo(_local_19, _arg_2);
            if ((((((((_local_11 + _local_12) + _local_13) + _local_14) + _local_15) + _local_16) + _local_17) + _local_18) != 202.954){
                SDTPValuesEnum._CALCULATOR_SUM_ERROR = true;
                SDTPValuesEnum._CALCULATOR_SUM_ERROR_CODE = 0;
            } else {
                if (_local_19){
                    if ((((_local_10 >= _local_19.cri_rate)) && (this.isCRI))){
                        SDTPValuesEnum._CALCULATOR_SUM_ERROR = true;
                        SDTPValuesEnum._CALCULATOR_SUM_ERROR_CODE = 1;
                    } else {
                        _local_27 = ((_local_11 + 0) + (_local_12 * _local_19.strength));
                        SDTPValuesEnum._CALCULATOR_SUM_ERROR = (_local_27 < _local_9);
                        SDTPValuesEnum._CALCULATOR_SUM_ERROR_CODE = 2;
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_74()
        {
        }


    }
}//package com.tencent.ai.core.combat.impl

// _SafeStr_74 = " DMGCalculator" (String#14291)


