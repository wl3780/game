﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.MonsterModelEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_549;

    public class MonsterModelEvent extends BaseEvent 
    {

        public static const ON_SERVER_DEAD:String = "onServerDead";

        public function MonsterModelEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_549()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_549 = " MonsterModelEvent" (String#17054)


