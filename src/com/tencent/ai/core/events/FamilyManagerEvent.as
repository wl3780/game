// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.FamilyManagerEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_536;

    public class FamilyManagerEvent extends Event 
    {

        public static const FAMILY_NOTIFY:String = "familyNotify";

        public var data:Object;

        public function FamilyManagerEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            var _local_1:FamilyManagerEvent = new FamilyManagerEvent(type, bubbles, cancelable);
            _local_1.data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_536()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_536 = " FamilyManagerEvent" (String#16619)


