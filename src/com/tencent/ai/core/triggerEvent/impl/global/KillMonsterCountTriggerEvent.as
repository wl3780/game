// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.KillMonsterCountTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import  ©init._SafeStr_1333;

    public class KillMonsterCountTriggerEvent extends BaseTriggerEvent 
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
            AICore.Runtime.addEventListener(DupSpecialEvent.MONSTER_NUM_CHANGE, this.monsterNumChangeHandler);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.Runtime.removeEventListener(DupSpecialEvent.MONSTER_NUM_CHANGE, this.monsterNumChangeHandler);
        }

        private function monsterNumChangeHandler(_arg_1:DupSpecialEvent):void
        {
            if (int(_arg_1.data) == this._count){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1333()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1333 = " KillMonsterCountTriggerEvent" (String#17459)


