// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPackageNotifyRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.data.ItemInfo;
    import com.tencent.ai.core.protocol.data.P_SyncServerInfo;
    import com.tencent.ai.core.protocol.data.P_ItemInfos;
    import com.tencent.ai.core.protocol.data.P_EquipItemInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1012;
    import __AS3__.vec.*;

    public class PPackageNotifyRsp implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_PACKAGE_NOTIFY_RSP;//524394
        public static const IN_CMD_2:int = ProtocolIDDef.ZONE_CMD_AWARD_NOTIFY_RSP;//524386

        public var module_info:ServerMsgInfo;
        public var iServerInfos:Vector.<ServerMsgInfo>;
        public var iEquipItems:Vector.<EquipItemInfo>;
        public var iCommonItems:Vector.<ItemInfo>;
        public var iCombatItems:Vector.<ItemInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:uint;
            this.module_info = new ServerMsgInfo();
            this.module_info.read(_arg_1);
            var _local_4:P_SyncServerInfo = new P_SyncServerInfo();
            _local_4.read(_arg_1);
            this.iServerInfos = _local_4.data.serverInfos;
            var _local_5:P_ItemInfos = new P_ItemInfos();
            _local_5.read(_arg_1);
            this.iCommonItems = _local_5.iCommonItems;
            this.iCombatItems = _local_5.iCombatItems;
            this.iEquipItems = new Vector.<EquipItemInfo>();
            _local_3 = _arg_1.readUnsignedShort();
            var _local_6:P_EquipItemInfo = P_EquipItemInfo.P;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6.read(_arg_1);
                this.iEquipItems.push(_local_6.data);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1012()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1012 = " PPackageNotifyRsp" (String#15248)


