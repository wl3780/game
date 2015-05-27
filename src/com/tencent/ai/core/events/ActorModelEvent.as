// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ActorModelEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_521;

    public class ActorModelEvent extends BaseEvent 
    {

        public static const ON_BASE_DATA_UPDATE:String = "onBaseDataUpdate";
        public static const ON_SKILL_DATA_UPDATE:String = "onSkillDataUpdate";
        public static const ON_HP_CHANGE:String = "onHPChange";
        public static const ON_MP_CHANGE:String = "onMPChange";
        public static const ON_V_CHANGE:String = "onVChange";
        public static const ON_ANGRYVAL_CHANGE:String = "onAngryValChange";
        public static const ON_SKILL_USED:String = "onSkillUsed";
        public static const ON_SKILL_USED_ERROR:String = "onSkillUsedError";
        public static const ON_ACTION_CHANGE:String = "onActionChange";
        public static const ON_ACTIONSTATE_FLOAT:String = "onActionStateFloat";
        public static const ON_ACTIONSTATE_LAY_DOWN:String = "onActionStateLayDown";
        public static const ON_ACTIONSTATE_GET_UP:String = "onActionStateGetUp";
        public static const ON_STATUS_CHANGE:String = "onStatusChange";
        public static const ON_MAXLIETIME_CHANGE:String = "onMaxLieTimeChange";
        public static const ON_LEVEL_UPDATE:String = "onLevelUpdate";
        public static const ON_CAREER_CHANGE:String = "onCareerChange";
        public static const ON_SIGHT_DATA_CHANGE:String = "onSightDataChange";
        public static const ON_SURVIVAL_CHANGE:String = "onSurvivalChange";
        public static const ON_VIGOUR_CHANGE:String = "onVigourChange";
        public static const ON_PET_FORTRESS_LIB_NOTIFY:String = "onPetFortressLibNotify";
        public static const ON_FIGHT_VALUE_CHANGE:String = "onFightValueChange";

        public function ActorModelEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_521()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_521 = " ActorModelEvent" (String#16013)


