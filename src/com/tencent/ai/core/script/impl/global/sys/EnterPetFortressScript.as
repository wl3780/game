// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.EnterPetFortressScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1168;

    public class EnterPetFortressScript extends GlobalScript 
    {

        public function EnterPetFortressScript()
        {
            m_cmds = ScriptCmdDef.SC_ENTER_PETFORTRESS;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            AICore.cmdCall(AICommandType.CALL_PET_FORTRESS, {"player":AICore.data.mainModel.playerInfo.playerID});
        }

        public /*  ©init. */ function _SafeStr_1168()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1168 = " EnterPetFortressScript" (String#15137)


