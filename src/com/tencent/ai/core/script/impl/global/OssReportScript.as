// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.OssReportScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.protocol.data.P_OssReportItemReq;
    import com.tencent.ai.core.data.arg.script.OssReportScriptArg;
    import com.tencent.ai.core.protocol.POssReportReq;
    import com.tencent.ai.core.net.CitySend;
    import  ©init._SafeStr_1202;
    import __AS3__.vec.*;

    public class OssReportScript extends GlobalScript 
    {

        public function OssReportScript()
        {
            m_cmds = ScriptCmdDef.SC_SEND_OSS;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:P_OssReportItemReq;
            var _local_3:OssReportScriptArg = (_arg_2 as OssReportScriptArg);
            var _local_4:POssReportReq = new POssReportReq();
            if (_local_3.ossType == OssReportScriptArg.TYPE_0){
                _local_5 = new P_OssReportItemReq();
                _local_5.report_type = _local_3.report_type;
                _local_5.data_1 = _local_3.data_1;
                _local_5.data_2 = _local_3.data_2;
                _local_5.data_3 = _local_3.data_3;
                _local_4.reportVect = new Vector.<P_OssReportItemReq>();
                _local_4.reportVect.push(_local_5);
            } else {
                if (_local_3.ossType == OssReportScriptArg.TYPE_1){
                    _local_4.reportVect = _local_3.ossItemVect;
                };
            };
            CitySend(POssReportReq.REQ_CMD, _local_4);
        }

        public /*  ©init. */ function _SafeStr_1202()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1202 = " OssReportScript" (String#16358)


