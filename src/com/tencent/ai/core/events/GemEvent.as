// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.GemEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import com.tencent.ai.core.data.EquipItemInfo;
    import  ©init._SafeStr_539;

    public class GemEvent extends Event 
    {

        public static const GEM_COMBIN_COMPLETE:String = "gemCombinComplete";
        public static const GEM_PUNCH_COMPLETE:String = "gemPunchComplete";
        public static const GEM_UPGRADE_COMPLETE:String = "gemUpgradeComplete";
        public static const GEM_EMBED_COMPLETE:String = "gemEmbedComplete";
        public static const GEM_DISMANTLE_COMPLETE:String = "gemDismantleComplete";

        public var manipulatedGem:EquipItemInfo;
        public var holeIndex:int = -1;
        public var isSuccess:Boolean;

        public function GemEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        override public function clone():Event
        {
            return (new GemEvent(type));
        }

        override public function toString():String
        {
            return (formatToString("GemEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }

        public /*  ©init. */ function _SafeStr_539()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_539 = " GemEvent" (String#16961)


