// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.DupCountTipScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1192;

    public class DupCountTipScript extends GlobalScript 
    {

        public function DupCountTipScript()
        {
            m_cmds = ScriptCmdDef.SC_DUP_COUNT_TIP;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:DupSpecialEvent = new DupSpecialEvent(DupSpecialEvent.DUP_COUNT_TIP_START);
            AICore.Runtime.dispatchEvent(_local_3);
        }

        public /*  ©init. */ function _SafeStr_1192()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1192 = " DupCountTipScript" (String#17060)


