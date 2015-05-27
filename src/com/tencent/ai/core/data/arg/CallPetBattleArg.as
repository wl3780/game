// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallPetBattleArg

package com.tencent.ai.core.data.arg
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.protocol.data.P_GameFriendInfo;
    import  ©init._SafeStr_186;

    public class CallPetBattleArg 
    {

        public static const ONLY_IN_PET_FORTRESS_ARRAY:Array = [PET_BATTLE_ATTACK, PET_BUILDING_START, PET_BUILDING_UPDATE, PET_FEEDS, PET_INVADE_RECORD, PET_INVADE_COUNT, PET_INVADE_OR_NOT];
        public static const PET_BATTLE_ATTACK:int = 1;
        public static const PET_SPECIAL_BATTLE_ATTACK:int = 101;
        public static const PET_BATTLE_DEFEND:int = 2;
        public static const PET_BUILDING_START:int = 3;
        public static const PET_BUILDING_UPDATE:int = 4;
        public static const PET_EXP:int = 5;
        public static const PET_FEEDS:int = 6;
        public static const PET_INVADE_RECORD:int = 7;
        public static const PET_INVADE_COUNT:int = 8;
        public static const PET_INVADE_OR_NOT:int = 9;
        public static const PET_SELECT_COMMON:int = 10;
        public static const NOTICE_TYPE_EVENT_LISTENER_BROADCAST:int = 1;
        public static const NOTICE_TYPE_EXTEONSION_CALL:int = 2;
        public static const PET_SELECT_BATTLE:int = 11;
        public static const PET_GUARD:int = 11;
        public static const PET_MULTI_SELECT:int = 12;
        public static const PET_SELECT_WINDOW_CLOSE:int = 99;
        public static const COMFIRM_CLOSE:int = 666;
        public static const CMDCALL_CLOSE:int = 888;
        public static const MAX_BATTLE_PET_NUM:uint = 3;

        public var noticeType:int;
        public var type:int;
        public var closeType:int = 666;
        public var param:Object;
        public var callPulginName:String;
        public var attackPetSIDs:Vector.<uint>;
        public var attackPetInfos:Vector.<PetInfo>;
        public var defendPetSIDs:Vector.<uint>;
        public var defendPetInfos:Vector.<PetInfo>;
        public var targetPlayerID:PlayerID;
        public var targetPlayerInfo:P_GameFriendInfo;
        public var attInvadersCount:uint;
        public var beInvadeCount:uint;
        public var defendPetGuardTimes:Vector.<uint>;
        public var defendPetGuardExp:Vector.<uint>;
        public var iconURL:String;
        public var buildingSID:uint;
        public var buildingTime:uint;
        public var lightSpeedNeedMoney:uint;
        public var battleReasult:uint;

        public function CallPetBattleArg()
        {
            this.noticeType = (NOTICE_TYPE_EVENT_LISTENER_BROADCAST | NOTICE_TYPE_EXTEONSION_CALL);
            super();
        }

        public /*  ©init. */ function _SafeStr_186()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_186 = " CallPetBattleArg" (String#15017)


