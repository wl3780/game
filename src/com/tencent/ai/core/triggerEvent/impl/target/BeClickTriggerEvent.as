// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.BeClickTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.display.IDisplay;
    import flash.events.MouseEvent;
    import  ©init._SafeStr_1347;

    public class BeClickTriggerEvent extends BaseTriggerEvent 
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
            var _local_1:IDisplay;
            if (!m_isActive){
                super.activate();
                if (this._target){
                    _local_1 = this._target.getDisplay();
                    if (_local_1){
                        _local_1.addEventListener(MouseEvent.CLICK, this.onClick);
                    };
                };
            };
        }

        override public function inactivate():void
        {
            var _local_1:IDisplay;
            if (m_isActive){
                if (this._target){
                    _local_1 = this._target.getDisplay();
                    if (_local_1){
                        _local_1.removeEventListener(MouseEvent.CLICK, this.onClick);
                    };
                };
                super.inactivate();
            };
        }

        protected function onClick(_arg_1:MouseEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1347()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1347 = " BeClickTriggerEvent" (String#17771)


