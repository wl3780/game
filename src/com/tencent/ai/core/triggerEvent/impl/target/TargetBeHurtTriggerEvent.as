// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.TargetBeHurtTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.events.ElementEvent;
    import  ©init._SafeStr_1357;

    public class TargetBeHurtTriggerEvent extends BaseTriggerEvent 
    {

        private var _target:BaseElement;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1, _arg_2);
            this._target = (((_arg_2)!=null) ? _arg_2.target : null);
        }

        override public function finalize():void
        {
            this.inactivate();
            this._target = null;
            super.finalize();
        }

        override public function activate():void
        {
            if (!m_isActive){
                super.activate();
                this._target.addEventListener(ElementEvent.ON_BEFORE_HURT, this.onBeHurt);
            };
        }

        override public function inactivate():void
        {
            if (m_isActive){
                this._target.removeEventListener(ElementEvent.ON_BEFORE_HURT, this.onBeHurt);
                super.inactivate();
            };
        }

        protected function onBeHurt(_arg_1:ElementEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1357()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1357 = " TargetBeHurtTriggerEvent" (String#15473)


