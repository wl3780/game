// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PlayerEquipsID

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_309;

    public class PlayerEquipsID 
    {

        public static const WEAPON_I:int = 0;
        public static const BACK_I:int = 1;
        public static const CANNON_I:int = 2;
        public static const ENGINE1_I:int = 3;
        public static const ENGINE2_I:int = 4;
        public static const CHIP1_I:int = 5;
        public static const CHIP2_I:int = 6;
        public static const CPU1_I:int = 7;
        public static const CPU2_I:int = 8;
        public static const BADGE_I:int = 9;
        public static const FASHION_I:int = 10;

        public var playerID:PlayerID;
        public var ethnicID:int;
        public var weaponID:int = 0;
        public var backID:int = 0;
        public var fashionAvatarID:int = 0;
        public var weaponInfo:WeaponInfo;
        public var defaultWeaponInfo:WeaponInfo;
        public var careerID:int;
        public var careerLevel:int;
        public var careerType:int;
        protected var m_equips:Vector.<EquipItemInfo>;
        protected var m_WeaponAttrib:EquipItemInfo;

        public function PlayerEquipsID(_arg_1:PlayerID=null, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0, _arg_5:Vector.<EquipItemInfo>=null)
        {
            this.ethnicID = _arg_2;
            this.playerID = _arg_1;
            this.careerID = _arg_3;
            this.careerLevel = _arg_4;
            this.setEquips(_arg_5);
        }

        public static function IS_SHOW_POS(_arg_1:int):Boolean
        {
            return ((((((_arg_1 == WEAPON_I)) || ((_arg_1 == BACK_I)))) || ((_arg_1 == FASHION_I))));
        }


        protected function initEquips():void
        {
            if (this.weaponID == 0){
                this.weaponID = this.defaultWeaponInfo.id;
                this.m_WeaponAttrib = new EquipItemInfo();
                this.m_WeaponAttrib.id = this.weaponID;
                this.m_WeaponAttrib.staticInfo = this.defaultWeaponInfo;
                this.weaponInfo = this.defaultWeaponInfo;
                this.m_equips[WEAPON_I] = this.m_WeaponAttrib;
            };
            this.fashionAvatarID = (((this.m_equips[FASHION_I])!=null) ? this.m_equips[FASHION_I].id : 0);
            this.backID = (((this.m_equips[BACK_I] == null)) ? 0 : this.m_equips[BACK_I].id);
        }

        public function setDefaultWeapon(_arg_1:EquipStaticInfo):void
        {
            this.defaultWeaponInfo = (_arg_1 as WeaponInfo);
        }

        public function setEquips(_arg_1:Vector.<EquipItemInfo>):void
        {
            if (_arg_1 == null){
                return;
            };
            this.m_equips = _arg_1;
            this.m_WeaponAttrib = _arg_1[WEAPON_I];
            this.weaponID = this.m_WeaponAttrib.id;
            this.weaponInfo = (this.m_WeaponAttrib.staticInfo as WeaponInfo);
            this.initEquips();
        }

        public function update(_arg_1:int, _arg_2:EquipItemInfo):void
        {
            var _local_3:EquipItemInfo = this.m_equips[_arg_1];
            if (_arg_1 == WEAPON_I){
                this.m_equips[WEAPON_I] = _arg_2;
                this.weaponID = (((_arg_2)!=null) ? _arg_2.id : 0);
                this.weaponInfo = (((_arg_2)!=null) ? (_arg_2.staticInfo as WeaponInfo) : null);
            } else {
                this.m_equips[_arg_1] = _arg_2;
            };
            this.initEquips();
        }

        public function getBadgeShowID():int
        {
            var _local_1:int;
            var _local_2:EquipItemInfo = this.m_equips[PlayerEquipsID.BADGE_I];
            if (((!((_local_2 == null))) && (!((_local_2.equipStaticInfo == null))))){
                _local_1 = _local_2.equipStaticInfo.avatarShowID;
            };
            return (_local_1);
        }

        public function getEquips():Vector.<EquipItemInfo>
        {
            return (this.m_equips);
        }

        public /*  ©init. */ function _SafeStr_309()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_309 = " PlayerEquipsID" (String#15044)


