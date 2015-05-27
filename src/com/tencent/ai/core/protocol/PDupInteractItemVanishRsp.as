// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupInteractItemVanishRsp

package com.tencent.ai.core.protocol
{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_991;

    public class PDupInteractItemVanishRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589886;
        public static const OUT_CMD:int = 589885;

        public var index:uint;
        public var take_effect_frame:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.index = _arg_1.readUnsignedShort();
            this.take_effect_frame = _arg_1.readUnsignedInt();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_991()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_991 = " PDupInteractItemVanishRsp" (String#17588)


