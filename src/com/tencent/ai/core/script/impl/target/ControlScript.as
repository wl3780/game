// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.ControlScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1215;

    public class ControlScript implements IScript 
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
            this.m_target.control((_arg_2 as ScriptArg));
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_CONTROL);
        }

        public /*  ©init. */ function _SafeStr_1215()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1215 = " ControlScript" (String#16337)


