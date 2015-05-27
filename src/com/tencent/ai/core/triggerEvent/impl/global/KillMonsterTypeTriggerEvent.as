// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.KillMonsterTypeTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import  ©init._SafeStr_1335;

    public class KillMonsterTypeTriggerEvent extends BaseTriggerEvent 
    {

        private var _type:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this._type = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.Runtime.addEventListener(DupSpecialEvent.KILL_MONSTER_TYPE, this.onEvent);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.Runtime.removeEventListener(DupSpecialEvent.KILL_MONSTER_TYPE, this.onEvent);
        }

        private function onEvent(_arg_1:DupSpecialEvent):void
        {
            if (int(_arg_1.data) == this._type){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1335()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1335 = " KillMonsterTypeTriggerEvent" (String#17255)


