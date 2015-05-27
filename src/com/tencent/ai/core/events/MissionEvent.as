// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.MissionEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import com.tencent.ai.core.mission.MissionInfo;
    import com.tencent.ai.core.mission.PhaseInfo;
    import com.tencent.ai.core.data.ConditionStaticInfo;
    import  ©init._SafeStr_547;

    public class MissionEvent extends Event 
    {

        public static const MISSION_COMMITABLE:String = "missionCommitable";
        public static const MISSION_BEGIN:String = "missionBegin";
        public static const MISSION_COMPLETE:String = "missionComplete";
        public static const PHASE_COMPLETE:String = "phaseComplete";
        public static const PHASE_CONDITION_UPDATE:String = "phaseConditionUpdate";
        public static const PHASE_BEGIN:String = "phaseBegin";
        public static const PHASE_ISFINISH_CHANGE:String = "phaseIsfinishChange";
        public static const MISSION_STATE_CHANGE:String = "missionStateChange";
        public static const MISSION_PHASE_CHANGE:String = "missionPhaseChange";
        public static const MISSION_CAN_TRIGGER_CHANGE:String = "missionCanTriggerChange";
        public static const MISSION_VISIBLE_CHANGE:String = "missionVisibleChange";
        public static const NEW_TIP:String = "newTip";
        public static const SPECIAL_FLAG_CHANGE:String = "specialFlagChange";
        public static const CONDITION_DATA_CHANGE:String = "data";
        public static const CONDITION_FLAG_CHANGE:String = "flag";

        public var mission:MissionInfo;
        public var phase:PhaseInfo;
        public var condition:ConditionStaticInfo;
        public var conditionNum:int;
        public var conditionFlag:Boolean;

        public function MissionEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        override public function clone():Event
        {
            return (new MissionEvent(type));
        }

        override public function toString():String
        {
            return (formatToString("MissionEvent", "type"));
        }

        public /*  ©init. */ function _SafeStr_547()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_547 = " MissionEvent" (String#13862)


