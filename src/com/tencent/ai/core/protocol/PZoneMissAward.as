// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneMissAward

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1074;

    public class PZoneMissAward implements ISerialize 
    {

        public static const IN_CMD:int = 524408;
        public static const OUT_CMD:int = 524407;

        public var miss_id:uint;
        public var award:PPackageNotifyRsp;


        public function read(_arg_1:IDataInput):void
        {
            this.miss_id = _arg_1.readUnsignedInt();
            this.award = new PPackageNotifyRsp();
            this.award.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1074()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1074 = " PZoneMissAward" (String#16154)


