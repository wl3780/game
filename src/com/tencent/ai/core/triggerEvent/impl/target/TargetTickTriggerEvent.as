// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.TargetTickTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import  ©init._SafeStr_1358;

    public class TargetTickTriggerEvent extends BaseTriggerEvent 
    {

        private var _times:int;
        private var _maxTimes:int;
        private var _target:BaseElement;


        protected function onTick(_arg_1:ElementEvent):void
        {
            this._times--;
            if (this._times <= 0){
                this._times = this._maxTimes;
                fireEvent();
            };
        }

        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1, _arg_2);
            this._maxTimes = int(_arg_1.args[0]);
            this._target = (((_arg_2)!=null) ? _arg_2.target : (null));
            this._times = ((((!((_arg_2 == null))) && (_arg_2.currentTimes))) ? _arg_2.currentTimes : this._maxTimes);
        }

        override public function finalize():void
        {
            this.inactivate();
            this._target = null;
            this._maxTimes = 0;
            super.finalize();
        }

        override public function activate():void
        {
            if (!m_isActive){
                super.activate();
                this._target.addEventListener(ElementEvent.ON_TICK, this.onTick);
            };
        }

        override public function inactivate():void
        {
            if (m_isActive){
                this._times = 0;
                this._target.removeEventListener(ElementEvent.ON_TICK, this.onTick);
                super.inactivate();
            };
        }

        public /*  ©init. */ function _SafeStr_1358()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1358 = " TargetTickTriggerEvent" (String#16550)


