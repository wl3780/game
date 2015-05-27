// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.ScreenShakeScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.IScene;
    import  ©init._SafeStr_1177;

    public class ScreenShakeScript extends GlobalScript 
    {

        public function ScreenShakeScript()
        {
            m_cmds = ScriptCmdDef.SC_SCREEN_SHAKE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ShakeScriptArg = ShakeScriptArg(_arg_2);
            var _local_4:IScene = AICore.Runtime.currentScene;
            _local_4.getCamera().shake(_local_3.shakeDir, _local_3.shakeTimes, _local_3.shakeR);
        }

        public /*  ©init. */ function _SafeStr_1177()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1177 = " ScreenShakeScript" (String#15590)


