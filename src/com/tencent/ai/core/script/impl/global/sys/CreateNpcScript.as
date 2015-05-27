// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.CreateNpcScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.SceneNpcInfo;
    import com.tencent.ai.core.data.arg.script.CreateNpcScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1163;

    public class CreateNpcScript extends GlobalScript 
    {

        public function CreateNpcScript()
        {
            this.m_cmds = ScriptCmdDef.SC_CREATE_NPC;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:SceneNpcInfo;
            var _local_3:CreateNpcScriptArg = (_arg_2 as CreateNpcScriptArg);
            var _local_4 = (AICore.Runtime.currentContext.getNpcManager().getNpcBy(_local_3.npcID) == null);
            if (((_local_4) && (AICore.Runtime.currentScene))){
                _local_5 = new SceneNpcInfo();
                _local_5.id = _local_3.npcID;
                _local_5.mapPosition = _local_3.mapPosition;
                _local_5.npcModel = AICore.npcSystem.getNpcModelManager().getNpcModelByID(_local_5.id);
                AICore.Runtime.currentScene.createElement(ElementType.ET_NPC, _local_5);
            };
        }

        public /*  ©init. */ function _SafeStr_1163()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1163 = " CreateNpcScript" (String#15689)


