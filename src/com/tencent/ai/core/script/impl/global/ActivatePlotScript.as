// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.ActivatePlotScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.plot.IPlotSystem;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.plot.IPlot;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import  ©init._SafeStr_1183;

    public class ActivatePlotScript extends GlobalScript 
    {

        protected var m_plotSys:IPlotSystem;

        public function ActivatePlotScript()
        {
            m_cmds = ScriptCmdDef.SC_ACTIVATE_PLOT;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:String;
            var _local_6:int;
            var _local_7:IPlot;
            if (this.m_plotSys == null){
                this.m_plotSys = AICore.plotSystem;
            };
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:Array = _local_3.argStr.split(",");
            for each (_local_5 in _local_4) {
                _local_6 = int(_local_5);
                _local_7 = this.m_plotSys.getPlotByID(_local_6);
                if (_local_7 == null){
                    _local_7 = this.m_plotSys.createPlotByID(_local_6);
                };
                if (_local_7 != null){
                    _local_7.activate();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1183()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1183 = " ActivatePlotScript" (String#16460)


