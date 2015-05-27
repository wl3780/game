// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.ApplyFunctionScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1208;

    public class ApplyFunctionScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;
        protected var m_attackDelegate:IAttackDelegate;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = (_arg_1 as ITargetHasSkill);
            this.m_attackDelegate = this.m_target.getAttackDelegate();
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:String = _local_3.argStr;
            var _local_5:SkillInfo = this.m_attackDelegate.skillInfo;
            var _local_6:BaseActor = (this.m_target.target as BaseActor);
            if ((((_local_5 == null)) || ((_local_6 == null)))){
                return;
            };
            if (_local_4 == "start"){
                _local_6.applySFs(_local_5.start_funcIDs, null);
            } else {
                _local_6.applySFs(_local_5.event_funcIDs, null, _local_4);
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_APPLY_FUNCTION);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1208()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1208 = " ApplyFunctionScript" (String#17804)


