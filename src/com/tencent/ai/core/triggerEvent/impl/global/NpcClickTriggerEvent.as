// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.NpcClickTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.NpcEvent;
    import  ©init._SafeStr_1343;

    public class NpcClickTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_npcid:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this.m_npcid = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.npcSystem.getNpcManager().addEventListener(NpcEvent.NPC_CLICK, this.onNpcClick);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.npcSystem.getNpcManager().removeEventListener(NpcEvent.NPC_CLICK, this.onNpcClick);
        }

        private function onNpcClick(_arg_1:NpcEvent):void
        {
            if (_arg_1.npcID == this.m_npcid){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1343()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1343 = " NpcClickTriggerEvent" (String#13949)


