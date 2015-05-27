// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_CombatPetInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.data.PetSkillInfo;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import com.tencent.ai.core.data.AttributeInfo;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_878;
    import __AS3__.vec.*;

    public class P_CombatPetInfo implements ISerialize 
    {

        public static var P:P_CombatPetInfo = new (P_CombatPetInfo)();

        public var data:PetInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_6:SSModel;
            var _local_8:PetSkillInfo;
            if (this.data == null){
                this.data = new PetInfo();
            };
            this.data.petID = _arg_1.readUnsignedInt();
            this.data.petSID = _arg_1.readUnsignedInt();
            this.data.nickname = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.data.level = _arg_1.readUnsignedShort();
            this.data.aptitude = _arg_1.readUnsignedByte();
            this.data.rareRank = _arg_1.readUnsignedByte();
            this.data.evolePhase = _arg_1.readUnsignedByte();
            this.data.hungry = _arg_1.readUnsignedShort();
            this.data.catchTime = _arg_1.readUnsignedInt();
            this.data.trait = _arg_1.readUnsignedShort();
            ReadIn(_arg_1, this.data, P_CombatAttrib);
            var _local_2:int = _arg_1.readUnsignedShort();
            this.data.battleSkills = new Vector.<PetSkillInfo>();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_8 = new PetSkillInfo();
                ReadIn(_arg_1, _local_8, P_PetSkillInfo);
                this.data.battleSkills.push(_local_8);
                _local_3++;
            };
            this.data.extraState = _arg_1.readUnsignedInt();
            this.data.petState = _arg_1.readUnsignedShort();
            var _local_4:int = _arg_1.readUnsignedShort();
            var _local_5:P_SSModel = new P_SSModel();
            var _local_7:Vector.<SSModel> = new Vector.<SSModel>();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5.read(_arg_1);
                _local_6 = _local_5.data;
                _local_6.isBorn = true;
                _local_7.push(_local_6);
                _local_5.data = null;
                _local_3++;
            };
            this.data.bornSSmodels = _local_7;
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeUnsignedInt(0);
            XString.WriteChars(_arg_1, "abc", Constants.LEN_NICKNAME);
            _arg_1.writeShort(0);
            _arg_1.writeByte(0);
            _arg_1.writeByte(0);
            _arg_1.writeByte(0);
            _arg_1.writeShort(0);
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeShort(0);
            P_CombatAttrib.P.data = new AttributeInfo();
            P_CombatAttrib.P.write(_arg_1);
            P_CombatAttrib.P.data = null;
            _arg_1.writeShort(0);
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeShort(0);
            _arg_1.writeShort(0);
        }

        public function realWrite(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:P_SSModel;
            _arg_1.writeUnsignedInt(this.data.petID);
            _arg_1.writeUnsignedInt(this.data.petSID);
            XString.WriteChars(_arg_1, this.data.nickname, Constants.LEN_NICKNAME);
            _arg_1.writeShort(this.data.level);
            _arg_1.writeByte(this.data.aptitude);
            _arg_1.writeByte(this.data.rareRank);
            _arg_1.writeByte(this.data.evolePhase);
            _arg_1.writeShort(this.data.hungry);
            _arg_1.writeUnsignedInt(this.data.catchTime);
            _arg_1.writeShort(this.data.trait);
            P_CombatAttrib.P.data = this.data;
            P_CombatAttrib.P.write(_arg_1);
            P_CombatAttrib.P.data = null;
            _arg_1.writeShort(this.data.battleSkills.length);
            var _local_2:int;
            while (_local_2 < this.data.battleSkills.length) {
                P_PetSkillInfo.P.data = this.data.battleSkills[_local_2];
                P_PetSkillInfo.P.write(_arg_1);
                _local_2++;
            };
            _arg_1.writeUnsignedInt(this.data.extraState);
            _arg_1.writeShort(this.data.petState);
            if (this.data.bornSSmodels != null){
                _arg_1.writeShort(this.data.bornSSmodels.length);
                _local_3 = 0;
                while (_local_3 < this.data.bornSSmodels.length) {
                    _local_4 = new P_SSModel();
                    _local_4.data = this.data.bornSSmodels[_local_3];
                    _local_4.write(_arg_1);
                    _local_3++;
                };
            } else {
                _arg_1.writeShort(0);
            };
        }

        public /*  ©init. */ function _SafeStr_878()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_878 = " P_CombatPetInfo" (String#15581)


