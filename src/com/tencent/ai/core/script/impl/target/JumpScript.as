// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.JumpScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1222;

    public class JumpScript implements IScript 
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
            var _local_3:BaseActor = (this.m_target.target as BaseActor);
            if (_local_3 != null){
                _local_3.jump(this.m_target.model.jumpV, this.m_target.landFunction);
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_JUMP);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1222()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1222 = " JumpScript" (String#14726)


