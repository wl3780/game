// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.SimpleLogger

package com.tencent.free.logging
{
    import flash.utils.getQualifiedClassName;
    import  ©init._SafeStr_46;

    public class SimpleLogger implements ILogger 
    {

        protected var m_loggerHead:String;
        protected var m_debug_func:Function;
        protected var m_warning_func:Function;
        protected var m_error_func:Function;

        public function SimpleLogger(_arg_1:Object)
        {
            var _local_2:String = getQualifiedClassName(_arg_1);
            var _local_3:int = _local_2.indexOf("::");
            this.m_loggerHead = (("[" + (((_local_3 == -1)) ? _local_2 : _local_2.substring((_local_3 + 2), _local_2.length))) + "]");
            this.m_debug_func = debug;
            this.m_warning_func = warning;
            this.m_error_func = error;
        }

        public function debug(... _args):void
        {
            _args.unshift(this.m_loggerHead);
            this.m_debug_func.apply(null, _args);
        }

        public function error(... _args):void
        {
            _args.unshift(this.m_loggerHead);
            this.m_error_func.apply(null, _args);
        }

        public function warning(... _args):void
        {
            _args.unshift(this.m_loggerHead);
            this.m_error_func.apply(null, _args);
        }

        public function getLoggerHead():String
        {
            return (this.m_loggerHead);
        }

        public /*  ©init. */ function _SafeStr_46()
        {
        }


    }
}//package com.tencent.free.logging

// _SafeStr_46 = " SimpleLogger" (String#1502)


