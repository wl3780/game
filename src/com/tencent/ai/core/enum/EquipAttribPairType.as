// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.EquipAttribPairType

package com.tencent.ai.core.enum
{
    import  ©init._SafeStr_436;

    public class EquipAttribPairType 
    {

        public static const STRENGTH:int = 2001;
        public static const INTELLIGENCE:int = 2002;
        public static const PHYSICALPOWER:int = 2003;
        public static const SPIRIT:int = 2004;
        public static const MAXHP:int = 2005;
        public static const MAXMP:int = 2006;
        public static const P_ATTACK:int = 2007;
        public static const P_DEFEND:int = 2008;
        public static const M_ATTACK:int = 2009;
        public static const M_DEFEND:int = 2010;
        public static const HIT_RATE:int = 2011;
        public static const MISS_RATE:int = 2012;
        public static const CRI_RATE:int = 2013;
        public static const FIRM:int = 2014;
        public static const HP_RECOVERY:int = 2015;
        public static const MP_RECOVERY:int = 2016;
        public static const WALKV:int = 2017;
        public static const SPELL_SPEED:int = 2018;
        public static const PDAM_REDUCE:int = 2019;
        public static const MDAM_REDUCE:int = 2020;
        public static const RIGIDITY:int = 2021;
        public static const SKILL_STR:int = 2022;
        public static const EMBED_STRENGTH:int = 5001;
        public static const EMBED_INTELLIGENCE:int = 5002;
        public static const EMBED_PHYSICALPOWER:int = 5003;
        public static const EMBED_SPIRIT:int = 5004;
        public static const EMBED_MAXHP:int = 5005;
        public static const EMBED_MAXMP:int = 5006;
        public static const EMBED_HIT_RATE:int = 5007;
        public static const EMBED_MISS_RATE:int = 5008;
        public static const EMBED_CRI_RATE:int = 5009;
        public static const EMBED_HP_RECOVERY:int = 5010;
        public static const EMBED_MP_RECOVERY:int = 5011;
        public static const EMBED_FIRM:int = 5012;
        public static const EMBED_RIGIDITY:int = 5013;
        private static var _nameMap:Object;


        public static function get nameMap():Object
        {
            if (!_nameMap){
                _nameMap = new Object();
                _nameMap[STRENGTH] = "力量";
                _nameMap[INTELLIGENCE] = "智力";
                _nameMap[PHYSICALPOWER] = "体力";
                _nameMap[SPIRIT] = "精神";
                _nameMap[MAXHP] = "HP最大值";
                _nameMap[MAXMP] = "MP最大值";
                _nameMap[P_ATTACK] = "物理攻击";
                _nameMap[P_DEFEND] = "物理防御";
                _nameMap[M_ATTACK] = "能量攻击";
                _nameMap[M_DEFEND] = "能量防御";
                _nameMap[HIT_RATE] = "命中率";
                _nameMap[MISS_RATE] = "回避率";
                _nameMap[CRI_RATE] = "暴击率";
                _nameMap[FIRM] = "硬直";
                _nameMap[HP_RECOVERY] = "HP恢复量";
                _nameMap[MP_RECOVERY] = "MP恢复量";
                _nameMap[WALKV] = "移动速度";
                _nameMap[SPELL_SPEED] = "攻击速度";
                _nameMap[PDAM_REDUCE] = "物理免伤";
                _nameMap[MDAM_REDUCE] = "能量免伤";
                _nameMap[RIGIDITY] = "僵直";
                _nameMap[SKILL_STR] = "技能强化";
                _nameMap[EMBED_STRENGTH] = "力量";
                _nameMap[EMBED_INTELLIGENCE] = "智力";
                _nameMap[EMBED_PHYSICALPOWER] = "体力";
                _nameMap[EMBED_SPIRIT] = "精神";
                _nameMap[EMBED_MAXHP] = "HP最大值";
                _nameMap[EMBED_MAXMP] = "MP最大值";
                _nameMap[EMBED_HIT_RATE] = "命中率";
                _nameMap[EMBED_MISS_RATE] = "回避率";
                _nameMap[EMBED_CRI_RATE] = "暴击率";
                _nameMap[EMBED_HP_RECOVERY] = "HP恢复量";
                _nameMap[EMBED_MP_RECOVERY] = "MP恢复量";
                _nameMap[EMBED_FIRM] = "硬直";
                _nameMap[EMBED_RIGIDITY] = "僵直";
            };
            return (_nameMap);
        }


        public /*  ©init. */ function _SafeStr_436()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_436 = " EquipAttribPairType" (String#15068)


