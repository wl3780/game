// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPetGuardInfo

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1013;

    public class PPetGuardInfo implements ISerialize 
    {

        public var guard_pos:uint;
        public var pet_sid:uint;
        public var percent_add:uint;
        public var attr:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.guard_pos = _arg_1.readUnsignedByte();
            this.pet_sid = _arg_1.readUnsignedInt();
            this.percent_add = _arg_1.readUnsignedShort();
            this.attr = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1013()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1013 = " PPetGuardInfo" (String#14168)


