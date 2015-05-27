// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.AssetLoadEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_526;

    public class AssetLoadEvent extends Event 
    {

        public static const COMPLETE:String = "complete";
        public static const ERROR:String = "error";
        public static const LOAD_PROCESS:String = "loadProcess";
        public static const READY_LOAD:String = "readyLoad";
        public static const SOUND_COMPLETE:String = "soundComplete";

        public var loadedItem:int;
        public var totalItem:int;
        public var bytesLoaded:int;
        public var bytesTotal:int;
        public var key:String;
        public var content:Object;
        public var code:int;
        public var message:String;

        public function AssetLoadEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            var _local_1:AssetLoadEvent = new AssetLoadEvent(type, bubbles, cancelable);
            _local_1.loadedItem = this.loadedItem;
            _local_1.totalItem = this.totalItem;
            _local_1.bytesLoaded = this.bytesLoaded;
            _local_1.bytesTotal = this.bytesTotal;
            _local_1.key = this.key;
            _local_1.content = this.content;
            _local_1.code = this.code;
            _local_1.message = this.message;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_526()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_526 = " AssetLoadEvent" (String#15164)


