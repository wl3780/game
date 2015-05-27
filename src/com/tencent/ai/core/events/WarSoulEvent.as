// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.WarSoulEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_566;

    public class WarSoulEvent extends Event 
    {

        public static const CHANGE:String = "change";
        public static const CREATE:String = "create";
        public static const LEVEL_UP:String = "levelUp";
        public static const MOVE_COMPLETE:String = "moveComplete";
        public static const EMBED_COMPLETE:String = "embedComplete";

        public var warSoulSID:int;
        public var result:int;

        public function WarSoulEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_566()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_566 = " WarSoulEvent" (String#15728)


