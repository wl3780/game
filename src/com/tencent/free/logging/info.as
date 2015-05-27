// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.info

package com.tencent.free.logging
{
    public function info(... _args):void
    {
        if (LoggingDefine.value <= LoggingDefine.LEVEL_INFO){
            LoggingDefine.appender.write(("[info] " + _args.join(" ")), LoggingDefine.LEVEL_INFO);
        };
    }

}//package com.tencent.free.logging

