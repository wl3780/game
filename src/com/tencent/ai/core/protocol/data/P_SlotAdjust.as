// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_SlotAdjust

package com.tencent.ai.core.protocol.data
{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_917;

    public class P_SlotAdjust 
    {

        public var sid:uint;
        public var id:uint;
        public var slot:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.sid = _arg_1.readUnsignedInt();
            this.id = _arg_1.readUnsignedInt();
            this.slot = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.sid);
            _arg_1.writeUnsignedInt(this.id);
            _arg_1.writeShort(this.slot);
        }

        public /*  ©init. */ function _SafeStr_917()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_917 = " P_SlotAdjust" (String#17099)


