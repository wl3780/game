// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.UpdateEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_564;

    public class UpdateEvent extends Event 
    {

        public static const UPDATE:String = "update_event";

        public var propName:String;

        public function UpdateEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            return (new UpdateEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("UpdateEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }

        public /*  ©init. */ function _SafeStr_564()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_564 = " UpdateEvent" (String#16145)


