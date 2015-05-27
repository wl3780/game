// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.DupPetBeCatchTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import  ©init._SafeStr_1324;

    public class DupPetBeCatchTriggerEvent extends BaseTriggerEvent 
    {

        private var _monsterID:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this._monsterID = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.Runtime.addEventListener(DupSpecialEvent.DUP_PET_BE_CATCH, this.petBeCatchHandler);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.Runtime.removeEventListener(DupSpecialEvent.DUP_PET_BE_CATCH, this.petBeCatchHandler);
        }

        private function petBeCatchHandler(_arg_1:DupSpecialEvent):void
        {
            if ((((this._monsterID == 0)) || ((int(_arg_1.data) == this._monsterID)))){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1324()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1324 = " DupPetBeCatchTriggerEvent" (String#14369)


