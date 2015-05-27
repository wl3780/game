// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PStoreBoxData

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_EquipItemInfo;
    import com.tencent.ai.core.protocol.data.P_ItemInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1033;
    import __AS3__.vec.*;

    public class PStoreBoxData implements ISerialize 
    {

        public var level:uint;
        public var size:uint;
        public var avatarLen:uint;
        public var avatars:Vector.<P_EquipItemInfo>;
        public var itemLen:uint;
        public var items:Vector.<P_ItemInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:P_EquipItemInfo;
            var _local_4:P_ItemInfo;
            this.level = _arg_1.readUnsignedByte();
            this.size = _arg_1.readUnsignedShort();
            this.avatarLen = _arg_1.readUnsignedShort();
            this.avatars = new Vector.<P_EquipItemInfo>();
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < this.avatarLen) {
                _local_3 = new P_EquipItemInfo();
                _local_3.read(_arg_1);
                this.avatars.push(_local_3);
                _local_2++;
            };
            this.itemLen = _arg_1.readUnsignedShort();
            this.items = new Vector.<P_ItemInfo>();
            _local_2 = 0;
            _local_2 = 0;
            while (_local_2 < this.itemLen) {
                _local_4 = new P_ItemInfo();
                _local_4.read(_arg_1);
                this.items.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1033()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1033 = " PStoreBoxData" (String#17387)


