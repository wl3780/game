// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneMissFinish

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1076;

    public class PZoneMissFinish implements ISerialize 
    {

        public static const IN_CMD:int = 524406;
        public static const OUT_CMD:int = 524405;

        public var iMissionID:int;


        public function read(_arg_1:IDataInput):void
        {
            this.iMissionID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1076()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1076 = " PZoneMissFinish" (String#17516)


