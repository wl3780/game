// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.DupMsgTipScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.events.DupSpecialEvent;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1193;

    public class DupMsgTipScript extends GlobalScript 
    {

        public function DupMsgTipScript()
        {
            m_cmds = ScriptCmdDef.SC_DUP_MSG_TIP;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:String = String(_arg_2.argStr);
            var _local_4:DupSpecialEvent = new DupSpecialEvent(DupSpecialEvent.DUP_MSG_TIP);
            _local_4.data = _local_3;
            AICore.Runtime.dispatchEvent(_local_4);
        }

        public /*  ©init. */ function _SafeStr_1193()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1193 = " DupMsgTipScript" (String#14483)


