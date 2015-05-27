// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneOpenStoreBoxReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1079;

    public class PZoneOpenStoreBoxReq implements ISerialize 
    {

        public static const IN_CMD:int = 524506;
        public static const OUT_CMD:int = 524505;

        public var storeBox:PStoreBoxData;


        public function read(_arg_1:IDataInput):void
        {
            this.storeBox = new PStoreBoxData();
            this.storeBox.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1079()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1079 = " PZoneOpenStoreBoxReq" (String#17642)


