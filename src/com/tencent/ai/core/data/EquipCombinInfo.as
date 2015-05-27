// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipCombinInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_247;
    import __AS3__.vec.*;

    public class EquipCombinInfo implements IXMLSerialize, ISerialize 
    {

        public var itemID:int;
        public var shopID:int;
        public var exchangeID:int;
        public var exchangeIndex:int;
        public var exchangeEquipVect:Vector.<EquipAttribExtend>;


        public function decode(_arg_1:XML):void
        {
            var _local_3:XML;
            var _local_4:EquipAttribExtend;
            this.itemID = _arg_1.@item_id;
            this.shopID = _arg_1.@shop_id;
            this.exchangeID = _arg_1.@exchange_id;
            this.exchangeIndex = _arg_1.@exchange_idx;
            this.exchangeEquipVect = new Vector.<EquipAttribExtend>();
            var _local_2:int = _arg_1.Item.length();
            var _local_5:int;
            while (_local_5 < _local_2) {
                _local_3 = _arg_1.Item[_local_5];
                _local_4 = new EquipAttribExtend();
                _local_4.type = _local_3.@type;
                _local_4.data_1 = _local_3.@data_1;
                _local_4.data_2 = _local_3.@data_2;
                this.exchangeEquipVect.push(_local_4);
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
            this.itemID = _arg_1.readUnsignedInt();
            this.shopID = _arg_1.readUnsignedInt();
            this.exchangeID = _arg_1.readUnsignedInt();
            this.exchangeIndex = _arg_1.readShort();
            this.exchangeEquipVect = new Vector.<EquipAttribExtend>();
            var _local_4:int = _arg_1.readUnsignedInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = new EquipAttribExtend();
                _local_2.type = _arg_1.readUnsignedInt();
                _local_2.data_1 = _arg_1.readUnsignedInt();
                _local_2.data_2 = _arg_1.readUnsignedInt();
                this.exchangeEquipVect.push(_local_2);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:EquipAttribExtend;
            var _local_3:int;
            _arg_1.writeUnsignedInt(this.itemID);
            _arg_1.writeUnsignedInt(this.shopID);
            _arg_1.writeUnsignedInt(this.exchangeID);
            _arg_1.writeShort(this.exchangeIndex);
            var _local_4:int = this.exchangeEquipVect.length;
            _arg_1.writeUnsignedInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = this.exchangeEquipVect[_local_3];
                _arg_1.writeUnsignedInt(_local_2.type);
                _arg_1.writeUnsignedInt(_local_2.data_1);
                _arg_1.writeUnsignedInt(_local_2.data_2);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_247()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_247 = " EquipCombinInfo" (String#16385)


