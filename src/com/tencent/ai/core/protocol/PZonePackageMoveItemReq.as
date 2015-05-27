// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZonePackageMoveItemReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1080;

    public class PZonePackageMoveItemReq implements ISerialize 
    {

        public static const IN_CMD:int = 524512;
        public static const OUT_CMD:int = 524511;

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

        public /*  ©init. */ function _SafeStr_1080()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1080 = " PZonePackageMoveItemReq" (String#14780)


