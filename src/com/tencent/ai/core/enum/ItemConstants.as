// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.ItemConstants

package com.tencent.ai.core.enum
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_449;

    public class ItemConstants 
    {

        public static const INDEX_WEAPON:int = 0;
        public static const INDEX_BACK:int = 1;
        public static const INDEX_CANNON:int = 2;
        public static const INDEX_ENGINE1:int = 3;
        public static const INDEX_ENGINE2:int = 4;
        public static const INDEX_CHIP1:int = 5;
        public static const INDEX_CHIP2:int = 6;
        public static const INDEX_CPU1:int = 7;
        public static const INDEX_CPU2:int = 8;
        public static const INDEX_BADGE:int = 9;
        public static const INDEX_FASHION:int = 10;
        private static var _posTypeToIndex:Object;
        public static const PosTyte_WEAPON:int = 101;
        public static const PosTyte_BACK:int = 114;
        public static const PosTyte_CANNON:int = 115;
        public static const PosTyte_ENGINE:int = 121;
        public static const PosTyte_CHIP:int = 123;
        public static const PosTyte_CPU:int = 125;
        public static const PosTyte_BADGE:int = 131;
        public static const PosTyte_FASHION:int = 142;
        private static var _posTypeNames:Object;
        public static const PropType_WEAPON:int = 11;
        public static const PropType_EX_PART:int = 12;
        public static const PropType_IN_PART:int = 13;
        public static const PropType_BADGE:int = 15;
        public static const PropType_MATERIAL:int = 21;
        public static const PropType_FUNCTION:int = 22;
        public static const PropType_MISSION:int = 23;
        public static const PropType_GEM:int = 24;
        public static const PropType_ENERGY:int = 31;
        public static const PropType_PURIFY:int = 32;
        public static const PropType_STRENGTHEN:int = 33;
        private static var _propTypeNames:Object;
        public static const PropKind_EQUIP:int = 3;
        public static const PropKind_COMBAT:int = 2;
        public static const PropKind_COMMON:int = 1;
        private static var _propKindNames:Object;
        public static const AvatarType_F_ENGINE:int = 16;
        public static const AvatarType_F_CHIP:int = 17;
        public static const AvatarType_F_CPU:int = 18;
        public static const AvatarType_S_ENGINE:int = 26;
        public static const AvatarType_S_CHIP:int = 27;
        public static const AvatarType_S_CPU:int = 28;
        public static const AvatarType_L_ENGINE:int = 36;
        public static const AvatarType_L_CHIP:int = 37;
        public static const AvatarType_L_CPU:int = 38;
        public static const AvatarType_CH_ENGINE:int = 71;
        public static const AvatarType_CH_CHIP:int = 72;
        public static const AvatarType_CH_CPU:int = 73;
        private static var _avatarTypeNames:Object;
        private static var _gradeNames:Array;
        public static const RARE_0:int = 0;
        public static const RARE_1:int = 1;
        public static const RARE_2:int = 2;
        public static const RARE_3:int = 3;
        public static const RARE_4:int = 4;
        private static var _rareColors:Array;
        private static var _rareNames:Array;
        private static var _type2KindMap:Dictionary;
        public static const SellState_OUT:int = 0;
        public static const SellState_ON:int = 1;
        public static const SellState_HOT:int = 2;
        public static const SellState_NEW:int = 3;
        public static const ENV_NO_LIMIT:int = 0;
        public static const ENV_ZOON:int = 1;
        public static const ENV_DUP:int = 2;
        public static const ENV_PK:int = 3;
        public static const ENV_DUP_AND_PK:int = 4;
        public static const ENV_ZOON_AND_DUP:int = 5;
        public static const ENV_SPECIAL_DUP:int = 6;
        public static const ENV_LimitBitsets:Array = [0xFF, 1, 2, 4, 6, 3, 8];
        public static const ShortcutMaxLength:int = 5;
        public static const HOLE_STATUS_UNUSABLE:int = 0;
        public static const HOLE_STATUS_UNSET:int = 1;
        public static const HOLE_STATUS_EMPTY:int = 2;
        public static const HOLE_STATUS_SET:int = 3;
        public static const GEM_ALL:int = 1000;
        public static const GEM_YELLOW:int = 1001;
        public static const GEM_ORANGE:int = 1002;
        public static const GEM_GREEN:int = 1003;
        public static const GEM_PURPLE:int = 1004;
        public static const GEM_RED:int = 1005;
        public static const GEM_BLUE:int = 1006;
        public static const GEM_WHITE:int = 1007;
        public static const GEM_MOON_STONE:int = 1008;
        public static const GEM_OBSIDIAN:int = 1009;
        public static const GEM_RED_QUARTZ:int = 1010;
        public static const GEM_BLUE_CRYSTAL:int = 1011;
        public static const GEM_MICAREX:int = 1012;
        public static const GEM_DIAMOND:int = 1013;
        public static const Feature_SpecialStrengthen:int = (1 << 16);
        public static const Feature_IsPetHp:int = (1 << 15);
        public static const Feature_IsPetPokeball:int = (1 << 14);
        public static const Feature_IsPetHungry:int = (1 << 13);
        public static const Feature_IsPetSkill:int = (1 << 12);
        public static const Feature_Lotteryable:int = (1 << 11);
        public static const Feature_Combinable:int = (1 << 10);
        public static const Feature_Shortcutable:int = (1 << 6);
        public static const Feature_Useable:int = (1 << 5);
        public static const Feature_Repeatable:int = (1 << 4);
        public static const Feature_Droppable:int = (1 << 2);
        public static const Feature_Pawnable:int = (1 << 1);
        public static const GOLD_ID:int = 199999;
        public static const XP_ID:int = 199997;
        public static const FATIGUE_ID:int = 199996;
        public static const PKEXP_ID:int = 199994;
        public static const PKSCORE_ID:int = 199995;
        public static const FLAG_ID:int = 199989;
        public static const FORTRESS_EXP_ID:int = 199990;
        public static const RESOURCE_ID:int = 199991;
        public static const PET_EXP_ID:int = 199992;
        public static const FAMILY_CONTRIBUTION:int = 199981;
        public static const FAMILY_POPULARITY:int = 199982;
        public static const FAMILY_ZHU_NENG:int = 199983;
        public static const exceptItemIDs:Array = [GOLD_ID, XP_ID, FATIGUE_ID, PKEXP_ID, PKSCORE_ID, FLAG_ID, FORTRESS_EXP_ID, RESOURCE_ID, PET_EXP_ID, FAMILY_CONTRIBUTION, FAMILY_POPULARITY, FAMILY_ZHU_NENG];
        public static const COUPONS:String = "星券";
        public static const SCORE:String = "积分";


        public static function posTypeToIndex(_arg_1:int):Array
        {
            if (!_posTypeToIndex){
                _posTypeToIndex = new Object();
                _posTypeToIndex[PosTyte_WEAPON] = [INDEX_WEAPON];
                _posTypeToIndex[PosTyte_BACK] = [INDEX_BACK];
                _posTypeToIndex[PosTyte_CANNON] = [PosTyte_CANNON];
                _posTypeToIndex[PosTyte_ENGINE] = [INDEX_ENGINE1, INDEX_ENGINE2];
                _posTypeToIndex[PosTyte_CHIP] = [INDEX_CHIP1, INDEX_CHIP2];
                _posTypeToIndex[PosTyte_CPU] = [INDEX_CPU1, INDEX_CPU2];
                _posTypeToIndex[PosTyte_BADGE] = [INDEX_BADGE];
                _posTypeToIndex[PosTyte_FASHION] = [INDEX_FASHION];
            };
            return (_posTypeToIndex[_arg_1]);
        }

        public static function getPosTypeName(_arg_1:int):String
        {
            if (!_posTypeNames){
                _posTypeNames = new Object();
                _posTypeNames[PosTyte_WEAPON] = "武器";
                _posTypeNames[PosTyte_BACK] = "推进器";
                _posTypeNames[PosTyte_CANNON] = "浮游炮";
                _posTypeNames[PosTyte_ENGINE] = "内核引擎";
                _posTypeNames[PosTyte_CHIP] = "内核芯片";
                _posTypeNames[PosTyte_CPU] = "内核cpu";
                _posTypeNames[PosTyte_BADGE] = "徽章";
                _posTypeNames[PosTyte_FASHION] = "时装";
            };
            return (_posTypeNames[_arg_1]);
        }

        public static function getPropTypeName(_arg_1:int):String
        {
            if (!_propTypeNames){
                _propTypeNames = new Object();
                _propTypeNames[PropType_WEAPON] = "武器";
                _propTypeNames[PropType_EX_PART] = "外置部件";
                _propTypeNames[PropType_IN_PART] = "内核部件";
                _propTypeNames[PropType_BADGE] = "徽章";
                _propTypeNames[PropType_MATERIAL] = "材料";
                _propTypeNames[PropType_FUNCTION] = "功能道具";
                _propTypeNames[PropType_MISSION] = "任务道具";
                _propTypeNames[PropType_GEM] = "宝石";
                _propTypeNames[PropType_ENERGY] = "能量道具";
                _propTypeNames[PropType_PURIFY] = "净化道具";
                _propTypeNames[PropType_STRENGTHEN] = "强化道具";
            };
            return (_propTypeNames[_arg_1]);
        }

        public static function getPropKindName(_arg_1:int):String
        {
            if (!_propKindNames){
                _propKindNames = new Object();
                _propKindNames[0] = "--";
                _propKindNames[PropKind_EQUIP] = "装备机体";
                _propKindNames[PropKind_COMMON] = "普通物品";
                _propKindNames[PropKind_COMBAT] = "战斗物品";
            };
            return (_propKindNames[_arg_1]);
        }

        public static function getAvatarTypeName(_arg_1:int):String
        {
            if (!_avatarTypeNames){
                _avatarTypeNames = new Object();
                _avatarTypeNames[11] = "闪影控制器";
                _avatarTypeNames[12] = "闪影防护器";
                _avatarTypeNames[13] = "闪影驱动器";
                _avatarTypeNames[14] = "闪影推进器";
                _avatarTypeNames[15] = "闪影浮游炮";
                _avatarTypeNames[AvatarType_F_ENGINE] = "闪影引擎";
                _avatarTypeNames[AvatarType_F_CHIP] = "闪影芯片";
                _avatarTypeNames[AvatarType_F_CPU] = "闪影CPU";
                _avatarTypeNames[21] = "天剑控制器";
                _avatarTypeNames[22] = "天剑防护器";
                _avatarTypeNames[23] = "天剑驱动器";
                _avatarTypeNames[24] = "天剑推进器";
                _avatarTypeNames[25] = "天剑浮游炮";
                _avatarTypeNames[AvatarType_S_ENGINE] = "天剑引擎";
                _avatarTypeNames[AvatarType_S_CHIP] = "天剑芯片";
                _avatarTypeNames[AvatarType_S_CPU] = "天剑CPU";
                _avatarTypeNames[31] = "枪炮控制器";
                _avatarTypeNames[32] = "枪炮防护器";
                _avatarTypeNames[33] = "枪炮驱动器";
                _avatarTypeNames[34] = "枪炮推进器";
                _avatarTypeNames[35] = "枪炮浮游炮";
                _avatarTypeNames[AvatarType_L_ENGINE] = "枪炮引擎";
                _avatarTypeNames[AvatarType_L_CHIP] = "枪炮芯片";
                _avatarTypeNames[AvatarType_L_CPU] = "枪炮CPU";
                _avatarTypeNames[40] = "徽章";
                _avatarTypeNames[51] = "臂铠";
                _avatarTypeNames[52] = "手刀";
                _avatarTypeNames[53] = "机械手套";
                _avatarTypeNames[54] = "钢爪";
                _avatarTypeNames[55] = "光剑";
                _avatarTypeNames[56] = "粒子剑";
                _avatarTypeNames[57] = "GN巨剑";
                _avatarTypeNames[58] = "光束刀";
                _avatarTypeNames[59] = "粒子手枪";
                _avatarTypeNames[60] = "粒子步枪";
                _avatarTypeNames[61] = "光炮";
                _avatarTypeNames[62] = "光束枪";
                _avatarTypeNames[63] = "闪影职业装";
                _avatarTypeNames[64] = "闪影时装";
                _avatarTypeNames[65] = "枪炮时装";
                _avatarTypeNames[66] = "天剑时装";
                _avatarTypeNames[67] = "炽刃";
                _avatarTypeNames[68] = "炽风刃";
                _avatarTypeNames[69] = "炽重剑";
                _avatarTypeNames[70] = "炽能短剑";
                _avatarTypeNames[AvatarType_CH_ENGINE] = "链刃引擎";
                _avatarTypeNames[AvatarType_CH_CHIP] = "链刃芯片";
                _avatarTypeNames[AvatarType_CH_CPU] = "链刃CPU";
                _avatarTypeNames[74] = "链刃时装";
                _avatarTypeNames[75] = "链刃推进器";
                _avatarTypeNames[76] = "双刃枪";
                _avatarTypeNames[77] = "圣枪引擎";
                _avatarTypeNames[78] = "圣枪芯片";
                _avatarTypeNames[79] = "圣枪CPU";
                _avatarTypeNames[80] = "圣枪时装";
                _avatarTypeNames[81] = "圣枪推进器";
                _avatarTypeNames[82] = "魔导球";
                _avatarTypeNames[83] = "寒星引擎";
                _avatarTypeNames[84] = "寒星芯片";
                _avatarTypeNames[85] = "寒星CPU";
                _avatarTypeNames[86] = "寒星时装";
                _avatarTypeNames[87] = "寒星推进器";
            };
            return (((_avatarTypeNames[_arg_1]) || ("无")));
        }

        public static function getGradeName(_arg_1:int):String
        {
            if (!_gradeNames){
                _gradeNames = ["随机", "最下级", "下级", "中级", "上级", "最上级"];
            };
            return (((_gradeNames[_arg_1]) || ("随机")));
        }

        public static function getRareColor(_arg_1:int):uint
        {
            if (!_rareColors){
                _rareColors = [0xFFFFFF, 5352447, 10586367, 16275393, 0xFF6000];
            };
            return (_rareColors[_arg_1]);
        }

        public static function getRareName(_arg_1:int):String
        {
            if (!_rareNames){
                _rareNames = ["普通", "高级", "稀有", "传奇", "史诗"];
            };
            return (_rareNames[_arg_1]);
        }

        public static function getNameColorHTML(_arg_1:String, _arg_2:int):String
        {
            return ((((("<font color='#" + getRareColor(_arg_2).toString(16)) + "'>") + _arg_1) + "</font>"));
        }

        public static function getKindByType(_arg_1:int):int
        {
            if (!_type2KindMap){
                _type2KindMap = new Dictionary();
                _type2KindMap[PropType_WEAPON] = PropKind_EQUIP;
                _type2KindMap[PropType_EX_PART] = PropKind_EQUIP;
                _type2KindMap[PropType_IN_PART] = PropKind_EQUIP;
                _type2KindMap[PropType_BADGE] = PropKind_EQUIP;
                _type2KindMap[PropType_MATERIAL] = PropKind_COMBAT;
                _type2KindMap[PropType_FUNCTION] = PropKind_COMBAT;
                _type2KindMap[PropType_MISSION] = PropKind_COMBAT;
                _type2KindMap[PropType_GEM] = PropKind_COMBAT;
                _type2KindMap[PropType_ENERGY] = PropKind_COMBAT;
                _type2KindMap[PropType_PURIFY] = PropKind_COMBAT;
                _type2KindMap[PropType_STRENGTHEN] = PropKind_COMBAT;
            };
            return (_type2KindMap[_arg_1]);
        }

        public static function ContextTypeToEnvIndex(_arg_1:String, _arg_2:Boolean):int
        {
            return ((((_arg_1 == AIContextType.CT_CITY)) ? 1 : (((_arg_1 == AIContextType.CT_DUPLICATE)) ? 2 : (((_arg_1 == AIContextType.CT_EXTDUP)) ? 0 : (((_arg_1 == AIContextType.CT_PVP)) ? 4 : -1)))));
        }


        public /*  ©init. */ function _SafeStr_449()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_449 = " ItemConstants" (String#15551)


