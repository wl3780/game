// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PWarSoulLevelUpNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1056;

    public class PWarSoulLevelUpNotify implements ISerialize 
    {

        public static const RSP:int = 526988;

        public var sid:int;
        public var oldID:int;
        public var newID:int;
        public var levelChange:int;


        public function read(_arg_1:IDataInput):void
        {
            this.sid = _arg_1.readUnsignedInt();
            this.oldID = _arg_1.readUnsignedInt();
            this.newID = _arg_1.readUnsignedInt();
            this.levelChange = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1056()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1056 = " PWarSoulLevelUpNotify" (String#14681)


