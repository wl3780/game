// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.OssReportScriptArg

package com.tencent.ai.core.data.arg.script
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_OssReportItemReq;
    import  ©init._SafeStr_139;

    public class OssReportScriptArg extends ScriptArg 
    {

        public static const TYPE_0:int = 0;
        public static const TYPE_1:int = 1;

        public var report_type:int;
        public var data_1:int;
        public var data_2:int;
        public var data_3:int;
        public var ossType:int = 0;
        public var ossItemVect:Vector.<P_OssReportItemReq>;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.report_type = int(_arg_1.@report_type);
            this.data_1 = int(_arg_1.@data_1);
            this.data_2 = int(_arg_1.@data_2);
            this.data_3 = int(_arg_1.@data_3);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@report_type = this.report_type;
            _local_1.@data_1 = this.data_1;
            _local_1.@data_2 = this.data_2;
            _local_1.@data_3 = this.data_3;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:OssReportScriptArg = (super.clone() as OssReportScriptArg);
            _local_1.report_type = this.report_type;
            _local_1.data_1 = this.data_1;
            _local_1.data_2 = this.data_2;
            _local_1.data_3 = this.data_3;
            _local_1.ossType = this.ossType;
            _local_1.ossItemVect = this.ossItemVect;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_139()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_139 = " OssReportScriptArg" (String#15119)


