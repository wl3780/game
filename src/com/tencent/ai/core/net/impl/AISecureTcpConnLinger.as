// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.AISecureTcpConnLinger

package com.tencent.ai.core.net.impl
{
    import flash.utils.Timer;
    import com.tencent.ai.core.net.ADF;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import  ©init._SafeStr_794;

    public class AISecureTcpConnLinger extends AISecureTcpConnection 
    {

        protected var m_timer:Timer;
        protected var m_firstHello:Boolean;
        protected var m_helloADF:ADF;
        protected var m_helloCmd:int;
        protected var m_helloBody:Object;
        protected var m_helloTimes:int;
        protected var m_signatureTimes:int;

        public function AISecureTcpConnLinger(_arg_1:int=0)
        {
            super(_arg_1);
        }

        protected function onHelloTime(_arg_1:TimerEvent):void
        {
            this.m_helloTimes++;
            if (this.m_helloADF == null){
                this.m_helloADF = ProtocolHelper.CreateADF(this.m_helloCmd, 0, this.m_helloBody);
            };
            send(this.m_helloADF);
            if (this.m_helloTimes >= this.m_signatureTimes){
                sendCheckSignature();
                this.m_helloTimes = 0;
            };
        }

        override protected function onSecureConnConnected():void
        {
            super.onSecureConnConnected();
            if (this.m_timer != null){
                this.m_timer.start();
                if (this.m_firstHello){
                    this.onHelloTime(null);
                };
            };
        }

        override public function initialize(_arg_1:Object=null):void
        {
            var _local_2:Class;
            super.initialize(_arg_1);
            if (((!((_arg_1 == null))) && (_arg_1.keepAlive))){
                this.m_helloCmd = _arg_1.helloCmdOut;
                _local_2 = _arg_1.helloBodyClass;
                this.m_helloBody = new (_local_2)();
                this.m_signatureTimes = int(_arg_1.signatureTimes);
                this.m_timer = new Timer((1000 * _arg_1.interval));
                this.m_timer.addEventListener(TimerEvent.TIMER, this.onHelloTime);
                this.m_firstHello = (_arg_1.firstHello == true);
            };
        }

        override protected function onConnClosed(_arg_1:Event):void
        {
            super.onConnClosed(_arg_1);
            if (this.m_timer != null){
                this.m_timer.stop();
            };
        }

        override public function close():void
        {
            super.close();
            if (this.m_timer != null){
                this.m_timer.stop();
            };
        }

        override public function dispose():void
        {
            if (this.m_timer != null){
                this.m_timer.removeEventListener(TimerEvent.TIMER, this.onHelloTime);
                this.m_timer = null;
            };
            super.dispose();
        }

        public /*  ©init. */ function _SafeStr_794()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_794 = " AISecureTcpConnLinger" (String#14381)


