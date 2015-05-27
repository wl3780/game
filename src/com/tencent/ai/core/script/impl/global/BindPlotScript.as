// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.BindPlotScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.BindPlotScriptArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1185;

    public class BindPlotScript extends GlobalScript 
    {

        public function BindPlotScript()
        {
            m_cmds = ScriptCmdDef.SC_BIND_PLOT;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:BindPlotScriptArg = (_arg_2 as BindPlotScriptArg);
            if (_local_3.bBind){
                AICore.data.runtime.bindPlot(_local_3.dupID, _local_3.plot, _local_3.scenes.split(","));
            } else {
                AICore.data.runtime.unbindPlot(_local_3.dupID, _local_3.plot);
            };
        }

        public /*  ©init. */ function _SafeStr_1185()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1185 = " BindPlotScript" (String#16538)


