// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.printSystemMsg

package com.tencent.ai.core
{
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.data.arg.SystemMessagArg;
    import com.tencent.ai.core.enum.SystemMessagType;

    public function printSystemMsg(_arg_1:String):void
    {
        var _local_2:AIEvent = new AIEvent(AIEvent.ON_SYSTEM_MSG);
        var _local_3:SystemMessagArg = new SystemMessagArg();
        _local_3.type = SystemMessagType.MSG_COMBAT;
        _local_3.text = _arg_1;
        _local_2.data = _local_3;
        AICore.dispatchAIEvent(_local_2);
    }

}//package com.tencent.ai.core

