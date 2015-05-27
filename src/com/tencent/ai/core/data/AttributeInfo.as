// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AttributeInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_215;

    public class AttributeInfo 
    {

        public var level:int;
        public var weight:int;
        public var walkV:int;
        public var runV:int;
        public var jumpV:int;
        public var stiff:int;
        public var firm:int;
        public var strength:int;
        public var intelligence:int;
        public var physicalpower:int;
        public var spirit:int;
        public var hit_rate:Number = 0;
        public var miss_rate:Number = 0;
        public var p_attack:int;
        public var p_defend:int;
        public var m_attack:int;
        public var m_defend:int;
        public var cri_rate:Number = 0;
        public var pDmgReduce:int;
        public var pFixDmg_rate:Number = 0;
        public var mDmgReduce:int;
        public var mFixDmg_rate:Number = 0;
        public var attack_v:int;
        public var hp_recovery:int;
        public var mp_recovery:int;
        public var hp:int;
        public var maxhp:int;
        public var mp:int;
        public var maxmp:int;
        public var angry_val:int;
        public var maxAngry_val:int = 1000;
        public var hungry:int = 100;


        public function updateAttributeInfo(_arg_1:AttributeInfo):void
        {
            this.level = _arg_1.level;
            this.weight = _arg_1.weight;
            this.walkV = _arg_1.walkV;
            this.runV = _arg_1.runV;
            this.jumpV = _arg_1.jumpV;
            this.stiff = _arg_1.stiff;
            this.firm = _arg_1.firm;
            this.strength = _arg_1.strength;
            this.intelligence = _arg_1.intelligence;
            this.physicalpower = _arg_1.physicalpower;
            this.spirit = _arg_1.spirit;
            this.hit_rate = _arg_1.hit_rate;
            this.miss_rate = _arg_1.miss_rate;
            this.p_attack = _arg_1.p_attack;
            this.p_defend = _arg_1.p_defend;
            this.m_attack = _arg_1.m_attack;
            this.m_defend = _arg_1.m_defend;
            this.cri_rate = _arg_1.cri_rate;
            this.pDmgReduce = _arg_1.pDmgReduce;
            this.pFixDmg_rate = _arg_1.pFixDmg_rate;
            this.mDmgReduce = _arg_1.mDmgReduce;
            this.mFixDmg_rate = _arg_1.mFixDmg_rate;
            this.attack_v = _arg_1.attack_v;
            this.hp = _arg_1.hp;
            this.hp_recovery = _arg_1.hp_recovery;
            this.maxhp = _arg_1.maxhp;
            this.mp = _arg_1.mp;
            this.mp_recovery = _arg_1.mp_recovery;
            this.maxmp = _arg_1.maxmp;
            this.maxAngry_val = _arg_1.maxAngry_val;
            this.hungry = _arg_1.hungry;
        }

        public /*  ©init. */ function _SafeStr_215()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_215 = " AttributeInfo" (String#13802)


