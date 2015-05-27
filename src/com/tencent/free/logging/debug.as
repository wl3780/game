package com.tencent.free.logging
{
    public function debug(... args):void
    {
        if (LoggingDefine.value <= LoggingDefine.LEVEL_DEBUG) {
            LoggingDefine.appender.write("[debug] " + args.join(" "), LoggingDefine.LEVEL_DEBUG);
        }
    }

}
