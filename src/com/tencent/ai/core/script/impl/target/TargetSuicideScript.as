// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetSuicideScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1246;

    public class TargetSuicideScript implements IScript 
    {

        protected var m_target:ITarget;


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
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:BaseActor = (this.m_target.target as BaseActor);
            if (_local_4 != null){
                _local_4.suicide((_local_3.argStr == "hpzero"));
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_SUICIDE);
        }

        public /*  ©init. */ function _SafeStr_1246()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1246 = " TargetSuicideScript" (String#16871)


