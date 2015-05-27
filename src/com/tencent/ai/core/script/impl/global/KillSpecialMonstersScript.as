// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.KillSpecialMonstersScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.KillSpecialMonsterArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1197;

    public class KillSpecialMonstersScript extends GlobalScript 
    {

        public function KillSpecialMonstersScript()
        {
            m_cmds = ScriptCmdDef.SC_KILL_SPECIAL_MONSTERS;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:KillSpecialMonsterArg = (_arg_2 as KillSpecialMonsterArg);
            AICore.Runtime.currentContext.getMonsterManager().removeSpcialGroupMonster(_local_3.groupID, _local_3.killType);
        }

        public /*  ©init. */ function _SafeStr_1197()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1197 = " KillSpecialMonstersScript" (String#15695)


