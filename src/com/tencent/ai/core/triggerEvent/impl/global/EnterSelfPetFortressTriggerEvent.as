// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.EnterSelfPetFortressTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.data.PlayerID;
    import  ©init._SafeStr_1328;

    public class EnterSelfPetFortressTriggerEvent extends BaseTriggerEvent 
    {


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
        }

        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ON_ENTER_PET_FORTRESS, this.onEnterPetFortress);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_ENTER_PET_FORTRESS, this.onEnterPetFortress);
        }

        private function onEnterPetFortress(_arg_1:AIEvent):void
        {
            if ((_arg_1.data.player as PlayerID).equal(AICore.data.mainModel.playerInfo.playerID)){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1328()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1328 = " EnterSelfPetFortressTriggerEvent" (String#17477)


