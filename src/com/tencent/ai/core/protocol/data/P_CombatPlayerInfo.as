// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_CombatPlayerInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.net.ProtocolHelper;
    import com.tencent.ai.core.data.EthnicInfo;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.data.WeaponInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.ai.core.data.PayData;
    import com.tencent.ai.core.data.FamilyInfo;
    import flash.utils.IDataInput;
    import flash.utils.ByteArray;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_879;
    import __AS3__.vec.*;

    public class P_CombatPlayerInfo implements ISerialize 
    {

        public static var P:P_CombatPlayerInfo = new (P_CombatPlayerInfo)();

        public var data:PlayerInfo;

        public function P_CombatPlayerInfo(_arg_1:PlayerInfo=null)
        {
            this.data = _arg_1;
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_18:SSModel;
            var _local_22:P_SkillInfo;
            var _local_23:SkillGroup;
            var _local_24:SkillModel;
            if (this.data == null){
                this.data = new PlayerInfo();
            };
            var _local_2:IDataManager = DEFINE.DM;
            var _local_5:PlayerID = new PlayerID();
            _local_5.read(_arg_1);
            this.data.playerID = _local_5;
            this.data.id = _local_5.uin;
            this.data.name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            if (this.data.playerID.uin == ProtocolHelper.clientPlayerID.uin){
                this.data.isMain = true;
            };
            this.data.level = _arg_1.readUnsignedShort();
            _local_3 = _arg_1.readUnsignedInt();
            this.data.career = _local_2.getCareerInfo(_local_3);
            this.data.sublime = _arg_1.readBoolean();
            _local_4 = _local_2.getEthnicID(_local_3);
            this.data.ethnicID = _local_4;
            var _local_6:EthnicInfo = _local_2.getEthnicInfo(_local_4);
            this.data.ethnicInfo = _local_6;
            ReadIn(_arg_1, this.data, P_CombatAttrib);
            var _local_7:int = _arg_1.readByte();
            var _local_8:PlayerEquipsID = new PlayerEquipsID(this.data.playerID, _local_4, _local_3, _local_7);
            this.data.equipsID = _local_8;
            var _local_9:P_PlayerEquipsID = new P_PlayerEquipsID(_local_8, _local_6);
            _local_9.dm = _local_2;
            _local_9.read(_arg_1);
            var _local_10:WeaponInfo = _local_8.weaponInfo;
            this.data.weapon_hurt_eid = _local_10.hurt_eid;
            this.data.weapon_create_id = _local_10.create_id;
            this.data.weapon_hurt_Type = _local_10.hurtType;
            var _local_11:Vector.<SkillModel> = new Vector.<SkillModel>();
            var _local_12:Vector.<SkillGroup> = _local_6.defaultSkills;
            var _local_13:int;
            while (_local_13 < _local_12.length) {
                _local_11.push(new SkillModel(_local_12[_local_13]));
                _local_13++;
            };
            var _local_14:int = _arg_1.readShort();
            if (_local_14 > 0){
                _local_22 = new P_SkillInfo();
                _local_13 = 0;
                while (_local_13 < _local_14) {
                    _local_22.read(_arg_1);
                    _local_23 = _local_2.getSkillGroup(_local_22.skillID);
                    if (_local_23 != null){
                        _local_24 = new SkillModel(_local_23);
                        _local_24.flag = _local_22.flag;
                        _local_24.baseSkillID = _local_22.baseSkillID;
                        _local_11.push(_local_24);
                    };
                    _local_13++;
                };
            };
            this.data.skills = _local_11;
            this.data.mood = _arg_1.readUnsignedByte();
            var _local_15:Vector.<SSModel> = new Vector.<SSModel>();
            var _local_16:int = _arg_1.readUnsignedShort();
            var _local_17:P_SSModel = new P_SSModel();
            _local_13 = 0;
            while (_local_13 < _local_16) {
                _local_17.read(_arg_1);
                _local_18 = _local_17.data;
                _local_18.isBorn = true;
                _local_15.push(_local_18);
                _local_17.data = null;
                _local_13++;
            };
            this.data.bornSSmodels = _local_15;
            var _local_19:PetInfo = new PetInfo();
            ReadIn(_arg_1, _local_19, P_CombatPetInfo);
            if (_local_19.petID != 0){
                this.data.followPetInfo = _local_19;
            };
            var _local_20:VipSimpleInfo = new VipSimpleInfo();
            _local_20.read(_arg_1);
            this.data.vipInfo = _local_20;
            this.data.pokeBallId = _arg_1.readUnsignedInt();
            this.data.groupID = _arg_1.readUnsignedInt();
            this.data.pkLevel = _arg_1.readUnsignedShort();
            this.data.payData = new PayData();
            this.data.payData.read(_arg_1);
            this.data.hasJoin = !(_arg_1.readBoolean());
            this.data.equipsID.careerType = this.data.getCareerType();
            var _local_21:FamilyInfo = new FamilyInfo();
            _local_21.read(_arg_1);
            this.data.familyInfo = _local_21;
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_5:ByteArray;
            var _local_7:String;
            var _local_8:int;
            var _local_9:int;
            this.data.playerID.write(_arg_1);
            XString.WriteChars(_arg_1, this.data.name, Constants.LEN_NICKNAME);
            _arg_1.writeShort(this.data.level);
            _arg_1.writeUnsignedInt(this.data.career.careerID);
            _arg_1.writeBoolean(false);
            new P_CombatAttrib(this.data).write(_arg_1);
            _arg_1.writeByte(this.data.equipsID.careerLevel);
            new P_PlayerEquipsID(this.data.equipsID, null).write(_arg_1);
            var _local_2:Vector.<SkillModel> = this.data.skills;
            var _local_3:int = (((_local_2 == null)) ? 0 : _local_2.length);
            var _local_4:int;
            if (_local_3 > 0){
                _local_5 = new ByteArray();
                _local_7 = (("," + this.data.ethnicInfo.defaultSkillIDsStr) + ",");
                _local_8 = 0;
                while (_local_8 < _local_3) {
                    _local_9 = _local_2[_local_8].skillID;
                    if (_local_7.indexOf((("," + _local_9) + ",")) == -1){
                        _local_5.writeByte(0);
                        _local_5.writeUnsignedInt(_local_9);
                        _local_5.writeUnsignedInt(0);
                        _local_4++;
                    };
                    _local_8++;
                };
            };
            _arg_1.writeShort(_local_4);
            if (_local_4 != 0){
                _arg_1.writeBytes(_local_5);
            };
            _arg_1.writeByte(this.data.mood);
            _arg_1.writeShort(0);
            P_CombatPetInfo.P.write(_arg_1);
            _arg_1.writeByte(0);
            _arg_1.writeByte(0);
            _arg_1.writeUnsignedInt(this.data.pokeBallId);
            _arg_1.writeUnsignedInt(this.data.groupID);
            _arg_1.writeShort(this.data.pkLevel);
            new PayData().write(_arg_1);
            _arg_1.writeBoolean(false);
            var _local_6:FamilyInfo = new FamilyInfo();
            _local_6.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_879()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_879 = " P_CombatPlayerInfo" (String#16457)


