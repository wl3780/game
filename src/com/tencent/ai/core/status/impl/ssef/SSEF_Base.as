// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_Base

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.status.IStatusEffect;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.StatusEffectInfo;
    import  ©init._SafeStr_1264;

    public class SSEF_Base implements IStatusEffect 
    {

        protected var m_sstatus:ISpecialStatus;
        protected var m_target:BaseActor;
        protected var m_info:StatusEffectInfo;
        protected var m_type:int;


        public function setSStatus(_arg_1:ISpecialStatus):void
        {
            this.m_sstatus = _arg_1;
            this.m_target = (_arg_1.getTarget() as BaseActor);
        }

        public function getSStatus():ISpecialStatus
        {
            return (this.m_sstatus);
        }

        public function initialize(_arg_1:StatusEffectInfo):void
        {
            this.m_info = _arg_1;
            this.m_type = (((_arg_1)!=null) ? _arg_1.type : 0);
        }

        public function finalize():void
        {
            this.m_info = null;
            this.m_sstatus = null;
            this.m_target = null;
        }

        public function execute():void
        {
        }

        public function getType():int
        {
            return (this.m_type);
        }

        public /*  ©init. */ function _SafeStr_1264()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1264 = " SSEF_Base" (String#14285)


