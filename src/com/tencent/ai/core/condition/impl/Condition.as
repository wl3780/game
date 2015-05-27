// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.Condition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.condition.ICondition;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_86;

    public class Condition extends EventDispatcher2 implements ICondition 
    {

        protected var m_info:ConditionInfo;
        protected var m_flag:Boolean;


        public function initialize(_arg_1:ConditionInfo, _arg_2:Object=null):Boolean
        {
            this.m_info = _arg_1;
            return (true);
        }

        public function finalize():void
        {
        }

        public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            return (this.m_flag);
        }

        public /*  ©init. */ function _SafeStr_86()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_86 = " Condition" (String#13670)


