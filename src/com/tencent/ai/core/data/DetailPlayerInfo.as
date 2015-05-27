// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DetailPlayerInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.PCheckVIPDetailInfoReq;
    import  ©init._SafeStr_231;

    public class DetailPlayerInfo extends PlayerInfo 
    {

        public var pve_exp:int;
        public var pk_exp:int;
        public var fatigue_val:int;
        public var golden_coin:int;
        public var revive_coin:int;
        public var merit_val:int;
        public var pk_win_point:int;
        public var pk_lvl:int;
        public var pk_lvl_exp_begin:int;
        public var pk_lvl_exp_end:int;
        public var military_rank:int;
        public var golden_coin_limit:int;
        public var backpack:BackpackInfo;
        public var zoneBuffs:Vector.<ZoneBuff>;
        public var petPack:PetPack;
        public var petStorage:PetStorage;
        public var petExtraBaseInfo:PetExtraBaseInfo;
        public var coupons:uint;
        public var score:uint;
        public var petGroupExp:int;
        public var vipDetailInfo:PCheckVIPDetailInfoReq;


        public /*  ©init. */ function _SafeStr_231()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_231 = " DetailPlayerInfo" (String#17123)


