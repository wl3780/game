// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.PrepareResourceScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.PrepareResourceArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1203;

    public class PrepareResourceScript extends GlobalScript 
    {

        public function PrepareResourceScript()
        {
            m_cmds = ScriptCmdDef.SC_PREPARE_RESOURCE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:String;
            var _local_3:PrepareResourceArg = (_arg_2 as PrepareResourceArg);
            for each (_local_4 in _local_3.aidArr) {
                AICore.data.runtime.prepareResource(_local_3.ptype, _local_3.pid, _local_3.atype, int(_local_4));
            };
        }

        public /*  ©init. */ function _SafeStr_1203()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1203 = " PrepareResourceScript" (String#17735)


