// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_ItemInfos

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ItemInfo;
    import com.tencent.ai.core.enum.ItemConstants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_892;
    import __AS3__.vec.*;

    public class P_ItemInfos implements ISerialize 
    {

        public var iCommonItems:Vector.<ItemInfo>;
        public var iCombatItems:Vector.<ItemInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:int;
            this.iCommonItems = new Vector.<ItemInfo>();
            this.iCombatItems = new Vector.<ItemInfo>();
            var _local_2:P_ItemInfo = new P_ItemInfo();
            _local_4 = _arg_1.readUnsignedShort();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2.read(_arg_1);
                if (_local_2.item.staticInfo.kind == ItemConstants.PropKind_COMMON){
                    this.iCommonItems.push(_local_2.item);
                } else {
                    this.iCombatItems.push(_local_2.item);
                };
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_892()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_892 = " P_ItemInfos" (String#17132)


