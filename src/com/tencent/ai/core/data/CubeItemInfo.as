// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.CubeItemInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_230;
    import __AS3__.vec.*;

    public class CubeItemInfo implements IXMLSerialize, ISerialize 
    {

        public var idx_type:int;
        public var onboard_flag:int;
        public var idx_id:int;
        public var id:int;
        public var materialVect:Vector.<EquipAttribExtend>;
        public var awardVect:Vector.<EquipAttribExtend>;


        public function decode(_arg_1:XML):void
        {
            var _local_3:XML;
            var _local_4:EquipAttribExtend;
            this.idx_type = _arg_1.@idx_type;
            this.onboard_flag = _arg_1.@onboard_flag;
            this.idx_id = _arg_1.@idx_id;
            this.id = _arg_1.@id;
            this.materialVect = new Vector.<EquipAttribExtend>();
            var _local_2:int = _arg_1.material.length();
            var _local_5:int;
            while (_local_5 < _local_2) {
                _local_3 = _arg_1.material[_local_5];
                _local_4 = new EquipAttribExtend();
                _local_4.type = _local_3.@type;
                _local_4.data_1 = _local_3.@data_1;
                _local_4.data_2 = _local_3.@data_2;
                this.materialVect.push(_local_4);
                _local_5++;
            };
            this.awardVect = new Vector.<EquipAttribExtend>();
            _local_2 = _arg_1.award.length();
            _local_5 = 0;
            while (_local_5 < _local_2) {
                _local_3 = _arg_1.award[_local_5];
                _local_4 = new EquipAttribExtend();
                _local_4.type = _local_3.@type;
                _local_4.data_1 = _local_3.@data_1;
                _local_4.data_2 = _local_3.@data_2;
                this.awardVect.push(_local_4);
                _local_5++;
            };
        }

        public function encode()
        {
            return ("");
        }

        public function getKeyStr():String
        {
            return (((this.idx_id + ",") + this.idx_type));
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:EquipAttribExtend;
            var _local_3:int;
            this.idx_type = _arg_1.readShort();
            this.onboard_flag = _arg_1.readByte();
            this.idx_id = _arg_1.readUnsignedInt();
            this.id = _arg_1.readUnsignedInt();
            this.materialVect = new Vector.<EquipAttribExtend>();
            var _local_4:int = _arg_1.readUnsignedInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = new EquipAttribExtend();
                _local_2.type = _arg_1.readUnsignedInt();
                _local_2.data_1 = _arg_1.readUnsignedInt();
                _local_2.data_2 = _arg_1.readUnsignedInt();
                this.materialVect.push(_local_2);
                _local_3++;
            };
            this.awardVect = new Vector.<EquipAttribExtend>();
            _local_4 = _arg_1.readUnsignedInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = new EquipAttribExtend();
                _local_2.type = _arg_1.readUnsignedInt();
                _local_2.data_1 = _arg_1.readUnsignedInt();
                _local_2.data_2 = _arg_1.readUnsignedInt();
                this.awardVect.push(_local_2);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:EquipAttribExtend;
            var _local_3:int;
            _arg_1.writeShort(this.idx_type);
            _arg_1.writeByte(this.onboard_flag);
            _arg_1.writeUnsignedInt(this.idx_id);
            _arg_1.writeUnsignedInt(this.id);
            var _local_4:int = this.materialVect.length;
            _arg_1.writeUnsignedInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = this.materialVect[_local_3];
                _arg_1.writeUnsignedInt(_local_2.type);
                _arg_1.writeUnsignedInt(_local_2.data_1);
                _arg_1.writeUnsignedInt(_local_2.data_2);
                _local_3++;
            };
            _local_4 = this.awardVect.length;
            _arg_1.writeUnsignedInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = this.awardVect[_local_3];
                _arg_1.writeUnsignedInt(_local_2.type);
                _arg_1.writeUnsignedInt(_local_2.data_1);
                _arg_1.writeUnsignedInt(_local_2.data_2);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_230()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_230 = " CubeItemInfo" (String#16346)


