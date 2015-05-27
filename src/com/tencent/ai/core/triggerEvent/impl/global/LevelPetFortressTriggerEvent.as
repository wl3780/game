// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.LevelPetFortressTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import  ©init._SafeStr_1339;

    public class LevelPetFortressTriggerEvent extends BaseTriggerEvent 
    {


        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ON_LEAVE_PET_FORTRESS, this.onLevelPetFortress);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_LEAVE_PET_FORTRESS, this.onLevelPetFortress);
        }

        private function onLevelPetFortress(_arg_1:AIEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1339()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1339 = " LevelPetFortressTriggerEvent" (String#15605)


