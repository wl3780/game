// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.ChangeDupSceneScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1161;

    public class ChangeDupSceneScript extends GlobalScript 
    {

        public function ChangeDupSceneScript()
        {
            m_cmds = ScriptCmdDef.SC_CHANGE_DUP_SCENE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:int = int(_local_3.argStr);
            AICore.cmdCall(AICommandType.CALL_DUP_SCENE, _local_4);
        }

        public /*  ©init. */ function _SafeStr_1161()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1161 = " ChangeDupSceneScript" (String#17219)


