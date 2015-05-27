// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.events.SetupEvent

package com.tencent.free.setup.events
{
    import flash.events.Event;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_59;

    public class SetupEvent extends Event 
    {

        public static const ERROR:String = "error";
        public static const PROGRESS:String = "progress";
        public static const INFO_CHANGE:String = "infoChange";
        public static const SUCCESS:String = "success";

        public var fileTotal:int;
        public var fileLoaded:int;
        public var currentPercent:int;
        public var message:String;
        public var data:Dictionary;

        public function SetupEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            var _local_1:SetupEvent = new SetupEvent(this.type);
            _local_1.fileTotal = this.fileTotal;
            _local_1.fileLoaded = this.fileLoaded;
            _local_1.currentPercent = this.currentPercent;
            _local_1.message = this.message;
            _local_1.data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_59()
        {
        }


    }
}//package com.tencent.free.setup.events

// _SafeStr_59 = " SetupEvent" (String#1499)


