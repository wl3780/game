// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.warning

package com.tencent.free.logging
{
    public function warning(... _args):void
    {
        if (LoggingDefine.value <= LoggingDefine.LEVEL_WARNING){
            LoggingDefine.appender.write(("[warning] " + _args.join(" ")), LoggingDefine.LEVEL_WARNING);
        };
    }

}//package com.tencent.free.logging

