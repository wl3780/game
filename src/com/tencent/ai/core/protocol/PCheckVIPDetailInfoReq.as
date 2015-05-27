// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PCheckVIPDetailInfoReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_981;

    public class PCheckVIPDetailInfoReq implements ISerialize 
    {

        public static const IN_CMD:int = 525570;
        public static const OUT_CMD:int = 525569;

        public var vipInfo:VipSimpleInfo;
        public var vipScore:uint;
        public var openTime:uint;
        public var closeTime:uint;
        public var todayScore:int;
        public var annualLevel:uint;
        public var annualBeginTime:uint;
        public var annualEndTime:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.vipInfo = new VipSimpleInfo();
            this.vipInfo.read(_arg_1);
            this.vipScore = _arg_1.readUnsignedInt();
            this.openTime = _arg_1.readUnsignedInt();
            this.closeTime = _arg_1.readUnsignedInt();
            this.todayScore = _arg_1.readInt();
            this.annualLevel = _arg_1.readUnsignedByte();
            this.annualBeginTime = _arg_1.readUnsignedInt();
            this.annualEndTime = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_981()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_981 = " PCheckVIPDetailInfoReq" (String#16442)


