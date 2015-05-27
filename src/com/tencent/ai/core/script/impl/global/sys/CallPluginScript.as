// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.CallPluginScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.CallPluginArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1159;

    public class CallPluginScript extends GlobalScript 
    {

        public function CallPluginScript()
        {
            m_cmds = ScriptCmdDef.SC_CALL_PLUGIN;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:CallPluginArg = (_arg_2 as CallPluginArg);
            if (_local_3 != null){
                AICore.cmdCall(_local_3.pluginCmdType, _local_3.pluginArg);
            };
        }

        public /*  ©init. */ function _SafeStr_1159()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1159 = " CallPluginScript" (String#15149)


