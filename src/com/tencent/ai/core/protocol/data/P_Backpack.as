// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_Backpack

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.BackpackInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_875;
    import __AS3__.vec.*;

    public class P_Backpack implements ISerialize 
    {

        public var version:uint;
        public var global_avatar_serial:uint;
        public var data:BackpackInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.version = _arg_1.readUnsignedShort();
            this.global_avatar_serial = _arg_1.readUnsignedInt();
            this.data = new BackpackInfo();
            this.data.packSize = _arg_1.readUnsignedShort();
            P_AvatarDetailInfos.P.read(_arg_1);
            this.data.equipItems = P_AvatarDetailInfos.P.iEquipItems;
            var _local_4:P_ItemInfos = new P_ItemInfos();
            _local_4.read(_arg_1);
            this.data.commonItems = _local_4.iCommonItems;
            this.data.combatItems = _local_4.iCombatItems;
            var _local_5:Vector.<int> = new Vector.<int>();
            _local_3 = Constants.LEN_SHOTCUT_ITEM;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5.push(_arg_1.readInt());
                _local_2++;
            };
            this.data.shortcutItems = _local_5;
            var _local_6:Vector.<int> = new Vector.<int>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6.push(_arg_1.readInt());
                _local_2++;
            };
            this.data.packSizes = _local_6;
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_875()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_875 = " P_Backpack" (String#17156)


