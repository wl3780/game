// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssev.SSEV_TriggerEvent

package com.tencent.ai.core.status.impl.ssev
{
    import com.tencent.ai.core.triggerEvent.ITriggerEvent;
    import com.tencent.ai.core.triggerEvent.TriggerEventBuilder;
    import com.tencent.ai.core.events.TriggerEvent;
    import com.tencent.ai.core.data.StatusEventInfo;
    import  ©init._SafeStr_1274;

    public class SSEV_TriggerEvent extends SSEV_Base 
    {

        protected var m_triggerEvent:ITriggerEvent;


        override public function initialize(_arg_1:StatusEventInfo):void
        {
            super.initialize(_arg_1);
            this.m_triggerEvent = TriggerEventBuilder.BUILD(_arg_1.triggerEventInfo, {"target":m_target});
            this.m_triggerEvent.addEventListener(TriggerEvent.ON_TRIGGER, executeSSEffects);
            this.m_triggerEvent.activate();
        }

        override public function finalize():void
        {
            this.m_triggerEvent.removeEventListener(TriggerEvent.ON_TRIGGER, executeSSEffects);
            this.m_triggerEvent.finalize();
            this.m_triggerEvent = null;
            super.finalize();
        }

        public /*  ©init. */ function _SafeStr_1274()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssev

// _SafeStr_1274 = " SSEV_TriggerEvent" (String#17291)


