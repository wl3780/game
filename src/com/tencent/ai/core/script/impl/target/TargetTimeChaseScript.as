// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetTimeChaseScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.monster.ai.IMonsterBrain;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1247;

    public class TargetTimeChaseScript implements IScript 
    {

        protected var m_target:ITarget;
        private var _brain:IMonsterBrain;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            this._brain = (this.m_target.target.getAIComponent() as IMonsterBrain);
            var _local_3:TimeChaseScriptArg = (_arg_2 as TimeChaseScriptArg);
            this._brain.makeTimeChaseAttack(_local_3);
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_TIME_CHASE_SCRIPT);
        }

        public /*  ©init. */ function _SafeStr_1247()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1247 = " TargetTimeChaseScript" (String#16913)


