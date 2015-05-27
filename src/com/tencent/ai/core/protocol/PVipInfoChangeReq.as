// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PVipInfoChangeReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1050;

    public class PVipInfoChangeReq implements ISerialize 
    {

        public static const OUT_CMD:int = 525573;
        public static const IN_CMD:int = 525574;

        public var changeType:int;
        public var levelChangeFlag:int;
        public var scoreChangeFlag:int;
        public var detailInfo:PCheckVIPDetailInfoReq;
        public var yearChange:int;


        public function read(_arg_1:IDataInput):void
        {
            this.changeType = _arg_1.readUnsignedInt();
            this.levelChangeFlag = _arg_1.readUnsignedByte();
            this.scoreChangeFlag = _arg_1.readUnsignedByte();
            this.yearChange = _arg_1.readUnsignedByte();
            this.detailInfo = new PCheckVIPDetailInfoReq();
            this.detailInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1050()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1050 = " PVipInfoChangeReq" (String#17801)


