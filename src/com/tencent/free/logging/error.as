package com.tencent.free.logging
{
    public function error(... args):void
    {
        LoggingDefine.appender.write(("[error] " + args.join(" ")), LoggingDefine.LEVEL_ERROR);
    }

}
