// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.HttpLoaderReflashKey

package com.tencent.ai.core.net.impl
{
    import flash.utils.Timer;
    import com.tencent.ai.core.data.ServerInfo;
    import flash.events.TimerEvent;
    import flash.net.URLRequest;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.logging.debug;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import  ©init._SafeStr_797;

    public class HttpLoaderReflashKey extends HttpLoader 
    {

        protected var timer:Timer;
        protected var tryTime:int = 0;

        public function HttpLoaderReflashKey(_arg_1:ServerInfo)
        {
            super(_arg_1);
        }

        protected function onReflashKey(_arg_1:TimerEvent):void
        {
            this.tryTime = 0;
            this.reLoadKey();
        }

        protected function reLoadKey():Boolean
        {
            this.tryTime++;
            if (this.tryTime > 3){
                return (false);
            };
            load(new URLRequest((DEFINE.CGI_ROOT + "sign")));
            return (true);
        }

        override protected function onLoadComplete(_arg_1:Event):void
        {
            super.onLoadComplete(_arg_1);
            var _local_2:XML = new XML(data);
            if (((!((_local_2.result == null))) && ((_local_2.result == 0)))){
                serverInfo.sessionKey = _local_2.angel_key;
                debug(("[ReflashKeyLoader] 签名更新成功: " + serverInfo.sessionKey));
            } else {
                debug((("[ReflashKeyLoader] 签名更新失败(错误原因:" + _local_2.result) + ")"));
                this.onLoadError(null);
            };
        }

        override protected function onLoadError(_arg_1:IOErrorEvent):void
        {
            if (this.reLoadKey()){
            };
        }

        public function start():void
        {
            this.timer = new Timer(((20 * 60) * 1000));
            this.timer.addEventListener(TimerEvent.TIMER, this.onReflashKey);
            this.timer.start();
        }

        override public function destroy():void
        {
            super.destroy();
            this.timer.removeEventListener(TimerEvent.TIMER, this.onReflashKey);
        }

        public /*  ©init. */ function _SafeStr_797()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_797 = " HttpLoaderReflashKey" (String#15503)


