// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.events.SwfLoadEvent

package com.tencent.free.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_8;

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

        public function SwfLoadEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_8()
        {
        }


    }
}//package com.tencent.free.core.events

// _SafeStr_8 = " SwfLoadEvent" (String#1373)


