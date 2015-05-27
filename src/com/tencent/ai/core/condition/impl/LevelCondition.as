// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.LevelCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_90;

    public class LevelCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int = int(m_info.args[0]);
            var _local_4:int = int(m_info.args[1]);
            var _local_5:int = AICore.data.mainModel.currentLevel;
            if ((((_local_5 >= _local_3)) && ((_local_5 <= _local_4)))){
                m_flag = true;
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_90()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_90 = " LevelCondition" (String#14801)


