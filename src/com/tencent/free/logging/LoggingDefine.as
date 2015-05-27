package com.tencent.free.logging
{
    import flash.net.SharedObject;
    import flash.utils.Dictionary;

    public class LoggingDefine 
    {

        public static const LEVEL_DEBUG:int = 0;
        public static const LEVEL_INFO:int = 1;
        public static const LEVEL_WARNING:int = 2;
        public static const LEVEL_ERROR:int = 3;
		
        private static var _appenderListeners:Vector.<Object> = new Vector.<Object>();
        private static var _appender:IAppender = new TraceAppender();
        
		public static var value:int = function ():int
        {
            return LEVEL_DEBUG;
        }();
		
        public static var serverAppender:Function;
        public static var msgBuffer:Vector.<String> = new Vector.<String>();
        public static var msgBufferSize:int = 3000;
        public static var assertFunc:Function = function (_arg_1:Boolean, _arg_2:String, _arg_3:int=0):void
        {
            if (_arg_1){
                throw (new Error(_arg_2, _arg_3));
            };
        };
        public static var labelAppenders:Dictionary = new Dictionary();


        public static function get appender():IAppender
        {
            return (_appender);
        }

        public static function set appender(_arg_1:IAppender):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Function;
            if (_appender != _arg_1){
                _local_2 = 0;
                while (_local_2 < _appenderListeners.length) {
                    _local_3 = _appenderListeners[_local_2];
                    _local_4 = _local_3.type;
                    _local_5 = _local_3.handler;
                    if (_appender != null){
                        _appender.removeEventListener(_local_4, _local_5);
                    };
                    if (_arg_1 != null){
                        _arg_1.addEventListener(_local_4, _local_5);
                    };
                    _local_2++;
                };
                _appender = _arg_1;
            };
        }

        public static function getLogger(_arg_1:Object, _arg_2:Class=null):ILogger
        {
            if (_arg_2 == null){
                _arg_2 = SimpleLogger;
            };
            return (new (_arg_2)(_arg_1));
        }

        public static function addAppenderListener(_arg_1:Object):void
        {
            if (_appenderListeners.indexOf(_arg_1) == -1){
                if (_appender != null){
                    _appender.addEventListener(_arg_1.type, _arg_1.handler);
                };
                _appenderListeners.push(_arg_1);
            };
        }

        public static function removeAppenderListener(_arg_1:Object):void
        {
            var _local_2:int = _appenderListeners.indexOf(_arg_1);
            if (_local_2 != -1){
                _appenderListeners.splice(_local_2, 1);
                if (_appender != null){
                    _appender.removeEventListener(_arg_1.type, _arg_1.handler);
                };
            };
        }

        public static function setDebuggerSO(_arg_1:String, _arg_2:int):void
        {
            var _local_3:SharedObject = SharedObject.getLocal("debug_setting");
            _local_3.data["url"] = ("debug_setting?" + _arg_1);
            _local_3.data["times"] = _arg_2;
        }

        public static function getDebuggerSO():String
        {
            var debuggerSO:SharedObject;
            var times:int;
            var url:String;
            debuggerSO = SharedObject.getLocal("debug_setting");
            if (debuggerSO.data["url"]){
                times = int(debuggerSO.data["times"]);
                if (times > 0){
                    debuggerSO.data["times"] = (times - 1);
                    url = debuggerSO.data["url"];
                } else {
                };
            };
            return (url);

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

    }
}
