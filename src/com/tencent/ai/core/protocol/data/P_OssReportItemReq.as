// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_OssReportItemReq

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_899;

    public class P_OssReportItemReq implements ISerialize 
    {

        public var report_type:int;
        public var data_1:int;
        public var data_2:int;
        public var data_3:int;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.report_type);
            _arg_1.writeInt(this.data_1);
            _arg_1.writeInt(this.data_2);
            _arg_1.writeInt(this.data_3);
        }

        public /*  ©init. */ function _SafeStr_899()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_899 = " P_OssReportItemReq" (String#17111)


