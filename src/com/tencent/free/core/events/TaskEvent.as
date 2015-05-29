package com.tencent.free.core.events
{
    import com.tencent.free.core.manager.content.IContent;
    
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;

    public class TaskEvent extends Event 
    {

        public static const COMPLETE:String = Event.COMPLETE;//"complete"
        public static const IO_ERROR:String = IOErrorEvent.IO_ERROR;//"ioError"
        public static const SECURITY_ERROR:String = SecurityErrorEvent.SECURITY_ERROR;//"securityError"
        public static const CHECK_ERROR:String = "checkError";
        public static const PROGRESS:String = ProgressEvent.PROGRESS;//"progress"
        public static const TASK_END:String = "taskEnd";

        public var key:Object;
        public var content:IContent;
        public var url:String;
        public var bytesTotal:int;
        public var bytesLoaded:int;

        public function TaskEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

        override public function clone():Event
        {
            var event:TaskEvent = new TaskEvent(type, bubbles, cancelable);
            event.key = this.key;
            event.content = this.content;
            event.url = this.url;
            event.bytesTotal = this.bytesTotal;
            event.bytesLoaded = this.bytesLoaded;
            return event;
        }

    }
}
