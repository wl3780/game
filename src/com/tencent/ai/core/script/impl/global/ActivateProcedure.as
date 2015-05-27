// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.ActivateProcedure

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.plot.IPlot;
    import com.tencent.ai.core.procedure.IProcedure;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1184;

    public class ActivateProcedure implements IScript 
    {

        protected var m_target:Object;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = _arg_1;
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:IPlot;
            var _local_5:Array;
            var _local_7:IProcedure;
            var _local_8:String;
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_6:Array = _local_3.argStr.split(" ");
            if (_local_6.length == 1){
                _local_5 = _local_6[0].split(",");
                _local_7 = (this.m_target as IProcedure);
                if (_local_7){
                    _local_4 = (_local_7.owner as IPlot);
                };
            } else {
                if (_local_6.length == 2){
                    _local_5 = _local_6[0].split(",");
                    _local_4 = AICore.plotSystem.getPlotByID(int(_local_6[1]));
                };
            };
            if (((_local_4) && (_local_5))){
                for each (_local_8 in _local_5) {
                    _local_4.activateProcedure(int(_local_8));
                };
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_ACTIVATE_PROCEDURE);
        }

        public /*  ©init. */ function _SafeStr_1184()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1184 = " ActivateProcedure" (String#16403)


