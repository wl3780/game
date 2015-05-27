// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.utils.IExternalizable;
    import __AS3__.vec.Vector;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_253;
    import __AS3__.vec.*;

    public class EquipStaticInfo extends ItemStaticInfo implements IXMLSerialize, IExternalizable 
    {

        public var avatarType:int;
        public var posType:int;
        public var grade:int;
        public var suitID:int;
        public var avatarShowID:int;
        public var rare:int;
        public var strLimit:int;
        public var attackRate:int;
        public var maxWear:int;
        public var repairCost:int;
        public var careerID:int;
        public var baseAttrib:Vector.<EquipAttribPair>;
        public var strAttrib:Vector.<EquipAttribPair>;
        public var extendAttrib:Vector.<EquipAttribPair>;
        public var isAttriWave:Boolean;
        public var strFixSize:int;
        public var extFixSize:int;
        public var addSkillDatas:Vector.<EquipAddSkillData>;


        override public function decode(_arg_1:XML):void
        {
            var _local_5:EquipAddSkillData;
            super.decode(_arg_1);
            this.avatarType = int(_arg_1.@avatar_type);
            this.posType = int(_arg_1.@avatar_pos_type);
            this.suitID = int(_arg_1.@suit_id);
            this.rare = int(_arg_1.@lack_level);
            this.grade = int(_arg_1.@quality_level);
            this.strLimit = int(_arg_1.@str_limit_level);
            this.attackRate = int(_arg_1.@attack_rate);
            this.maxWear = int(_arg_1.@maxDur);
            this.repairCost = int(_arg_1.@repair_cost);
            this.careerID = int(_arg_1.@ethnicID);
            this.baseAttrib = this.decodeAttrib(_arg_1.base_attri_data);
            this.strAttrib = this.decodeAttrib(_arg_1.str_attri_data);
            this.extendAttrib = this.decodeAttrib(_arg_1.app_attri_data);
            this.avatarShowID = int(_arg_1.@show_src_id);
            this.isAttriWave = (int(_arg_1.@attri_wave) == 1);
            this.strFixSize = int(_arg_1.@str_attri_fix_size);
            this.extFixSize = int(_arg_1.@app_attri_fix_size);
            var _local_2:XMLList = _arg_1.add_skill_data;
            var _local_3:int = _local_2.length();
            this.addSkillDatas = new Vector.<EquipAddSkillData>();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = new EquipAddSkillData();
                _local_5.decode(_local_2[_local_4]);
                this.addSkillDatas.push(_local_5);
                _local_4++;
            };
        }

        private function decodeAttrib(_arg_1:XMLList):Vector.<EquipAttribPair>
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:XML;
            var _local_6:EquipAttribPair;
            var _local_2:Vector.<EquipAttribPair> = new Vector.<EquipAttribPair>();
            _local_4 = _arg_1.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = _arg_1[_local_3];
                _local_6 = new EquipAttribPair();
                _local_6.type = int(_local_5.@data_type);
                _local_6.data = int(_local_5.@data_1);
                _local_2.push(_local_6);
                _local_3++;
            };
            return (_local_2);
        }

        public function encode()
        {
            return (null);
        }

        public function toString():String
        {
            var _local_1:Array = [id, name, type, this.maxWear, description];
            return (_local_1.toString());
        }

        override public function writeExternal(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:EquipAddSkillData;
            super.writeExternal(_arg_1);
            _arg_1.writeInt(this.avatarType);
            _arg_1.writeInt(this.posType);
            _arg_1.writeInt(this.suitID);
            _arg_1.writeInt(this.rare);
            _arg_1.writeInt(this.grade);
            _arg_1.writeInt(this.strLimit);
            _arg_1.writeInt(this.attackRate);
            _arg_1.writeInt(this.maxWear);
            _arg_1.writeInt(this.repairCost);
            _arg_1.writeInt(this.careerID);
            this.writeExternalAttrib(this.baseAttrib, _arg_1);
            this.writeExternalAttrib(this.strAttrib, _arg_1);
            this.writeExternalAttrib(this.extendAttrib, _arg_1);
            _arg_1.writeInt(this.avatarShowID);
            _arg_1.writeBoolean(this.isAttriWave);
            _arg_1.writeInt(this.strFixSize);
            _arg_1.writeInt(this.extFixSize);
            var _local_2:int = this.addSkillDatas.length;
            _arg_1.writeUnsignedInt(_local_2);
            while (_local_3 < _local_2) {
                _local_4 = this.addSkillDatas[_local_3];
                _local_4.writeExternal(_arg_1);
                _local_3++;
            };
        }

        private function writeExternalAttrib(_arg_1:Vector.<EquipAttribPair>, _arg_2:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:EquipAttribPair;
            _local_4 = _arg_1.length;
            _arg_2.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = _arg_1[_local_3];
                _local_5.writeExternal(_arg_2);
                _local_3++;
            };
        }

        override public function readExternal(_arg_1:IDataInput):void
        {
            var _local_3:EquipAddSkillData;
            super.readExternal(_arg_1);
            this.avatarType = _arg_1.readInt();
            this.posType = _arg_1.readInt();
            this.suitID = _arg_1.readInt();
            this.rare = _arg_1.readInt();
            this.grade = _arg_1.readInt();
            this.strLimit = _arg_1.readInt();
            this.attackRate = _arg_1.readInt();
            this.maxWear = _arg_1.readInt();
            this.repairCost = _arg_1.readInt();
            this.careerID = _arg_1.readInt();
            this.baseAttrib = this.readExternalAttrib(_arg_1);
            this.strAttrib = this.readExternalAttrib(_arg_1);
            this.extendAttrib = this.readExternalAttrib(_arg_1);
            this.avatarShowID = _arg_1.readInt();
            this.isAttriWave = _arg_1.readBoolean();
            this.strFixSize = _arg_1.readInt();
            this.extFixSize = _arg_1.readInt();
            this.addSkillDatas = new Vector.<EquipAddSkillData>();
            var _local_2:int = _arg_1.readUnsignedInt();
            while (_local_2--) {
                _local_3 = new EquipAddSkillData();
                _local_3.readExternal(_arg_1);
                this.addSkillDatas.push(_local_3);
            };
        }

        private function readExternalAttrib(_arg_1:IDataInput):Vector.<EquipAttribPair>
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:EquipAttribPair;
            var _local_2:Vector.<EquipAttribPair> = new Vector.<EquipAttribPair>();
            _local_4 = _arg_1.readInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = new EquipAttribPair();
                _local_5.readExternal(_arg_1);
                _local_2.push(_local_5);
                _local_3++;
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_253()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_253 = " EquipStaticInfo" (String#14774)


