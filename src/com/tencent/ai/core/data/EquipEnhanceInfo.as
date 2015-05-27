// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipEnhanceInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_250;
    import __AS3__.vec.*;

    public class EquipEnhanceInfo implements IXMLSerialize, ISerialize 
    {

        public var equipRate:int;
        public var equipID:int;
        public var equipEnhanceBasicInfo:EquipEnhanceBasicInfo;
        public var equipPropsVect:Vector.<EquipAttribExtend>;
        public var equipMaterialVect:Vector.<EquipAttribExtend>;


        public function decode(_arg_1:XML):void
        {
            var _local_3:XML;
            var _local_4:EquipAttribExtend;
            this.equipRate = _arg_1.@rate;
            this.equipID = _arg_1.@id;
            this.equipEnhanceBasicInfo = new EquipEnhanceBasicInfo();
            this.equipEnhanceBasicInfo.equipLevel = _arg_1.feature.@avatar_level;
            this.equipEnhanceBasicInfo.equipType = _arg_1.feature.@avatar_type;
            this.equipEnhanceBasicInfo.equipRarity = _arg_1.feature.@avatar_lack;
            this.equipEnhanceBasicInfo.equipEnhanceLevel = _arg_1.feature.@str_lvl;
            this.equipPropsVect = new Vector.<EquipAttribExtend>();
            var _local_2:int = _arg_1.str_attri.length();
            var _local_5:int;
            while (_local_5 < _local_2) {
                _local_3 = _arg_1.str_attri[_local_5];
                _local_4 = new EquipAttribExtend();
                _local_4.type = _local_3.@data_type;
                _local_4.data_1 = _local_3.@data_1;
                _local_4.data_2 = _local_3.@data_2;
                this.equipPropsVect.push(_local_4);
                _local_5++;
            };
            this.equipMaterialVect = new Vector.<EquipAttribExtend>();
            _local_2 = _arg_1.award.length();
            _local_5 = 0;
            while (_local_5 < _local_2) {
                _local_3 = _arg_1.award[_local_5];
                _local_4 = new EquipAttribExtend();
                _local_4.type = _local_3.@type;
                _local_4.data_1 = _local_3.@data_1;
                _local_4.data_2 = _local_3.@data_2;
                this.equipMaterialVect.push(_local_4);
                _local_5++;
            };
        }

        public function encode()
        {
            return ("");
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:EquipAttribExtend;
            var _local_3:int;
            this.equipRate = _arg_1.readShort();
            this.equipID = _arg_1.readUnsignedInt();
            this.equipEnhanceBasicInfo = new EquipEnhanceBasicInfo();
            this.equipEnhanceBasicInfo.equipLevel = _arg_1.readUnsignedInt();
            this.equipEnhanceBasicInfo.equipType = _arg_1.readUnsignedInt();
            this.equipEnhanceBasicInfo.equipRarity = _arg_1.readUnsignedInt();
            this.equipEnhanceBasicInfo.equipEnhanceLevel = _arg_1.readUnsignedInt();
            this.equipPropsVect = new Vector.<EquipAttribExtend>();
            var _local_4:int = _arg_1.readUnsignedInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = new EquipAttribExtend();
                _local_2.type = _arg_1.readUnsignedInt();
                _local_2.data_1 = _arg_1.readUnsignedInt();
                _local_2.data_2 = _arg_1.readUnsignedInt();
                this.equipPropsVect.push(_local_2);
                _local_3++;
            };
            this.equipMaterialVect = new Vector.<EquipAttribExtend>();
            _local_4 = _arg_1.readUnsignedInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = new EquipAttribExtend();
                _local_2.type = _arg_1.readUnsignedInt();
                _local_2.data_1 = _arg_1.readUnsignedInt();
                _local_2.data_2 = _arg_1.readUnsignedInt();
                this.equipMaterialVect.push(_local_2);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:EquipAttribExtend;
            var _local_3:int;
            _arg_1.writeShort(this.equipRate);
            _arg_1.writeUnsignedInt(this.equipID);
            _arg_1.writeUnsignedInt(this.equipEnhanceBasicInfo.equipLevel);
            _arg_1.writeUnsignedInt(this.equipEnhanceBasicInfo.equipType);
            _arg_1.writeUnsignedInt(this.equipEnhanceBasicInfo.equipRarity);
            _arg_1.writeUnsignedInt(this.equipEnhanceBasicInfo.equipEnhanceLevel);
            var _local_4:int = this.equipPropsVect.length;
            _arg_1.writeUnsignedInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = this.equipPropsVect[_local_3];
                _arg_1.writeUnsignedInt(_local_2.type);
                _arg_1.writeUnsignedInt(_local_2.data_1);
                _arg_1.writeUnsignedInt(_local_2.data_2);
                _local_3++;
            };
            _local_4 = this.equipMaterialVect.length;
            _arg_1.writeUnsignedInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = this.equipMaterialVect[_local_3];
                _arg_1.writeUnsignedInt(_local_2.type);
                _arg_1.writeUnsignedInt(_local_2.data_1);
                _arg_1.writeUnsignedInt(_local_2.data_2);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_250()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_250 = " EquipEnhanceInfo" (String#14597)


