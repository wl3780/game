// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.OpenNpcDialogScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.OpenDialogArg;
    import com.tencent.ai.core.data.NpcDialogNormalInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.NpcDialogType;
    import com.tencent.ai.core.manager.key.KeyManager;
    import  ©init._SafeStr_1200;

    public class OpenNpcDialogScript extends GlobalScript 
    {

        public function OpenNpcDialogScript()
        {
            m_cmds = ScriptCmdDef.SC_OPEN_NPC_DIALOG;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:OpenDialogArg = (_arg_2 as OpenDialogArg);
            var _local_4:NpcDialogNormalInfo = _local_3.info;
            AICore.dialog.open(_local_4, NpcDialogType.NORMAL, this.callBack);
            KeyManager.setEnabled(false);
        }

        private function callBack():void
        {
            KeyManager.setEnabled(true);
        }

        public /*  ©init. */ function _SafeStr_1200()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1200 = " OpenNpcDialogScript" (String#16946)


