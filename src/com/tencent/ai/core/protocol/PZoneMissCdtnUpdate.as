// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneMissCdtnUpdate

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.data.P_MissCdtnData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1075;

    public class PZoneMissCdtnUpdate implements ISerialize 
    {

        public static const IN_CMD:int = 524402;
        public static const OUT_CMD:int = 524397;

        public var iMissID:uint;
        public var iPhaseID:uint;
        public var iCdtnIndex:uint;
        public var iMissCdtn:P_MissCdtnData;


        public function read(_arg_1:IDataInput):void
        {
            this.iMissID = _arg_1.readUnsignedInt();
            this.iPhaseID = _arg_1.readUnsignedInt();
            this.iCdtnIndex = _arg_1.readUnsignedInt();
            this.iMissCdtn = new P_MissCdtnData();
            this.iMissCdtn.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1075()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1075 = " PZoneMissCdtnUpdate" (String#16634)


