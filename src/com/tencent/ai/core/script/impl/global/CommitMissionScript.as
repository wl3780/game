// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.CommitMissionScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.CommitMissionArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1189;

    public class CommitMissionScript extends GlobalScript 
    {

        public function CommitMissionScript()
        {
            m_cmds = ScriptCmdDef.SC_COMMIT_MISSION;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:CommitMissionArg = (_arg_2 as CommitMissionArg);
            if (((_local_3) && (AICore.mission))){
                AICore.mission.commitMission(_local_3.cid, _local_3.aid);
            };
        }

        public /*  ©init. */ function _SafeStr_1189()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1189 = " CommitMissionScript" (String#13775)


