package com.tencent.ai.core.triggerEvent
{
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.free.logging.error;
    
    import flash.utils.Dictionary;

    public class TriggerEventBuilder 
    {

        public static var TIGGER_EVENT_TYPES:Dictionary;

        private static var _INSTANCE:TriggerEventBuilder;

        public static function getInstance():TriggerEventBuilder
        {
            if (_INSTANCE == null) {
                _INSTANCE = new TriggerEventBuilder();
            }
            return _INSTANCE;
        }

        public static function BUILD(info:TriggerEventInfo, arg:Object=null):ITriggerEvent
        {
            return _INSTANCE.buildTriggerEvent(info, arg);
        }


        public function buildTriggerEvent(info:TriggerEventInfo, arg:Object=null):ITriggerEvent
        {
            var event:ITriggerEvent;
            var cls:Class = TIGGER_EVENT_TYPES[info.type];
            if (cls) {
                event = new cls();
                event.initialize(info, arg);
            } else {
                error("找不到TriggerEvent对应Cls type=", info.type);
            }
            return event;
        }

        public function breakTriggerEvent(event:ITriggerEvent):void
        {
            if (event) {
                event.finalize();
            }
        }

    }
}
