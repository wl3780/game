// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.EnterDuplicateScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.data.arg.DupCallArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1167;

    public class EnterDuplicateScript extends GlobalScript 
    {

        public function EnterDuplicateScript()
        {
            m_cmds = ScriptCmdDef.SC_ENTER_DUPLICATE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:DupCallArg = new DupCallArg(DupCallArg.ENTER_STRAIGHT, int(_local_3.argStr));
            AICore.cmdCall(AICommandType.CALL_DUPLICATE, _local_4);
        }

        public /*  ©init. */ function _SafeStr_1167()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1167 = " EnterDuplicateScript" (String#14198)


