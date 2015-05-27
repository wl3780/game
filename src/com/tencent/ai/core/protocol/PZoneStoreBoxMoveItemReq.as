// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneStoreBoxMoveItemReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1088;

    public class PZoneStoreBoxMoveItemReq implements ISerialize 
    {

        public static const IN_CMD:int = 524510;
        public static const OUT_CMD:int = 524509;

        public var zoneStoreBoxSyncNotify:PZoneStoreBoxSyncNotify;
        public var item_id:uint;
        public var sid:uint;
        public var num:uint;
        public var dest_slot:int;


        public function read(_arg_1:IDataInput):void
        {
            this.zoneStoreBoxSyncNotify = new PZoneStoreBoxSyncNotify();
            this.zoneStoreBoxSyncNotify.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.item_id);
            _arg_1.writeUnsignedInt(this.sid);
            _arg_1.writeUnsignedInt(this.num);
            _arg_1.writeShort(this.dest_slot);
        }

        public /*  ©init. */ function _SafeStr_1088()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1088 = " PZoneStoreBoxMoveItemReq" (String#17027)


