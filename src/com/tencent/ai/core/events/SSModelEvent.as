﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.SSModelEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_558;

    public class SSModelEvent extends BaseEvent 
    {

        public static const ON_DURATION_CHANGE:String = "onDurationChange";

        public function SSModelEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_558()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_558 = " SSModelEvent" (String#14693)


