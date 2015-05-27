// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.CaptiveNormalState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.enum.CaptiveAttackIDDef;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_7;

    public class CaptiveNormalState extends HurtState 
    {

        public function CaptiveNormalState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            initParams();
            m_view.stop();
            if ((((m_target.mapY > 0)) && (!((_arg_1.attackID == CaptiveAttackIDDef.IN_ADSORB_ID))))){
                m_target.jump(1500);
            };
            return (HurtState.NULL);
        }

        public function canFloatState():Boolean
        {
            return (!((m_action.target.getParentContainer() == null)));
        }

        public /*  ©init. */ function _SafeStr_7()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_7 = " CaptiveNormalState" (String#14930)


