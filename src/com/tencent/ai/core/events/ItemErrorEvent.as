// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ItemErrorEvent

package com.tencent.ai.core.events
{
    import flash.events.TextEvent;
    import flash.events.Event;
    import  ©init._SafeStr_541;

    public class ItemErrorEvent extends TextEvent 
    {

        public static const ITEM_ERROR:String = "itemError";

        public function ItemErrorEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:String="")
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function clone():Event
        {
            return (new ItemErrorEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("ItemErrorEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }

        public /*  ©init. */ function _SafeStr_541()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_541 = " ItemErrorEvent" (String#15131)


