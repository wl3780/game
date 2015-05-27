// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.AfterCmdCallTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.free.core.events.FreeEvent;
    import  ©init._SafeStr_1314;

    public class AfterCmdCallTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_eventStr:String;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 1)))){
                this.m_eventStr = String(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.free.addEventListener(FreeEvent.ON_AFTER_CMD_CALL, this.onAfterCmdCall);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.free.removeEventListener(FreeEvent.ON_AFTER_CMD_CALL, this.onAfterCmdCall);
        }

        private function onAfterCmdCall(_arg_1:FreeEvent):void
        {
            if (this.m_eventStr.indexOf(_arg_1.data.cmdType) != -1){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1314()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1314 = " AfterCmdCallTriggerEvent" (String#16898)


