﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.PFunctionAdd

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.AICore;

    public function PFunctionAdd(_arg_1:int, _arg_2:Function):void
    {
        AICore.net.addFuncListener(_arg_1, _arg_2);
    }

}//package com.tencent.ai.core.net

