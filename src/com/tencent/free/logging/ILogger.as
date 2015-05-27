// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.ILogger

package com.tencent.free.logging
{
    public interface ILogger 
    {

        function debug(... _args):void;
        function error(... _args):void;
        function warning(... _args):void;
        function getLoggerHead():String;

    }
}//package com.tencent.free.logging

