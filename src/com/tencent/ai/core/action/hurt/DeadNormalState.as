// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.DeadNormalState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_9;

    public class DeadNormalState extends HurtState 
    {

        public function DeadNormalState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            var _local_3:SkillInfo;
            var _local_4:int;
            var _local_2:int = HurtState.NULL;
            if (_arg_1 != null){
                _local_3 = _arg_1.skillInfo;
                _local_4 = _local_3.powerY;
                if ((((_local_4 > 0)) || (!((m_action.target.mapY == 0))))){
                    _local_2 = HurtState.FLOAT;
                } else {
                    _local_2 = HurtState.LIE;
                };
            } else {
                if (m_action.target.mapY != 0){
                    _local_2 = HurtState.FLOAT;
                } else {
                    _local_2 = HurtState.LIE;
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_9()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_9 = " DeadNormalState" (String#17777)


