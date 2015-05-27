// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_EquipItemInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.data.EquipAttribPair;
    import com.tencent.ai.core.data.EquipAttribExtend;
    import com.tencent.ai.core.data.ItemHoleInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipAddSkillData;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_884;
    import __AS3__.vec.*;

    public class P_EquipItemInfo implements ISerialize 
    {

        public static var P:P_EquipItemInfo = new (P_EquipItemInfo)();

        public var data:EquipItemInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_4:EquipAttribPair;
            var _local_5:int;
            var _local_9:EquipAttribExtend;
            var _local_10:ItemHoleInfo;
            this.data = new EquipItemInfo();
            this.data.serialID = _arg_1.readUnsignedInt();
            var _local_2:int = _arg_1.readUnsignedInt();
            this.data.id = _local_2;
            this.data.wear = _arg_1.readUnsignedInt();
            this.data.grade = _arg_1.readByte();
            this.data.strengthen = _arg_1.readByte();
            var _local_3:Vector.<EquipAttribPair> = new Vector.<EquipAttribPair>();
            var _local_6:int;
            while (_local_6 < 2) {
                _local_5 = _arg_1.readUnsignedShort();
                if (_local_5 > 0){
                    _local_4 = new EquipAttribPair();
                    _local_4.type = _local_5;
                    _local_4.data = _arg_1.readUnsignedShort();
                    _local_3.push(_local_4);
                } else {
                    _arg_1.readUnsignedShort();
                };
                _local_6++;
            };
            this.data.baseAttrib = _local_3;
            _local_3 = new Vector.<EquipAttribPair>();
            _local_6 = 0;
            while (_local_6 < 2) {
                _local_5 = _arg_1.readUnsignedShort();
                if (_local_5 > 0){
                    _local_4 = new EquipAttribPair();
                    _local_4.type = _local_5;
                    _local_4.data = _arg_1.readUnsignedShort();
                    _local_3.push(_local_4);
                } else {
                    _arg_1.readUnsignedShort();
                };
                _local_6++;
            };
            this.data.strAttrib = _local_3;
            var _local_7:Vector.<EquipAttribExtend> = new Vector.<EquipAttribExtend>();
            _local_6 = 0;
            while (_local_6 < 4) {
                _local_5 = _arg_1.readUnsignedShort();
                if (_local_5 > 0){
                    _local_9 = new EquipAttribExtend();
                    _local_9.type = _local_5;
                    _local_9.data_1 = _arg_1.readUnsignedInt();
                    _local_9.data_2 = _arg_1.readUnsignedShort();
                    _local_7.push(_local_9);
                } else {
                    _arg_1.readUnsignedInt();
                    _arg_1.readUnsignedShort();
                };
                _local_6++;
            };
            this.data.extendAttrib = _local_7;
            this.data.gettime = _arg_1.readUnsignedInt();
            this.data.expiryTime = _arg_1.readUnsignedInt();
            this.data.slot = _arg_1.readUnsignedShort();
            var _local_8:int = _arg_1.readUnsignedShort();
            this.data.holes = new Vector.<ItemHoleInfo>();
            _local_6 = 0;
            while (_local_6 < _local_8) {
                _local_10 = new ItemHoleInfo();
                _local_10.read(_arg_1);
                this.data.holes[_local_6] = _local_10;
                _local_6++;
            };
            this.data.enhanceBless = _arg_1.readUnsignedInt();
            this.data.addSkillData = new EquipAddSkillData();
            this.data.addSkillData.readExternal(_arg_1);
            if (_local_2 != 0){
                this.data.staticInfo = DEFINE.DM.getItemStaticInfo(_local_2);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeByte(0);
            _arg_1.writeByte(0);
            var _local_2:int;
            while (_local_2 < 2) {
                _arg_1.writeShort(0);
                _arg_1.writeShort(0);
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < 2) {
                _arg_1.writeShort(0);
                _arg_1.writeShort(0);
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < 4) {
                _arg_1.writeShort(0);
                _arg_1.writeUnsignedInt(0);
                _arg_1.writeShort(0);
                _local_2++;
            };
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeUnsignedInt(0);
            _arg_1.writeShort(0);
            _arg_1.writeShort(0);
            _arg_1.writeUnsignedInt(0);
            var _local_3:EquipAddSkillData = new EquipAddSkillData();
            _local_3.writeExternal(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_884()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_884 = " P_EquipItemInfo" (String#15917)


