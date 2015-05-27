// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent

package com.tencent.ai.core.triggerEvent.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.triggerEvent.ITriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.events.TriggerEvent;
    import  ©init._SafeStr_1359;

    public class BaseTriggerEvent extends EventDispatcher2 implements ITriggerEvent 
    {

        protected var m_info:TriggerEventInfo;
        protected var m_isActive:Boolean;
        protected var m_event:TriggerEvent;


        public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            this.m_info = _arg_1;
            this.m_event = new TriggerEvent(TriggerEvent.ON_TRIGGER);
            this.m_event.setTarget(this);
            this.m_isActive = false;
        }

        public function finalize():void
        {
            this.inactivate();
            this.m_info = null;
        }

        public function activate():void
        {
            this.m_isActive = true;
        }

        public function inactivate():void
        {
            this.m_isActive = false;
        }

        public function isActive():Boolean
        {
            return (this.m_isActive);
        }

        public function fireEvent(_arg_1:Object=null):void
        {
            this.m_event.data = _arg_1;
            dispatchEvent(this.m_event);
        }

        public /*  ©init. */ function _SafeStr_1359()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl

// _SafeStr_1359 = " BaseTriggerEvent" (String#13658)


