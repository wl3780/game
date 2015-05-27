// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.POssReportReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_OssReportItemReq;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1011;

    public class POssReportReq implements ISerialize 
    {

        public static const REQ_CMD:int = ProtocolIDDef.ZONE_CMD_CLIENT_OSS_REPORT_REQ;//524482

        public var reportVect:Vector.<P_OssReportItemReq>;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int = this.reportVect.length;
            _arg_1.writeShort(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.reportVect[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_1011()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1011 = " POssReportReq" (String#14261)


