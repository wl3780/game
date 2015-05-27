// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.CallCasualGameScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.CallCasualGameArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1187;

    public class CallCasualGameScript extends GlobalScript 
    {

        public function CallCasualGameScript()
        {
            m_cmds = ScriptCmdDef.SC_CALL_CASUAL_GAME;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:CallCasualGameArg = new CallCasualGameArg(CallCasualGameArg.ENTER_STRAIGHT_MODE, int(_arg_2));
            AICore.cmdCall(AICommandType.CALL_CASUAL_GAME, _local_3);
        }

        public /*  ©init. */ function _SafeStr_1187()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1187 = " CallCasualGameScript" (String#16655)


