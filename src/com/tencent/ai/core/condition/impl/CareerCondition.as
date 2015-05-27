// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.CareerCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_85;

    public class CareerCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if (m_info.args.length == 2){
                _local_3 = int(m_info.args[0]);
                _local_4 = int(m_info.args[1]);
                _local_5 = AICore.data.mainModel.careerInfo.careerID;
                if (_local_3 == 1){
                    m_flag = (_local_5 == _local_4);
                } else {
                    m_flag = !((_local_5 == _local_4));
                };
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_85()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_85 = " CareerCondition" (String#13673)


