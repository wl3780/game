// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.PlayEndTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import flash.events.IEventDispatcher;
    import flash.events.Event;
    import  ©init._SafeStr_1355;

    public class PlayEndTriggerEvent extends BaseTriggerEvent 
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
            var _local_1:IEventDispatcher;
            if (!m_isActive){
                super.activate();
                _local_1 = (this._target as IEventDispatcher);
                if (_local_1){
                    _local_1.addEventListener("playend", this.onPlayEnd);
                };
            };
        }

        override public function inactivate():void
        {
            var _local_1:IEventDispatcher;
            if (m_isActive){
                _local_1 = (this._target as IEventDispatcher);
                if (_local_1){
                    _local_1.removeEventListener("playend", this.onPlayEnd);
                };
                super.inactivate();
            };
        }

        protected function onPlayEnd(_arg_1:Event):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1355()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1355 = " PlayEndTriggerEvent" (String#14645)


