// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PWarSoulEmbed

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1055;

    public class PWarSoulEmbed implements ISerialize 
    {

        public static const REQ:int = 526983;
        public static const RSP:int = 526984;

        public var fromBoxType:int;
        public var fromGridIndex:int;
        public var petSID:int;
        public var petWarSoulIndex:int;
        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.fromBoxType);
            _arg_1.writeByte(this.fromGridIndex);
            _arg_1.writeUnsignedInt(this.petSID);
            _arg_1.writeByte(this.petWarSoulIndex);
        }

        public /*  ©init. */ function _SafeStr_1055()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1055 = " PWarSoulEmbed" (String#14432)


