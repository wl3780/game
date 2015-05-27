// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.events.SOEvent

package com.tencent.free.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_7;

    public class SOEvent extends Event 
    {

        public static var SO_INIT_RESULT:String = "so_init_result";

        public var result:Boolean;
        public var data:Object;

        public function SOEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_7()
        {
        }


    }
}//package com.tencent.free.core.events

// _SafeStr_7 = " SOEvent" (String#1520)


