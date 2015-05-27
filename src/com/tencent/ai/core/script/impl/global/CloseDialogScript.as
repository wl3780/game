// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.CloseDialogScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.MultiDialogInfo;
    import com.tencent.ai.core.manager.key.KeyManager;
    import  ©init._SafeStr_1188;

    public class CloseDialogScript extends GlobalScript 
    {

        public function CloseDialogScript()
        {
            m_cmds = ScriptCmdDef.SC_CLOSE_DIALOG;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:int = int(_arg_2.argStr);
            var _local_4:MultiDialogInfo = AICore.data.getDialogInfo(_local_3);
            if (_local_4){
                AICore.dialog.closeTopDialog();
                KeyManager.setEnabled(true);
            };
        }

        public /*  ©init. */ function _SafeStr_1188()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1188 = " CloseDialogScript" (String#17441)


