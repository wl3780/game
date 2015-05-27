// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_297;

    public class PetInfo extends MonsterInfo 
    {

        public var isMainPet:Boolean = false;
        public var petID:uint;
        public var petSID:uint;
        public var attr_wave:uint;
        public var nickname:String;
        public var exp:uint;
        public var originExp:uint;
        public var maxExp:uint;
        public var aptitude:int;
        public var rareRank:int;
        public var evolePhase:int;
        public var catchTime:uint;
        public var trait:int;
        public var battleSkills:Vector.<PetSkillInfo>;
        public var serviceSkills:Vector.<PetSkillInfo>;
        public var extraState:uint;
        public var nextSkillIndex:uint;
        public var nextSkillID:uint;
        public var nextSkillLevel:uint;
        public var numWarSoul:int;
        public var warSoulList:Vector.<WarSoulInfo>;
        public var guardState:uint;
        public var petStaticInfo:PetStaticInfo;
        public var playerID:PlayerID;
        public var petState:int;
        public var petMasterPos:MapPosition;


        public function updateInfo(_arg_1:PetInfo):void
        {
            this.nickname = _arg_1.nickname;
            level = _arg_1.level;
            this.aptitude = _arg_1.aptitude;
            this.rareRank = _arg_1.rareRank;
            this.evolePhase = _arg_1.evolePhase;
            hungry = _arg_1.hungry;
            this.catchTime = _arg_1.catchTime;
            this.trait = _arg_1.trait;
            updateAttributeInfo(_arg_1);
            this.battleSkills = _arg_1.battleSkills.concat();
            this.extraState = _arg_1.extraState;
            this.petState = _arg_1.petState;
            bornSSmodels = _arg_1.bornSSmodels.concat();
        }

        public /*  ©init. */ function _SafeStr_297()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_297 = " PetInfo" (String#14390)


