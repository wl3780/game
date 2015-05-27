// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PlayerInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.actor.model.SkillModel;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.CareerTypeDef;
    import  ©init._SafeStr_311;

    public class PlayerInfo extends ActorInfo 
    {

        public var RThurtDmg:int = 0;
        public var RTcomboTimes:int = 0;
        public var RTlatestComboTime:int = 0;
        public var RTminComboTime:int = 2000;
        public var RTghostFlag:Boolean = false;
        public var RTLatestUseSkill:SkillModel = null;
        public var isFake:Boolean;
        public var RTServerDead:Boolean;
        public var isFull:Boolean = true;
        public var playerID:PlayerID;
        public var vKey:int = -1;
        public var p2pKey:String = "";
        public var ethnicID:int;
        public var ethnicInfo:EthnicInfo;
        public var equipsID:PlayerEquipsID;
        public var career:CareerInfo;
        public var sublime:Boolean;
        public var pkWinRound:int;
        public var fortressExp:int;
        public var fortressPower:int;
        public var fortressFlag:int;
        public var pkTotalRound:int;
        public var match_pk_win_round:int;
        public var match_pk_total_round:int;
        public var mood:int;
        public var playerFlag:uint;
        public var skills:Vector.<SkillModel>;
        public var teamTag:TeamTagInfo;
        public var vipInfo:VipSimpleInfo;
        public var followPetInfo:PetInfo;
        public var pokeBallId:uint;
        public var pkLevel:int;
        public var pkRefuse:Boolean;
        public var payData:PayData;
        public var hasJoin:Boolean;
        public var fightingCapacity:uint;
        public var familyInfo:FamilyInfo;


        public function updateEquip(_arg_1:int, _arg_2:EquipItemInfo):void
        {
            var _local_3:WeaponInfo;
            this.equipsID.update(_arg_1, _arg_2);
            this.equipsID.careerType = this.getCareerType();
            if (_arg_1 == PlayerEquipsID.WEAPON_I){
                _local_3 = this.equipsID.weaponInfo;
                weapon_hurt_eid = _local_3.hurt_eid;
                weapon_create_id = _local_3.create_id;
                weapon_hurt_Type = _local_3.hurtType;
            };
        }

        public function getTitle():String
        {
            var _local_1:String;
            if (this.sublime){
                _local_1 = this.career.getSublimeCareerName();
            } else {
                if (!this.hasJoin){
                    _local_1 = (this.career.careeName + ".新兵");
                } else {
                    _local_1 = this.career.careeName;
                };
            };
            return (_local_1);
        }

        public function getCareerType():int
        {
            if (this.sublime){
                return (CareerTypeDef.JOIN_TEAM);
            };
            if (this.career.getFullCareerIDs().length > 1){
                return (CareerTypeDef.JOIN_TEAM);
            };
            if (this.hasJoin){
                return (CareerTypeDef.JOIN_TEAM);
            };
            return (CareerTypeDef.NONE);
        }

        public /*  ©init. */ function _SafeStr_311()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_311 = " PlayerInfo" (String#16679)


