// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.DeadLieState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_8;

    public class DeadLieState extends HurtState 
    {

        protected var m_gotoHell:CFunction;
        protected var m_isCall:Boolean;

        public function DeadLieState(_arg_1:IAcceptHurtAction, _arg_2:CFunction)
        {
            super(_arg_1);
            this.m_gotoHell = _arg_2;
            this.m_isCall = false;
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            if (!this.m_isCall){
                this.m_isCall = true;
                initParams();
                m_view.setMotionID(MotionDef.MT_LIE_GOT_UP);
                this.m_gotoHell.invoke();
            };
            return (NULL);
        }

        override public function end():void
        {
            this.m_isCall = false;
            super.end();
        }

        public /*  ©init. */ function _SafeStr_8()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_8 = " DeadLieState" (String#15737)


