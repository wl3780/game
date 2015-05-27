// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetClearAimsScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1235;

    public class TargetClearAimsScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:String = ScriptArg(_arg_2).argStr;
            var _local_4:IAttackDelegate = this.m_target.getAttackDelegate();
            if (_local_3 == "addAttackAims_cacthAims"){
                _local_4.addAttackAims(_local_4.cacthAims);
            } else {
                _local_4.clearAims();
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_CLEAR_AIMS);
        }

        public /*  ©init. */ function _SafeStr_1235()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1235 = " TargetClearAimsScript" (String#16259)


