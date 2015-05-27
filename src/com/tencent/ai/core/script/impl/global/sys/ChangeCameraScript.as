// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.ChangeCameraScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ChangeCameraScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.ICamera;
    import  ©init._SafeStr_1160;

    public class ChangeCameraScript extends GlobalScript 
    {

        public function ChangeCameraScript()
        {
            this.m_cmds = ScriptCmdDef.SC_CHANGE_CAMERA;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ChangeCameraScriptArg = (_arg_2 as ChangeCameraScriptArg);
            var _local_4:ICamera = AICore.Runtime.currentScene.getCamera();
            _local_4.isFollowFocus = _local_3.isFollowFocus;
            if (!_local_3.isFollowFocus){
                _local_4.locateTo(_local_3.mapX, _local_3.mapZ);
            };
        }

        public /*  ©init. */ function _SafeStr_1160()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1160 = " ChangeCameraScript" (String#16769)


