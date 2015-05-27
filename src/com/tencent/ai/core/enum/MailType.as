// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.MailType

package com.tencent.ai.core.enum
{
    import  ©init._SafeStr_454;

    public class MailType 
    {

        public static const NORMAL_MSG:int = 100000;
        public static const CAREER_TRANS:int = 100001;
        public static const CAREER_WEAR:int = 100002;
        public static const ANNEX_MSG:int = 110000;
        public static const UPGRADE_SUPPLY:int = 110001;
        public static const UPGRADE_SURE:int = 110002;
        public static const UPGRADE_SURE_NEW:int = 110019;
        public static const NORMAL_MAIL:int = 200000;
        public static const CB_PACKAGEBOX:int = 110002;
        public static const MILITARY_RANK_UPGRADE:int = 110003;
        public static const ONLINE_PACKAGE_BOX:int = 110004;
        public static const PUNCH_PACKAGE_BOX:int = 110005;
        public static const BADGE_AWARD:int = 110006;
        public static const SUBLIME:int = 110010;
        public static const ITEM_AWARD:int = 110012;
        public static const BACK_FULL:int = 110015;
        public static const OPEN_HUO_DONG:int = 110013;
        public static const AUTO_RUN:int = 110014;
        public static const OPEN_ADV_MOVIE:int = 110016;
        public static const OPEN_MERCENARY_MOVIE:int = 110017;
        public static const OPEN_MERCENARY_GIFT:int = 110018;
        public static const JOIN_TEAM:int = 110020;
        public static const CAREER_PROMOTE:int = 110021;
        public static const BACK_FULL_WITH_MODULE:int = 110022;
        public static const FAMILY_NOTIFY:int = 110023;
        public static const LANTERN_FESTIVAL_AWARD:int = 110024;
        public static const SKILL_CAN_UPDATE:int = 999999;


        public static function getTips(_arg_1:int):String
        {
            switch (_arg_1){
                case CAREER_TRANS:
                    return ("机型进化");
                case SKILL_CAN_UPDATE:
                    return ("潜能升级");
                case CAREER_WEAR:
                    return ("机体升级");
                case UPGRADE_SUPPLY:
                    return ("联盟补给礼包");
                case UPGRADE_SURE:
                    return ("成长激励礼包");
                case MILITARY_RANK_UPGRADE:
                    return ("军衔升级");
                case BADGE_AWARD:
                    return ("徽章授予");
                case SUBLIME:
                    return ("机型觉醒");
                case ITEM_AWARD:
                    return ("智能战斗的道具奖励");
                case BACK_FULL:
                case BACK_FULL_WITH_MODULE:
                    return ("背包满了，奖励暂存");
                case OPEN_HUO_DONG:
                    return ("点击打开");
                case LANTERN_FESTIVAL_AWARD:
                    return ("元宵灯谜会排行榜奖励");
                case OPEN_ADV_MOVIE:
                    return ("点击打开冒险团教学动画");
                case OPEN_MERCENARY_MOVIE:
                    return ("点击打开出战教学动画");
                case OPEN_MERCENARY_GIFT:
                    return ("出战奖励");
                case JOIN_TEAM:
                    return ("新兵入列");
                case CAREER_PROMOTE:
                    return ("机型进阶");
                case FAMILY_NOTIFY:
                    return ("家族通知");
            };
            return ("新消息");
        }


        public /*  ©init. */ function _SafeStr_454()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_454 = " MailType" (String#14933)


