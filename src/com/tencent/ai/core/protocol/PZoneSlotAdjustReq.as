// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneSlotAdjustReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import com.tencent.ai.core.data.ItemInfo;
    import  ©init._SafeStr_1087;
    import __AS3__.vec.*;

    public class PZoneSlotAdjustReq implements ISerialize 
    {

        public static const IN_CMD:int = 524514;
        public static const OUT_CMD:int = 524513;

        public var adjust_arr:Vector.<PSlotAdjustData>;
        public var zoneStoreBoxSyncNotify:PZoneStoreBoxSyncNotify;


        public function read(_arg_1:IDataInput):void
        {
            this.zoneStoreBoxSyncNotify = new PZoneStoreBoxSyncNotify();
            this.zoneStoreBoxSyncNotify.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _local_3 = this.adjust_arr.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.adjust_arr[_local_2].write(_arg_1);
                _local_2++;
            };
        }

        public function setReqestData(_arg_1:Array, _arg_2:Array):void
        {
            var _local_3:ItemInfo;
            var _local_4:int;
            var _local_5:int;
            var _local_6:PSlotAdjustData;
            this.adjust_arr = new Vector.<PSlotAdjustData>();
            _local_5 = _arg_1.length;
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_3 = _arg_1[_local_4];
                _local_6 = new PSlotAdjustData();
                _local_6.sid = _local_3.serialID;
                _local_6.itemId = _local_3.id;
                _local_6.newSlot = _arg_2[_local_4];
                this.adjust_arr.push(_local_6);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_1087()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1087 = " PZoneSlotAdjustReq" (String#14639)


