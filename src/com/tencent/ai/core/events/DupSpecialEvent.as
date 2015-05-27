// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.DupSpecialEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_533;

    public class DupSpecialEvent extends Event 
    {

        public static const COUNT_DOWN_TIME_CHANGE:String = "countDownTimeChange";
        public static const MONSTER_NUM_CHANGE:String = "monsterNumChange";
        public static const KILL_MONSTER_TYPE:String = "killMonsterType";
        public static const DUP_MSG_TIP:String = "dupMsgTip";
        public static const DUP_COUNT_DOWN_START:String = "dupCountDownStart";
        public static const DUP_COUNT_DOWN_END:String = "dupCountDownEnd";
        public static const DUP_LEFT_MONSTER_NUM:String = "dupLeftMonsterNum";
        public static const DUP_END_EVENT:String = "dupEndEvent";
        public static const DUP_START_ACCOUNT:String = "dupStartAccount";
        public static const DUP_COUNT_TIP_START:String = "dupCountTipStart";
        public static const DUP_COUNT_TIP_END:String = "dupCountTipEnd";
        public static const DUP_HAVE_GUILD:String = "dupHaveGuild";
        public static const DUP_AGENT_ACTOR_CHANGE:String = "dupAgentActorChange";
        public static const DUP_ERROR_TIP:String = "dupErrorTip";
        public static const DUP_PET_BE_CATCH:String = "dupPetBeCatch";

        public var data:Object;

        public function DupSpecialEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            var _local_1:DupSpecialEvent = new DupSpecialEvent(type, bubbles, cancelable);
            _local_1.data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_533()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_533 = " DupSpecialEvent" (String#14981)


