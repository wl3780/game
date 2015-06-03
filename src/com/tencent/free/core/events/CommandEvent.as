package com.tencent.free.core.events
{
    import flash.events.Event;

    public class CommandEvent extends Event 
    {

        public static var COMMAND_FINISHED:String = "commandFinished";
        public static var COMMAND_CANCELED:String = "commandCanceled";

        public function CommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

    }
}
