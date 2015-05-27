// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZonePetUpdateBuffReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetExtraBuff;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1081;

    public class PZonePetUpdateBuffReq implements ISerialize 
    {

        public static const OUT_CMD:int = 524741;

        public var extra_buf:PetExtraBuff;


        public function read(_arg_1:IDataInput):void
        {
            this.extra_buf.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.extra_buf.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1081()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1081 = " PZonePetUpdateBuffReq" (String#15821)


