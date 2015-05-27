// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.OpenSuperShadowScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.SuperShadowInfo;
    import com.tencent.ai.core.enum.NpcDialogType;
    import com.tencent.ai.core.manager.key.KeyManager;
    import  ©init._SafeStr_1201;

    public class OpenSuperShadowScript extends GlobalScript 
    {

        public function OpenSuperShadowScript()
        {
            m_cmds = ScriptCmdDef.SC_OPEN_SUPERSHADOW;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:int = (((_arg_2 is Array)) ? int(_arg_2[0].argStr) : int(_arg_2.argStr));
            var _local_4:SuperShadowInfo = AICore.data.getSuperShadowInfo(_local_3);
            if (_local_4){
                AICore.dialog.open(_local_4, NpcDialogType.SUPSHA, this.callBack);
                KeyManager.setEnabled(false);
            };
        }

        private function callBack():void
        {
            KeyManager.setEnabled(true);
        }

        public /*  ©init. */ function _SafeStr_1201()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1201 = " OpenSuperShadowScript" (String#14366)


