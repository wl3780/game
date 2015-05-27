// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.CareerWearStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.utils.IExternalizable;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_223;
    import __AS3__.vec.*;

    public class CareerWearStaticInfo implements IXMLSerialize, IExternalizable 
    {

        public var careerTypeLimit:int;
        public var careerID:int;
        public var level:int;
        public var name:String;
        public var upgradeLevelLimit:int;
        public var upgradeGoldCost:int;
        public var description:String;
        public var upgradeDesc:String;
        public var resourceID:int;
        public var attribs:Vector.<EquipAttribPair>;
        public var itemID:int;
        public var itemCount:int;


        public function decode(_arg_1:XML):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:XML;
            var _local_6:EquipAttribPair;
            this.careerTypeLimit = int(_arg_1.@career_type_limit);
            this.careerID = _arg_1.@career_id;
            this.level = _arg_1.@level;
            this.name = _arg_1.@name;
            this.upgradeLevelLimit = _arg_1.@upgrade_level_limit;
            this.upgradeGoldCost = _arg_1.@upgrade_gold_cost;
            this.description = _arg_1.@desc;
            this.upgradeDesc = _arg_1.@upgrade_desc;
            this.resourceID = _arg_1.@resource_id;
            this.attribs = new Vector.<EquipAttribPair>();
            var _local_2:XMLList = _arg_1.attr;
            _local_4 = _local_2.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = _local_2[_local_3];
                _local_6 = new EquipAttribPair();
                _local_6.type = _local_5.@type;
                _local_6.data = _local_5.@data;
                this.attribs.push(_local_6);
                _local_3++;
            };
            if (_arg_1.item_cost[0]){
                this.itemID = int(_arg_1.item_cost[0].@id);
                this.itemCount = int(_arg_1.item_cost[0].@count);
            } else {
                this.itemID = 0;
                this.itemCount = 0;
            };
        }

        public function encode()
        {
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            this.careerID = _arg_1.readInt();
            this.level = _arg_1.readInt();
            this.name = _arg_1.readUTF();
            this.upgradeLevelLimit = _arg_1.readInt();
            this.upgradeGoldCost = _arg_1.readInt();
            this.description = _arg_1.readUTF();
            this.upgradeDesc = _arg_1.readUTF();
            this.resourceID = _arg_1.readInt();
            this.attribs = this.readExternalAttrib(_arg_1);
            this.itemID = _arg_1.readInt();
            this.itemCount = _arg_1.readInt();
            this.careerTypeLimit = _arg_1.readUnsignedShort();
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

        public function writeExternal(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.careerID);
            _arg_1.writeInt(this.level);
            _arg_1.writeUTF(this.name);
            _arg_1.writeInt(this.upgradeLevelLimit);
            _arg_1.writeInt(this.upgradeGoldCost);
            _arg_1.writeUTF(this.description);
            _arg_1.writeUTF(this.upgradeDesc);
            _arg_1.writeInt(this.resourceID);
            this.writeExternalAttrib(this.attribs, _arg_1);
            _arg_1.writeInt(this.itemID);
            _arg_1.writeInt(this.itemCount);
            _arg_1.writeShort(this.careerTypeLimit);
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

        public /*  ©init. */ function _SafeStr_223()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_223 = " CareerWearStaticInfo" (String#17654)


