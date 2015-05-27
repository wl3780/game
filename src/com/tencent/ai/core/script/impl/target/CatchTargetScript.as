// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.CatchTargetScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1210;

    public class CatchTargetScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;
        protected var m_attackDelegate:IAttackDelegate;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
            this.m_attackDelegate = this.m_target.getAttackDelegate();
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:int;
            var _local_5:SkillInfo;
            var _local_3:int = int(_arg_2);
            if (_local_3 > 1){
                if (_local_3 > 10000){
                    _local_4 = (_local_3 % 10000);
                    _local_5 = this.m_target.getSkillModel().info;
                    _local_3 = (((_local_4 == 1)) ? _local_5.variable1 : _local_5.variable0);
                };
            };
            this.m_attackDelegate.catchValue = _local_3;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_CATCH_TARGET);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1210()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1210 = " CatchTargetScript" (String#16310)


