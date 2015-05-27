// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.NormalState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_14;

    public class NormalState extends HurtState 
    {

        public function NormalState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            var _local_4:SkillInfo;
            var _local_5:int;
            var _local_2:int = HurtState.NULL;
            var _local_3:HasActionElement = m_action.target;
            if (_arg_1 != null){
                _local_4 = _arg_1.skillInfo;
                _local_5 = _local_4.powerY;
                if (_local_5 > 0){
                    if (!_local_3.isAirElement()){
                        _local_2 = HurtState.FLOAT;
                    } else {
                        _local_2 = (((m_action.model.beHurtFloat == 1)) ? HurtState.FLOAT : HurtState.STIFF);
                    };
                } else {
                    if (((!((_local_3.mapY == 0))) && (!(_local_3.isAirElement())))){
                        _local_2 = HurtState.FLOAT;
                    } else {
                        if (m_action.view.getMotionID() == MotionDef.MT_LIE_GOT_UP){
                            _local_2 = HurtState.LIE;
                        } else {
                            _local_2 = HurtState.STIFF;
                        };
                    };
                };
            } else {
                if (((!((_local_3.mapY == 0))) && (!(_local_3.isAirElement())))){
                    _local_2 = HurtState.FLOAT;
                } else {
                    _local_2 = HurtState.LIE;
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_14()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_14 = " NormalState" (String#17696)


