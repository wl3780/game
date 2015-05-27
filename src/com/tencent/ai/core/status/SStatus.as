package com.tencent.ai.core.status
{
    import flash.utils.Dictionary;

    public class SStatus 
    {
        public static var TRIGGER_EVENT_MAP:Dictionary;

        static var SSEVENT_TYPES:Dictionary;
        static var SSEFFECT_TYPES:Dictionary;

        public static function BUILD_SSEVENT(type:int):IStatusEvent
        {
            var cls:Class = SSEVENT_TYPES[type];
            if (cls != null) {
                return new cls() as IStatusEvent;
            }
            return null;
        }

        public static function BUILD_SSEFFECT(type:int):IStatusEffect
        {
            var cls:Class = SSEFFECT_TYPES[type];
            if (cls != null) {
                return new cls() as IStatusEffect;
            }
            return null;
        }

    }
}
