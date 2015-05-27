// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.FireClientMsgScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1169;

    public class FireClientMsgScript extends GlobalScript 
    {

        protected var m_clientMsg_event:AIEvent;

        public function FireClientMsgScript()
        {
            m_cmds = ScriptCmdDef.SC_FIRE_CLIENT_MSG;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            if (this.m_clientMsg_event == null){
                this.m_clientMsg_event = new AIEvent(AIEvent.ON_CLIENT_MSG);
            };
            this.m_clientMsg_event.data = _local_3.argStr;
            AICore.dispatchAIEvent(this.m_clientMsg_event);
        }

        public /*  ©init. */ function _SafeStr_1169()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1169 = " FireClientMsgScript" (String#17687)


