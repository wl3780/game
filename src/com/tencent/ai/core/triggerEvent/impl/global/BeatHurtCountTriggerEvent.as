// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.BeatHurtCountTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DMGMetersEvent;
    import  ©init._SafeStr_1317;

    public class BeatHurtCountTriggerEvent extends BaseTriggerEvent 
    {

        private var _count:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this._count = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.combatSystem.getDmgMeters().addEventListener(DMGMetersEvent.ON_BEAT_HURT_CHANGE, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.combatSystem.getDmgMeters().removeEventListener(DMGMetersEvent.ON_BEAT_HURT_CHANGE, this.onEvent);
        }

        private function onEvent(_arg_1:DMGMetersEvent):void
        {
            if (int(_arg_1.hitCombo) == this._count){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1317()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1317 = " BeatHurtCountTriggerEvent" (String#15359)


