// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.MissionTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.MissionEvent;
    import  ©init._SafeStr_1341;

    public class MissionTriggerEvent extends BaseTriggerEvent 
    {

        private var _phaseID:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this._phaseID = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.mission.addEventListener(MissionEvent.PHASE_COMPLETE, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.mission.removeEventListener(MissionEvent.PHASE_COMPLETE, this.onEvent);
        }

        private function onEvent(_arg_1:MissionEvent):void
        {
            if (_arg_1.phase.id == this._phaseID){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1341()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1341 = " MissionTriggerEvent" (String#17723)


