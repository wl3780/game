// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.GoldenCoinCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_87;

    public class GoldenCoinCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if (m_info.args.length == 2){
                _local_3 = int(m_info.args[0]);
                _local_4 = int(m_info.args[1]);
                _local_5 = AICore.data.mainModel.currentGoldenCoin;
                if (_local_3 == 0){
                    if (_local_5 >= _local_4){
                        m_flag = true;
                    } else {
                        m_flag = false;
                    };
                } else {
                    if (_local_5 <= _local_4){
                        m_flag = true;
                    } else {
                        m_flag = false;
                    };
                };
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_87()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_87 = " GoldenCoinCondition" (String#16130)


