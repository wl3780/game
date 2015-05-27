// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_BasePetInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.PetSkillInfo;
    import com.tencent.ai.core.data.WarSoulInfo;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_876;
    import __AS3__.vec.*;

    public class P_BasePetInfo implements ISerialize 
    {

        public static var P:P_BasePetInfo = new (P_BasePetInfo)();

        public var data:PetInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:PetSkillInfo;
            var _local_6:WarSoulInfo;
            if (this.data == null){
                this.data = new PetInfo();
            };
            this.data.petID = _arg_1.readUnsignedInt();
            this.data.petSID = _arg_1.readUnsignedInt();
            this.data.attr_wave = _arg_1.readUnsignedInt();
            this.data.nickname = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.data.level = _arg_1.readUnsignedShort();
            this.data.exp = _arg_1.readUnsignedInt();
            this.data.aptitude = _arg_1.readUnsignedByte();
            this.data.rareRank = _arg_1.readUnsignedByte();
            this.data.evolePhase = _arg_1.readUnsignedByte();
            this.data.hungry = _arg_1.readUnsignedShort();
            this.data.catchTime = _arg_1.readUnsignedInt();
            this.data.trait = _arg_1.readUnsignedShort();
            var _local_3:int = _arg_1.readUnsignedShort();
            this.data.battleSkills = new Vector.<PetSkillInfo>();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2 = new PetSkillInfo();
                ReadIn(_arg_1, _local_2, P_PetSkillInfo);
                this.data.battleSkills.push(_local_2);
                _local_4++;
            };
            _local_3 = _arg_1.readUnsignedShort();
            this.data.serviceSkills = new Vector.<PetSkillInfo>();
            _local_4 = 0;
            while (_local_4 < _local_3) {
                _local_2 = new PetSkillInfo();
                ReadIn(_arg_1, _local_2, P_PetSkillInfo);
                this.data.serviceSkills.push(_local_2);
                _local_4++;
            };
            this.data.extraState = _arg_1.readUnsignedInt();
            this.data.nextSkillIndex = _arg_1.readUnsignedShort();
            this.data.nextSkillID = _arg_1.readUnsignedInt();
            this.data.numWarSoul = _arg_1.readUnsignedShort();
            this.data.warSoulList = new Vector.<WarSoulInfo>();
            _local_4 = 0;
            while (_local_4 < this.data.numWarSoul) {
                _local_6 = new WarSoulInfo();
                _local_6.read(_arg_1);
                this.data.warSoulList[_local_4] = _local_6;
                _local_4++;
            };
            var _local_5:int = (5 - this.data.numWarSoul);
            if (_local_5 > 0){
                while (_local_5--) {
                    this.data.warSoulList.push(new WarSoulInfo());
                };
            };
            this.data.warSoulList.fixed = true;
            this.data.guardState = _arg_1.readUnsignedByte();
            this.data.staticInfo = DEFINE.DM.getMonsterStaticInfo(this.data.petID);
            if (((!((this.data.petID == 0))) && (!(this.data.staticInfo)))){
                throw (new Error((("ID 为 " + this.data.petID) + " 的宠物，没有对应的怪物。")));
            };
            this.data.petStaticInfo = DEFINE.DM.getPetStaticInfo(this.data.petID);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_876()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_876 = " P_BasePetInfo" (String#14120)


