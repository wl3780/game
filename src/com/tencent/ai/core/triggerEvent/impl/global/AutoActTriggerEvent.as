// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.AutoActTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.events.GlobalActorEvent;
    import  ©init._SafeStr_1316;

    public class AutoActTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_ActID:int;
        protected var m_eventStr:String;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 2)))){
                this.m_ActID = int(_arg_1.args[0]);
                this.m_eventStr = String(_arg_1.args[1]);
            };
        }

        override public function activate():void
        {
            super.activate();
            var _local_1:IEventDispatcher = AICore.actorDispatcher;
            if (_local_1 != null){
                _local_1.addEventListener(GlobalActorEvent.ON_AUTO_ACT_BREAK, this.onAutoActEvent);
                _local_1.addEventListener(GlobalActorEvent.ON_AUTO_ACT_END, this.onAutoActEvent);
            };
        }

        override public function inactivate():void
        {
            super.inactivate();
            var _local_1:IEventDispatcher = AICore.actorDispatcher;
            if (_local_1 != null){
                _local_1.removeEventListener(GlobalActorEvent.ON_AUTO_ACT_BREAK, this.onAutoActEvent);
                _local_1.removeEventListener(GlobalActorEvent.ON_AUTO_ACT_END, this.onAutoActEvent);
            };
        }

        private function onAutoActEvent(_arg_1:GlobalActorEvent):void
        {
            if (_arg_1.data == this.m_ActID){
                if (this.m_eventStr.indexOf(_arg_1.type) != -1){
                    fireEvent();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1316()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1316 = " AutoActTriggerEvent" (String#16577)


