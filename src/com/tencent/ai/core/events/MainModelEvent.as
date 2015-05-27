// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.MainModelEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_546;

    public class MainModelEvent extends BaseEvent 
    {

        public static const ON_CONTROL_CHANGE:String = "onControlChange";
        public static const ON_SETTING_CHANGE:String = "onSettingChange";
        public static const ON_SETTING_HIDE_PET:String = "onSettingHidePet";
        public static const ON_ZONE_BUFF_CHANGE:String = "onZoneBuffChange";
        public static const ON_ZONE_TIREDNESS_CHANGE:String = "onZoneTirednessChange";
        public static const ON_EQUIPSID_CHANGE:String = "onEquipsIDChange";
        public static const ON_MAINPLAYER_DEAD:String = "onMainPlayerDead";
        public static const ON_ICON_MESSAGE_CHANGE:String = "onIconMessageChange";
        public static const ON_CAREER_WEAR_UPGRADE:String = "onCareerWearUpgrade";
        public static const ON_CAREER_TRANS:String = "onCareerTrans";
        public static const ON_ADD_EXP:String = "onAddExp";
        public static const ON_ADD_FORTRESS_EXP:String = "onAddFortressExp";
        public static const ON_ADD_COIN:String = "onAddCoin";
        public static const ON_FIRST_TIME_BUBBLE:String = "onFirstTimeBubble";
        public static const ON_MILITARY_UPGRADE:String = "onMilitaryUpgrade";
        public static const ON_GROW_UP_GIFT:String = "onGrowUpGift";
        public static const ON_SUBLIME:String = "onSublime";
        public static const ON_VIP_INFO_CHANGE:String = "vipInfoChange";
        public static const ON_POSITION_N_CHANGE:String = "positionNChange";
        public static const ON_COUPONS_CHANGE:String = "onCouponsChange";
        public static const ON_SCORE_CHANGE:String = "onScoreChange";
        public static const ON_PET_GROUP_EXP_CHANGE:String = "onPetGroupExpChange";
        public static const ON_JOIN_TEAM:String = "onJoinTeam";

        public function MainModelEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_546()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_546 = " MainModelEvent" (String#17237)


