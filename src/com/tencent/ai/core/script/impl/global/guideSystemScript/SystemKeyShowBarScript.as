// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemKeyShowBarScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.data.arg.script.SystemKeyShowArg;
    import  ©init._SafeStr_1155;

    public class SystemKeyShowBarScript extends GlobalScript 
    {

        public function SystemKeyShowBarScript()
        {
            m_cmds = ScriptCmdDef.SC_SYSTEM_KEY_BAR;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:IGuideSystemManager = AICore.guideSystem;
            var _local_4:SystemKeyShowArg = (_arg_2 as SystemKeyShowArg);
            if (_local_4.opreationType == "create"){
                _local_3.getAKeyShowBar(_local_4.type, _local_4.data, this.callBack, _local_4.id);
            } else {
                _local_3.deleteElementById(_local_4.id);
            };
        }

        private function callBack():void
        {
        }

        public /*  ©init. */ function _SafeStr_1155()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1155 = " SystemKeyShowBarScript" (String#14564)


