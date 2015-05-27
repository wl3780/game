// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.MissionCommitCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_92;

    public class MissionCommitCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Boolean;
            var _local_6:Boolean;
            if (m_info.args.length == 3){
                _local_3 = int(m_info.args[0]);
                _local_4 = int(m_info.args[1]);
                _local_5 = (int(m_info.args[2]) == 1);
                _local_6 = AICore.mission.checkMissionCommitable(_local_3, _local_4);
                m_flag = (_local_5 == _local_6);
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_92()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_92 = " MissionCommitCondition" (String#13778)


