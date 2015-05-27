// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.SpawnEventTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.events.MonsterEvent;
    import  ©init._SafeStr_1344;

    public class SpawnEventTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_pkID:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 1)))){
                this.m_pkID = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            var _local_1:IEventDispatcher = AICore.monsterSystem.getSpawnManager();
            if (_local_1 != null){
                _local_1.addEventListener(MonsterEvent.ON_SPAWN_MONSTER_COMPLETE, this.onSpawnMonsterEvent);
            };
        }

        override public function inactivate():void
        {
            super.inactivate();
            var _local_1:IEventDispatcher = AICore.monsterSystem.getSpawnManager();
            if (_local_1 != null){
                _local_1.removeEventListener(MonsterEvent.ON_SPAWN_MONSTER_COMPLETE, this.onSpawnMonsterEvent);
            };
        }

        private function onSpawnMonsterEvent(_arg_1:MonsterEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1344()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1344 = " SpawnEventTriggerEvent" (String#17711)


