// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.RemoveNpcScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.RemoveNpcScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.element.BaseElement;
    import  ©init._SafeStr_1175;

    public class RemoveNpcScript extends GlobalScript 
    {

        public function RemoveNpcScript()
        {
            this.m_cmds = ScriptCmdDef.SC_REMOVE_NPC;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:RemoveNpcScriptArg = (_arg_2 as RemoveNpcScriptArg);
            var _local_4:BaseElement = AICore.Runtime.currentContext.getNpcManager().getNpcBy(_local_3.npcID);
            if (_local_4){
                AICore.Runtime.currentScene.destoryElement(_local_4);
            };
        }

        public /*  ©init. */ function _SafeStr_1175()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1175 = " RemoveNpcScript" (String#16745)


