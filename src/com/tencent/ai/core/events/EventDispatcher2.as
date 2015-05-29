package com.tencent.ai.core.events
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;

    public class EventDispatcher2 extends EventDispatcher implements IEventDispatcher
    {

        protected var m_EventHandlers:Dictionary;
        protected var m_EventsMap:Dictionary;

        public function EventDispatcher2()
        {
            this.clear();
        }

		override public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
        {
            var events:Vector.<Function> = this.m_EventHandlers[type];
            if (events == null) {
                events = new Vector.<Function>();
                this.m_EventHandlers[type] = events;
            }
            var dict:Dictionary = this.m_EventsMap[type];
            if (dict == null) {
                dict = new Dictionary(true);
                this.m_EventsMap[type] = dict;
            }
            if (dict[listener] == undefined) {
                events.splice(0, 0, listener);
                dict[listener] = true;
            }
        }

		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
        {
            var events:Vector.<Function> = this.m_EventHandlers[type];
            if (events != null) {
	            var index:int = events.indexOf(listener);
                if (index != -1) {
                    events.splice(index, 1);
                }
            }
            var dict:Dictionary = this.m_EventsMap[type];
            if (dict != null) {
                delete dict[listener];
            }
        }

		override public function dispatchEvent(event:Event):Boolean
        {
            var events:Vector.<Function> = this.m_EventHandlers[event.type];
            if (events != null) {
	            var len:int = events.length - 1;
                while (len >= 0) {
                    events[len](event);
                    len--;
                }
                return true;
            }
            return false;
        }

        override public function hasEventListener(type:String):Boolean
        {
            var events:Vector.<Function> = this.m_EventHandlers[type];
            return events && events.length;
        }

        override public function willTrigger(type:String):Boolean
        {
            return false;
        }

        public function clear():void
        {
            this.m_EventHandlers = new Dictionary();
            this.m_EventsMap = new Dictionary();
        }

    }
}
