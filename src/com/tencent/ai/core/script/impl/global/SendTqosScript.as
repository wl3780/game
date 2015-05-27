// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.SendTqosScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.TqosScriptArg;
    import com.tencent.free.logging.logToServer;
    import  ©init._SafeStr_1204;

    public class SendTqosScript extends GlobalScript 
    {

        public function SendTqosScript()
        {
            m_cmds = ScriptCmdDef.SC_SEND_TQOS;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:TqosScriptArg = (_arg_2 as TqosScriptArg);
            logToServer(_local_3.intArr, _local_3.strArr);
        }

        public /*  ©init. */ function _SafeStr_1204()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1204 = " SendTqosScript" (String#16823)


