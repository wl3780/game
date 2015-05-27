// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MonsterInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_276;

    public class MonsterInfo extends ActorInfo 
    {

        public var monsterID:int;
        public var indexID:uint;
        public var aiID:int;
        public var aiInfo:MonsterAIInfo;
        public var activateAI:Boolean = true;
        public var staticInfo:MonsterStaticInfo;
        public var masterElement:Object;
        public var refreshType:int;
        public var randomRaduis:int;
        public var appearActionID:int;
        public var disappearEID:int;
        public var masterID:PlayerID;
        public var masterIndex:int;
        public var maxLifeTime:uint = 0;
        public var currentLifeTime:uint = 0;
        public var deadReason:int = 1;
        public var catchable:Boolean = false;


        public /*  ©init. */ function _SafeStr_276()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_276 = " MonsterInfo" (String#14387)


