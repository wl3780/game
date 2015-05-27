// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.AcceptMissionScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.AcceptMissionArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1182;

    public class AcceptMissionScript extends GlobalScript 
    {

        public function AcceptMissionScript()
        {
            m_cmds = ScriptCmdDef.SC_ACCEPT_MISSION;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:AcceptMissionArg = (_arg_2 as AcceptMissionArg);
            if (((_local_3) && (AICore.mission))){
                AICore.mission.acceptMission(_local_3.mid, _local_3.pid);
            };
        }

        public /*  ©init. */ function _SafeStr_1182()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1182 = " AcceptMissionScript" (String#16343)


