package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.data.ConditionInfo;
    import com.tencent.ai.core.manager.key.GameKeyManager;

    public class KeyBoardTypeCondition extends Condition 
    {

        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int;
            if (m_info.args.length == 1){
                _local_3 = int(m_info.args[0]);
                m_flag = (GameKeyManager.Current.getKeyboardType() == _local_3);
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

    }
}
