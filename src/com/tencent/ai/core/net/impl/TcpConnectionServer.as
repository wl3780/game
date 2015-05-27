// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.TcpConnectionServer

package com.tencent.ai.core.net.impl
{
    import com.tencent.ai.core.events.TCPConnEvent;
    import flash.events.ProgressEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import  ©init._SafeStr_800;

    public class TcpConnectionServer extends TCPConnection 
    {

        public static const POLICY_REQ_XML:String = "<policy-file-request/>";

        protected var m_checkConnection:Boolean;

        public function TcpConnectionServer(_arg_1:int=0)
        {
            super(_arg_1);
        }

        protected function isPolicyConn():Boolean
        {
            var _local_2:TCPConnEvent;
            if (m_socket.bytesAvailable != (POLICY_REQ_XML.length + 1)){
                return (false);
            };
            var _local_1:String = m_socket.readUTFBytes(m_socket.bytesAvailable);
            if (_local_1 == POLICY_REQ_XML){
                _local_2 = new TCPConnEvent(TCPConnEvent.TCPCONN_REQ_POLICY, getConnID());
                _local_2.setTarget(this);
                dispatchEvent(_local_2);
                return (true);
            };
            return (false);
        }

        override protected function readSocketData(_arg_1:ProgressEvent):void
        {
            if (!this.m_checkConnection){
                this.m_checkConnection = true;
                if (this.isPolicyConn()){
                    return;
                };
            };
            super.readSocketData(_arg_1);
        }

        override public function initialize(_arg_1:Object=null):void
        {
            m_socket = _arg_1.socket;
            super.initialize(_arg_1);
            this.m_checkConnection = false;
        }

        override public function newSocketInstance():void
        {
            m_socket.addEventListener(Event.CONNECT, onConnConnected);
            m_socket.addEventListener(Event.CLOSE, onConnClosed);
            m_socket.addEventListener(ProgressEvent.SOCKET_DATA, this.readSocketData);
            m_socket.addEventListener(IOErrorEvent.IO_ERROR, onConnError);
            m_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onConnError);
        }

        override public function connect(_arg_1:String, _arg_2:int):void
        {
            throw (new Error("[ServerTcpConnection] 服务器端的连接不能调用connect方法"));
        }

        public /*  ©init. */ function _SafeStr_800()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_800 = " TcpConnectionServer" (String#16469)


