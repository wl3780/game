// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.SetGlobalValueScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.SetGlobalValueArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.key.GameKeyManager;
    import  ©init._SafeStr_1181;

    public class SetGlobalValueScript extends GlobalScript 
    {

        public function SetGlobalValueScript()
        {
            m_cmds = ScriptCmdDef.SC_SET_GLOBAL_VALUE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:SetGlobalValueArg = (_arg_2 as SetGlobalValueArg);
            if (_local_3.setType == SetGlobalValueArg.MAIN_PLAYER_CONTROL){
                AICore.data.mainModel.setControlEnabled((_local_3.setValue == "true"));
            } else {
                if (_local_3.setType == SetGlobalValueArg.MAIN_PLAYER_KEYBOARD_TYPE){
                    GameKeyManager.Current.setKeyboardType(int(_local_3.setValue));
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1181()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1181 = " SetGlobalValueScript" (String#17159)


