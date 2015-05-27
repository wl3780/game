// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.ItemInteractTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import  ©init._SafeStr_1332;

    public class ItemInteractTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_itemid:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 1)))){
                this.m_itemid = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ITEM_INTERACT, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ITEM_INTERACT, this.onEvent);
        }

        private function onEvent(_arg_1:AIEvent):void
        {
            if ((((((-1 == this.m_itemid)) || ((0 == this.m_itemid)))) || ((int(_arg_1.data) == this.m_itemid)))){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1332()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1332 = " ItemInteractTriggerEvent" (String#15788)


