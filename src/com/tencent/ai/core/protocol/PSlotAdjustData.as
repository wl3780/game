// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PSlotAdjustData

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1031;

    public class PSlotAdjustData implements ISerialize 
    {

        public var sid:uint;
        public var itemId:uint;
        public var newSlot:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.sid = _arg_1.readUnsignedInt();
            this.itemId = _arg_1.readUnsignedInt();
            this.newSlot = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.sid);
            _arg_1.writeUnsignedInt(this.itemId);
            _arg_1.writeShort(this.newSlot);
        }

        public /*  ©init. */ function _SafeStr_1031()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1031 = " PSlotAdjustData" (String#15536)


