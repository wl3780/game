// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.AISecureTcpConnUNLinger

package com.tencent.ai.core.net.impl
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.net.ADF;
    import com.tencent.ai.core.events.TCPConnEvent;
    import flash.events.Event;
    import  ©init._SafeStr_795;
    import __AS3__.vec.*;

    public class AISecureTcpConnUNLinger extends AISecureTcpConnection 
    {

        protected var m_adfsQueue:Vector.<ADF>;
        protected var m_isConnecting:Boolean;

        public function AISecureTcpConnUNLinger(_arg_1:int=0)
        {
            super(_arg_1);
        }

        override public function initialize(_arg_1:Object=null):void
        {
            super.initialize(_arg_1);
            this.m_adfsQueue = new Vector.<ADF>();
            this.m_isConnecting = false;
            addEventListener(TCPConnEvent.TCPCONN_CONNECTED, this.onSecureConnected);
        }

        override public function connect(_arg_1:String, _arg_2:int):void
        {
            m_cHost = _arg_1;
            m_cPort = _arg_2;
            this.reset();
        }

        override public function send(_arg_1:ADF):Boolean
        {
            if (isConnected()){
                super.send(_arg_1);
            } else {
                this.m_adfsQueue.push(_arg_1);
                if (!this.m_isConnecting){
                    reconnect();
                    this.m_isConnecting = true;
                };
            };
            return (true);
        }

        public function reset():void
        {
            if (this.m_isConnecting){
                close();
            };
            this.m_adfsQueue = new Vector.<ADF>();
            this.m_isConnecting = false;
        }

        override protected function onConnError(_arg_1:Event):void
        {
            this.m_isConnecting = false;
            super.onConnError(_arg_1);
        }

        private function onSecureConnected(_arg_1:Event):void
        {
            var _local_2:int;
            while (_local_2 < this.m_adfsQueue.length) {
                this.send(this.m_adfsQueue[_local_2]);
                _local_2++;
            };
            this.m_adfsQueue = new Vector.<ADF>();
            this.m_isConnecting = false;
        }

        public /*  ©init. */ function _SafeStr_795()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_795 = " AISecureTcpConnUNLinger" (String#14618)


