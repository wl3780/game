// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.TcpConnectionLinger

package com.tencent.ai.core.net.impl
{
    import flash.utils.Timer;
    import com.tencent.ai.core.net.ADF;
    import flash.utils.getTimer;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import  ©init._SafeStr_799;

    public class TcpConnectionLinger extends TCPConnection 
    {

        protected var m_timer:Timer;
        protected var m_lastTime:int = 0;
        protected var m_helloADF:ADF;
        protected var m_helloCmd:int;
        protected var m_helloBody:Object;

        public function TcpConnectionLinger(_arg_1:int=0)
        {
            super(_arg_1);
        }

        protected function onHelloTime(_arg_1:TimerEvent):void
        {
            if (getTimer() > this.m_lastTime){
                if (this.m_helloADF == null){
                    this.m_helloADF = ProtocolHelper.CreateADF(this.m_helloCmd, 0, this.m_helloBody);
                };
                this.send(this.m_helloADF);
            };
        }

        override protected function onConnConnected(_arg_1:Event):void
        {
            super.onConnConnected(_arg_1);
            if (this.m_timer != null){
                this.m_timer.start();
            };
        }

        override public function initialize(_arg_1:Object=null):void
        {
            super.initialize(_arg_1);
            if (((!((_arg_1 == null))) && (_arg_1.keepAlive))){
                this.m_helloCmd = _arg_1.helloCmdOut;
                this.m_helloBody = new (_arg_1["helloBodyClass"])();
                this.m_timer = new Timer((1000 * _arg_1.interval));
                this.m_timer.addEventListener(TimerEvent.TIMER, this.onHelloTime);
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

        override public function send(_arg_1:ADF):Boolean
        {
            var _local_2:Boolean = super.send(_arg_1);
            this.m_lastTime = getTimer();
            return (_local_2);
        }

        override public function dispose():void
        {
            super.dispose();
            if (this.m_timer != null){
                this.m_timer.removeEventListener(TimerEvent.TIMER, this.onHelloTime);
                this.m_timer = null;
            };
        }

        public /*  ©init. */ function _SafeStr_799()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_799 = " TcpConnectionLinger" (String#16784)


