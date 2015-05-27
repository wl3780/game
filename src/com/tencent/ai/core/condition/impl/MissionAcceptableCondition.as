// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.MissionAcceptableCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_91;

    public class MissionAcceptableCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int;
            var _local_4:Boolean;
            var _local_5:Boolean;
            if (m_info.args.length == 2){
                _local_3 = int(m_info.args[0]);
                _local_4 = (int(m_info.args[1]) == 1);
                _local_5 = AICore.mission.checkMissionAcceptable(_local_3);
                m_flag = (_local_4 == _local_5);
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_91()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_91 = " MissionAcceptableCondition" (String#14192)


