package com.tencent.free.core.events
{
    import flash.events.Event;

    public class SwfLoadEvent extends Event 
    {

        public static const PROGRESS:String = "progress";
        public static const ERROR:String = "error";
        public static const COMPLETE:String = "complete";
		
        public static const CODE_IO_ERROR:int = -1;
        public static const CODE_SECURITY_ERROR:int = -2;
        public static const CODE_CHECK_ERROR:int = -3;
        public static const CODE_SUCCESS:int = 0;

        public var code:int = 0;
        public var key:String;
        public var url:String;
        public var bytesLoaded:int;
        public var bytesTotal:int;
        public var message:String;

        public function SwfLoadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

    }
}
