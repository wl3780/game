// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.MonsterEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_548;

    public class MonsterEvent extends BaseEvent 
    {

        public static const ON_MONSTER_ADDED:String = "onMonsterAdded";
        public static const ON_MONSTER_REMOVED:String = "onMonsterRemoved";
        public static const ON_ALL_BOSS_DEAD:String = "onAllBossDead";
        public static const ON_SPAWN_MONSTER_RESPONSE:String = "onSpawnMonsterResponse";
        public static const ON_SERVER_MONSTER_DEAD:String = "onServerMonsterDead";
        public static const ON_SPAWN_MONSTER_COMPLETE:String = "onSpawnMonsterComplete";

        public function MonsterEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_548()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_548 = " MonsterEvent" (String#15074)


