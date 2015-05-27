// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.logToServer

package com.tencent.free.logging
{
    public function logToServer(... _args):void
    {
        if (LoggingDefine.serverAppender != null){
            LoggingDefine.serverAppender.apply(null, _args);
        };
    }

}//package com.tencent.free.logging

