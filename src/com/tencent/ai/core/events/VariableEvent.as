// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.VariableEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_565;

    public class VariableEvent extends BaseEvent 
    {

        public static const ON_MANAGER_UPDATE:String = "onManagerUpdate";
        public static const ON_VAR_UPDATE:String = "onVarUpdate";

        public function VariableEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_565()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_565 = " VariableEvent" (String#13736)


