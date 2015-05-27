// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.HttpLoader

package com.tencent.ai.core.net.impl
{
    import flash.net.URLLoader;
    import com.tencent.ai.core.net.IHttpLoader;
    import com.tencent.ai.core.data.ServerInfo;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import com.tencent.free.logging.warning;
    import flash.net.URLRequest;
    import  ©init._SafeStr_796;

    public class HttpLoader extends URLLoader implements IHttpLoader 
    {

        protected var serverInfo:ServerInfo;
        protected var requestsList:Array;
        protected var isLoading:Boolean = false;
        protected var noCache:Boolean = false;
        protected var isQueue:Boolean = true;
        protected var url:String;

        public function HttpLoader(_arg_1:ServerInfo)
        {
            this.serverInfo = _arg_1;
            this.requestsList = [];
            addEventListener(Event.COMPLETE, this.onLoadComplete, false, 1);
            addEventListener(IOErrorEvent.IO_ERROR, this.onLoadError, false, 1);
            addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError, false, 1);
        }

        protected function onSecurityError(_arg_1:SecurityErrorEvent):void
        {
            warning(("[AIURLLoader] HTTP请求有安全错误:" + _arg_1.text));
            this.isLoading = false;
            this.nextRequest();
        }

        protected function onLoadComplete(_arg_1:Event):void
        {
            this.isLoading = false;
            this.nextRequest();
        }

        protected function onLoadError(_arg_1:IOErrorEvent):void
        {
            this.isLoading = false;
            this.nextRequest();
        }

        protected function nextRequest():void
        {
            if (this.requestsList.length == 0){
                return;
            };
            var _local_1:URLRequest = (this.requestsList.shift() as URLRequest);
            this.url = _local_1.url;
            super.load(_local_1);
            this.isLoading = true;
        }

        public function getBytesLoaded():uint
        {
            return (bytesLoaded);
        }

        public function getBytesTotal():uint
        {
            return (bytesTotal);
        }

        public function get responeFormat():String
        {
            return (dataFormat);
        }

        public function set responeFormat(_arg_1:String):void
        {
            dataFormat = _arg_1;
        }

        public function get response()
        {
            return (data);
        }

        public function set response(_arg_1:*):void
        {
            data = _arg_1;
        }

        override public function load(_arg_1:URLRequest):void
        {
            var _local_2:String = _arg_1.url;
            var _local_3 = "";
            if (this.serverInfo != null){
                _local_3 = ((("angel_uin=" + this.serverInfo.uin) + "&angel_key=") + this.serverInfo.sessionKey);
            } else {
                warning("[AIURLLoader] serverInfo为空!");
            };
            if (_local_2.indexOf("?") != -1){
                _local_2 = (_local_2 + ("&" + _local_3));
            } else {
                _local_2 = (_local_2 + ("?" + _local_3));
            };
            if (this.noCache){
                _local_2 = (_local_2 + ("&time=" + (new Date().time >> 10)));
            };
            _arg_1.url = _local_2;
            this.requestsList.push(_arg_1);
            if (((this.isLoading) && (this.isQueue))){
                return;
            };
            this.nextRequest();
        }

        public function setNoCache(_arg_1:Boolean):void
        {
            this.noCache = _arg_1;
        }

        public function setTimeOut(_arg_1:int=-1, _arg_2:Boolean=true):void
        {
        }

        public function setIsQueue(_arg_1:Boolean):void
        {
            this.isQueue = _arg_1;
        }

        public function getLatestURL():String
        {
            return (this.url);
        }

        public function destroy():void
        {
            removeEventListener(Event.COMPLETE, this.onLoadComplete);
            removeEventListener(IOErrorEvent.IO_ERROR, this.onLoadError);
        }

        public /*  ©init. */ function _SafeStr_796()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_796 = " HttpLoader" (String#15251)


