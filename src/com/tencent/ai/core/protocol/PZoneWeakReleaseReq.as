// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneWeakReleaseReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1098;

    public class PZoneWeakReleaseReq implements ISerialize 
    {

        public static const IN_CMD:int = 524416;
        public static const OUT_CMD:int = 524415;

        public var release_type:int;
        public var ret:int;
        public var gold_cust:int;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            this.gold_cust = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.release_type);
        }

        public /*  ©init. */ function _SafeStr_1098()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1098 = " PZoneWeakReleaseReq" (String#14084)


