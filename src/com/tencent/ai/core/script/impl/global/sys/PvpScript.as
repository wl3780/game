// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.PvpScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.data.arg.PvpCallArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1174;

    public class PvpScript extends GlobalScript 
    {

        public function PvpScript()
        {
            m_cmds = ScriptCmdDef.SC_PVP_CMD;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:PvpCallArg = new PvpCallArg(int(_local_3.argStr));
            AICore.cmdCall(AICommandType.CALL_PVP_DUP, _local_4);
        }

        public /*  ©init. */ function _SafeStr_1174()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1174 = " PvpScript" (String#16313)


