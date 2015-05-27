// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.asynInvoke

package com.tencent.free.utils
{
    public function asynInvoke(_arg_1:CFunction, _arg_2:int=0):void
    {
        Schedule.Default.addInvoke(_arg_1, _arg_2);
    }

}//package com.tencent.free.utils

