// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.SetConditionFlagScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.SetConditionFlagArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1205;

    public class SetConditionFlagScript extends GlobalScript 
    {

        public function SetConditionFlagScript()
        {
            m_cmds = ScriptCmdDef.SC_SET_CONDITION_FLAG;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:SetConditionFlagArg = (_arg_2 as SetConditionFlagArg);
            if (((_local_3) && (AICore.mission))){
                AICore.mission.setConditionFlag(_local_3.phaseID, _local_3.conditionIndex, _local_3.flag);
            };
        }

        public /*  ©init. */ function _SafeStr_1205()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1205 = " SetConditionFlagScript" (String#16805)


