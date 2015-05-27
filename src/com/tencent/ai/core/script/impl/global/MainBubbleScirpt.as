// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.MainBubbleScirpt

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.ControlBarBubbleArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1198;

    public class MainBubbleScirpt extends GlobalScript 
    {

        public function MainBubbleScirpt()
        {
            m_cmds = ScriptCmdDef.SC_CALL_BUBBLE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:int = int(_arg_2.argStr);
            var _local_4:ControlBarBubbleArg = new ControlBarBubbleArg();
            _local_4.bubbleID = _local_3;
            AICore.cmdCall(AICommandType.CALL_CONTROL_BAR, _local_4);
        }

        public /*  ©init. */ function _SafeStr_1198()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1198 = " MainBubbleScirpt" (String#15080)


