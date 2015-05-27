// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneStoreBoxSyncNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1089;

    public class PZoneStoreBoxSyncNotify implements ISerialize 
    {

        public var result:int;
        public var resetSlotsNum:uint = 0;
        public var resetSlots:Array = null;
        public var storeBox:PStoreBoxData = null;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:uint;
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.resetSlotsNum = _arg_1.readUnsignedShort();
                this.resetSlots = new Array();
                _local_2 = 0;
                _local_2 = 0;
                while (_local_2 < this.resetSlotsNum) {
                    _local_3 = _arg_1.readUnsignedShort();
                    this.resetSlots.push(_local_3);
                    _local_2++;
                };
                this.storeBox = new PStoreBoxData();
                this.storeBox.read(_arg_1);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1089()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1089 = " PZoneStoreBoxSyncNotify" (String#17000)


