// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemDarkScreenScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.data.arg.script.SystemDarkScreenScriptArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1152;

    public class SystemDarkScreenScript extends GlobalScript 
    {

        private var darg:SystemDarkScreenScriptArg;
        protected var guideSystem:IGuideSystemManager;

        public function SystemDarkScreenScript()
        {
            m_cmds = ScriptCmdDef.SC_DARK_SCREEN;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (this.guideSystem == null){
                this.guideSystem = AICore.guideSystem;
            };
            this.darg = (_arg_2 as SystemDarkScreenScriptArg);
            if (this.darg.opreationType == "create"){
                this.guideSystem.getADarkScreen(this.darg.showTime, this.callBack, this.darg.id);
            } else {
                this.guideSystem.deleteElementById(this.darg.id);
            };
        }

        private function callBack():void
        {
        }

        public /*  ©init. */ function _SafeStr_1152()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1152 = " SystemDarkScreenScript" (String#16424)


