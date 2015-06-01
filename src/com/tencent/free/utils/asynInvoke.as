package com.tencent.free.utils
{
    public function asynInvoke(func:CFunction, delay:int=0):void
    {
        Schedule.Default.addInvoke(func, delay);
    }

}
