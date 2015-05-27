// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.DialogCloseTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import  ©init._SafeStr_1318;

    public class DialogCloseTriggerEvent extends BaseTriggerEvent 
    {


        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ON_DIALOG_CLOSE, this.onDialogClose);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_DIALOG_CLOSE, this.onDialogClose);
        }

        private function onDialogClose(_arg_1:AIEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1318()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1318 = " DialogCloseTriggerEvent" (String#14393)


