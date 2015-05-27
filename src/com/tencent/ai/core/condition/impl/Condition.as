package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.condition.ICondition;
    import com.tencent.ai.core.data.ConditionInfo;
    import com.tencent.ai.core.events.EventDispatcher2;

    public class Condition extends EventDispatcher2 implements ICondition 
    {

        protected var m_info:ConditionInfo;
        protected var m_flag:Boolean;

        public function initialize(info:ConditionInfo, arg:Object=null):Boolean
        {
            this.m_info = info;
            return true;
        }

        public function finalize():void
        {
        }

        public function check(info:ConditionInfo=null, arg:Object=null):Boolean
        {
            return this.m_flag;
        }

    }
}
