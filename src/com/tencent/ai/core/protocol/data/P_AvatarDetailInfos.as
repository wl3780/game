// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_AvatarDetailInfos

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipItemInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_871;
    import __AS3__.vec.*;

    public class P_AvatarDetailInfos implements ISerialize 
    {

        public static var P:P_AvatarDetailInfos = new (P_AvatarDetailInfos)();

        public var equipMax:int = 0;
        public var iEquipItems:Vector.<EquipItemInfo>;


        public function read(_arg_1:IDataInput):void
        {
            this.iEquipItems = new Vector.<EquipItemInfo>();
            var _local_2:int = this.equipMax;
            if (_local_2 == 0){
                _local_2 = _arg_1.readUnsignedShort();
            };
            this.equipMax = 0;
            var _local_3:P_EquipItemInfo = P_EquipItemInfo.P;
            var _local_4:int;
            while (_local_4 < _local_2) {
                _local_3.read(_arg_1);
                this.iEquipItems.push(_local_3.data);
                _local_4++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int = (((this.iEquipItems == null)) ? 0 : this.iEquipItems.length);
            var _local_3:P_EquipItemInfo = P_EquipItemInfo.P;
            _arg_1.writeShort(_local_2);
            var _local_4:int;
            while (_local_4 < _local_2) {
                _local_3.data = this.iEquipItems[_local_4];
                _local_3.write(_arg_1);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_871()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_871 = " P_AvatarDetailInfos" (String#17507)


