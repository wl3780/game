// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssev.SSEV_BehurtEvent

package com.tencent.ai.core.status.impl.ssev
{
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.data.StatusEventInfo;
    import  ©init._SafeStr_1272;

    public class SSEV_BehurtEvent extends SSEV_Base 
    {


        override public function initialize(_arg_1:StatusEventInfo):void
        {
            super.initialize(_arg_1);
            m_target.addEventListener(ElementEvent.ON_BEFORE_HURT, executeSSEffects);
        }

        override public function finalize():void
        {
            m_target.removeEventListener(ElementEvent.ON_BEFORE_HURT, executeSSEffects);
            super.finalize();
        }

        public /*  ©init. */ function _SafeStr_1272()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssev

// _SafeStr_1272 = " SSEV_BehurtEvent" (String#16148)


