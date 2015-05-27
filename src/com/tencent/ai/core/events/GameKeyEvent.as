package com.tencent.ai.core.events
{

    public class GameKeyEvent extends BaseEvent 
    {

        public static const FK_DOWN_MAP:String = "fkDownMap";
        public static const FK_DOWN_SKILL:String = "fkDownSkill";
        public static const FK_DOWN_ROLE:String = "fkDownRole";
        public static const FK_DOWN_PACK:String = "fkDownPack";
        public static const FK_DOWN_MAINMSN:String = "fkDownMainMSN";
        public static const FK_DOWN_DAYMSN:String = "fkDownDayMSN";
        public static const FK_DOWN_WEEKMSN:String = "fkDownWeekMSN";
        public static const FK_DOWN_NEWS:String = "fkDownNews";
        public static const FK_DOWN_NEXTPAGE:String = "fkDownNextPage";
        public static const FK_DOWN_CHAT:String = "fkDownChat";
        public static const FK_DOWN_CANCEL:String = "fkDownCancel";
        public static const GAME_KEY_CHANGE:String = "fkCodeChange";

        public function GameKeyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

    }
}
