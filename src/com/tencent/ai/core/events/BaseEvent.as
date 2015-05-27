package com.tencent.ai.core.events
{
    import flash.events.Event;

    public class BaseEvent extends Event 
    {

        public static const ON_ERROR:String = "onError";
        public static const ON_SUCCESS:String = "onSuccess";
        public static const ON_TIMEOUT:String = "onTimeOut";
        public static const ON_UPDATE:String = "onUpdate";
        public static const ON_ADD:String = "onAdd";
        public static const ON_REMOVE:String = "onRemove";

        public var message:String;
        public var data:Object;
		
        protected var m_target:Object;

        public function BaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

        public function setTarget(value:Object):void
        {
            this.m_target = value;
        }

        public function getTarget():Object
        {
            return this.m_target;
        }

        override public function clone():Event
        {
            var cls:Class = this["constructor"];
            var event:BaseEvent = new cls(this.type, bubbles, cancelable);
            event.data = this.data;
            event.message = this.message;
            event.setTarget(this.m_target);
            return event;
        }

    }
}
