// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.DupHaveGuildTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import  ©init._SafeStr_1322;

    public class DupHaveGuildTriggerEvent extends BaseTriggerEvent 
    {

        private var _guildStr:String;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this._guildStr = _arg_1.args[0];
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.Runtime.addEventListener(DupSpecialEvent.DUP_HAVE_GUILD, this.haveGuildHandler);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.Runtime.removeEventListener(DupSpecialEvent.DUP_HAVE_GUILD, this.haveGuildHandler);
        }

        private function haveGuildHandler(_arg_1:DupSpecialEvent):void
        {
            if (String(_arg_1.data) == this._guildStr){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1322()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1322 = " DupHaveGuildTriggerEvent" (String#16238)


