// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.events.TaskEvent

package com.tencent.free.core.events
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.ProgressEvent;
    import com.tencent.free.core.manager.content.IContent;
    import  ©init._SafeStr_9;

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

        public function TaskEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            var _local_1:TaskEvent = new TaskEvent(type, bubbles, cancelable);
            _local_1.key = this.key;
            _local_1.content = this.content;
            _local_1.url = this.url;
            _local_1.bytesTotal = this.bytesTotal;
            _local_1.bytesLoaded = this.bytesLoaded;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_9()
        {
        }


    }
}//package com.tencent.free.core.events

// _SafeStr_9 = " TaskEvent" (String#1550)


