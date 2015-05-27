// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.BeThrowNormalState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_6;

    public class BeThrowNormalState extends HurtState 
    {

        public function BeThrowNormalState(_arg_1:IAcceptHurtAction)
        {
            super(_arg_1);
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            return (HurtState.FLOAT);
        }

        public /*  ©init. */ function _SafeStr_6()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_6 = " BeThrowNormalState" (String#17057)


