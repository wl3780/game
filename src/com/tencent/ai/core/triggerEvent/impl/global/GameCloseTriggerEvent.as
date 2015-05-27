// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.GameCloseTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import  ©init._SafeStr_1329;

    public class GameCloseTriggerEvent extends BaseTriggerEvent 
    {

        private var _gameid:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this._gameid = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.CASUAL_GAME_CLOSE, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.CASUAL_GAME_CLOSE, this.onEvent);
        }

        private function onEvent(_arg_1:AIEvent):void
        {
            if ((((this._gameid == 0)) || ((this._gameid == int(_arg_1.arg))))){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1329()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1329 = " GameCloseTriggerEvent" (String#13661)


