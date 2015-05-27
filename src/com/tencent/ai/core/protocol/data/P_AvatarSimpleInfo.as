// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_AvatarSimpleInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_873;
    import __AS3__.vec.*;

    public class P_AvatarSimpleInfo implements ISerialize 
    {

        public static var P:P_AvatarSimpleInfo = new (P_AvatarSimpleInfo)();

        public var equipMax:int = 0;
        public var iEquipItems:Vector.<EquipItemInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_4:P_AvatarShowInfo;
            var _local_5:EquipItemInfo;
            this.iEquipItems = new Vector.<EquipItemInfo>();
            var _local_2:int = this.equipMax;
            if (_local_2 == 0){
                _local_2 = _arg_1.readUnsignedShort();
            };
            this.equipMax = 0;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new P_AvatarShowInfo();
                _local_4.read(_arg_1);
                _local_5 = new EquipItemInfo();
                _local_5.id = _local_4.avatarID;
                if (_local_4.avatarID != 0){
                    _local_5.staticInfo = DEFINE.DM.getItemStaticInfo(_local_4.avatarID);
                    _local_5.strengthen = _local_4.strLen;
                };
                this.iEquipItems.push(_local_5);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int = (((this.iEquipItems == null)) ? 0 : this.iEquipItems.length);
            _arg_1.writeShort(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _arg_1.writeUnsignedInt(this.iEquipItems[_local_3].id);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_873()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_873 = " P_AvatarSimpleInfo" (String#14468)


