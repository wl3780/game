// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.AlphaClickTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import  ©init._SafeStr_1315;

    public class AlphaClickTriggerEvent extends BaseTriggerEvent 
    {


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
        }

        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ON_PET_FORTRESS_ALPHA_CLICKED, this.onNpcClick);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_PET_FORTRESS_ALPHA_CLICKED, this.onNpcClick);
        }

        private function onNpcClick(_arg_1:AIEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1315()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1315 = " AlphaClickTriggerEvent" (String#13694)


