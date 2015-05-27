// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.DeactivateProcedure

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.plot.IPlot;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.procedure.IProcedure;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1190;

    public class DeactivateProcedure implements IScript 
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
            var _local_5:IPlot;
            var _local_6:Array;
            var _local_7:String;
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:IProcedure = (this.m_target as IProcedure);
            if (_local_4){
                _local_5 = (_local_4.owner as IPlot);
                if (_local_5){
                    _local_6 = _local_3.argStr.split(",");
                    for each (_local_7 in _local_6) {
                        _local_5.deactivateProcedure(int(_local_7));
                    };
                };
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_DEACTIVATE_PROCEDURE);
        }

        public /*  ©init. */ function _SafeStr_1190()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1190 = " DeactivateProcedure" (String#16646)


