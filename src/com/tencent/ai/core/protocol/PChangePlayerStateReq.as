// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PChangePlayerStateReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_979;

    public class PChangePlayerStateReq implements ISerialize 
    {

        public static const OUT_CMD:int = 525343;

        public var hp:int;
        public var mp:int;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.hp);
            _arg_1.writeUnsignedInt(this.mp);
        }

        public /*  ©init. */ function _SafeStr_979()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_979 = " PChangePlayerStateReq" (String#15242)


