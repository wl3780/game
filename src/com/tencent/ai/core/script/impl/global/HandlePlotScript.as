// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.HandlePlotScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.plot.IPlot;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1196;

    public class HandlePlotScript extends GlobalScript 
    {

        public function HandlePlotScript()
        {
            m_cmds = [ScriptCmdDef.SC_DEACTIVATE_PLOT, ScriptCmdDef.SC_DELETE_PLOT];
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:IPlot;
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:int = int(_local_3.argStr);
            if (_arg_1 == ScriptCmdDef.SC_DEACTIVATE_PLOT){
                _local_5 = AICore.plotSystem.getPlotByID(_local_4);
                if (_local_5 != null){
                    _local_5.deactivate();
                };
            } else {
                AICore.plotSystem.breakPlotByID(_local_4);
            };
        }

        public /*  ©init. */ function _SafeStr_1196()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1196 = " HandlePlotScript" (String#14864)


