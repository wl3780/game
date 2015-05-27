// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.SkillProxyEvent

package com.tencent.ai.core.events
{
    import com.tencent.ai.core.data.MsgIconData;
    import  ©init._SafeStr_557;

    public class SkillProxyEvent extends BaseEvent 
    {

        public static const ON_CD_PROGRESS:String = "onCDProgress";
        public static const ON_STATE_CHANGE:String = "onStateChange";
        public static const ON_SKILL_UPDATE:String = "onSKillUpdate";
        public static const ON_POSITION_CHANGE:String = "onPositionChange";
        public static const ON_CONTROL_MODEL_CHANGE:String = "onControlModelChange";
        public static const ON_LEARN_PASSIVE_SKILL:String = "onLearnPassiveSkill";
        public static const ON_LEARN_COST_SKILL:String = "onLearnCostSkill";
        public static const ON_PASSIVE_SKILL_NOTICE:String = "onPassiveSkillNotice";
        public static const ON_NEW_SKILL_CAN_LEARN:String = "onNewSkillCanLearn";
        public static const ON_SKILLS_UPDATE:String = "onSkillsUPdate";

        public var msgIconData:MsgIconData;
        public var isAddSkill:Boolean;

        public function SkillProxyEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_557()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_557 = " SkillProxyEvent" (String#15941)


