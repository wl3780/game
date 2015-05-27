// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.PListenerRemove

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.AICore;

    public function PListenerRemove(_arg_1:int, _arg_2:IProtocolListener):void
    {
        AICore.net.removeProtocolListener(_arg_2);
    }

}//package com.tencent.ai.core.net

