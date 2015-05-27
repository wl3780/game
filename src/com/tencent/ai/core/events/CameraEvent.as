// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.CameraEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_528;

    public class CameraEvent extends Event 
    {

        public static const CHANGE:String = "change";

        public function CameraEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        override public function clone():Event
        {
            return (new CameraEvent(this.type));
        }

        public /*  ©init. */ function _SafeStr_528()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_528 = " CameraEvent" (String#14882)


