// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.TCPConnection

package com.tencent.ai.core.net.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.net.IConnection;
    import flash.net.Socket;
    import com.tencent.free.utils.ByteBuffer;
    import flash.utils.ByteArray;
    import com.tencent.ai.core.net.ADF;
    import com.tencent.ai.core.net.IProtocolListener;
    import com.tencent.ai.core.events.TCPConnEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import com.tencent.free.logging.logToServer;
    import flash.events.Event;
    import com.tencent.ai.core.net.ADFHead;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.logging.debug;
    import flash.events.ProgressEvent;
    import flash.system.Security;
    import com.tencent.free.logging.warning;
    import  ©init._SafeStr_798;

    public class TCPConnection extends EventDispatcher2 implements IConnection 
    {

        public var isDebugConnetion:Boolean;
        protected var m_policyPort:int;
        protected var m_cHost:String;
        protected var m_cPort:int;
        protected var m_socket:Socket;
        protected var m_inByteBuff:ByteBuffer;
        protected var m_outByteBuff:ByteArray;
        protected var m_emptyADF:ADF;
        protected var m_adfListener:IProtocolListener;
        protected var m_RadfProcesser:Function;
        protected var m_SadfProcesser:Function;
        private var _id:int;
        private var _adfEvent:TCPConnEvent;

        public function TCPConnection(_arg_1:int=0)
        {
            this._id = _arg_1;
            this._adfEvent = new TCPConnEvent(TCPConnEvent.TCPCONN_ONADF, this._id);
            this._adfEvent.setTarget(this);
            this.m_policyPort = 843;
            this.m_cHost = "";
            this.m_cPort = 0;
            this.isDebugConnetion = false;
        }

        protected function onConnError(_arg_1:Event):void
        {
            this.close();
            var _local_2 = "";
            var _local_3:TCPConnEvent = new TCPConnEvent(TCPConnEvent.TCPCONN_ERROR, this._id);
            switch (_arg_1.type){
                case IOErrorEvent.IO_ERROR:
                    _local_2 = (_local_2 + (_arg_1 as IOErrorEvent).text);
                    _local_3.dataType = TCPConnEvent.ERROR_TYPE_IO_ERROR;
                    break;
                case IOErrorEvent.VERIFY_ERROR:
                    _local_2 = (_local_2 + (_arg_1 as IOErrorEvent).text);
                    _local_3.dataType = TCPConnEvent.ERROR_TYPE_VERIFY_ERROR;
                    break;
                case SecurityErrorEvent.SECURITY_ERROR:
                    _local_2 = (_local_2 + (_arg_1 as SecurityErrorEvent).text);
                    _local_3.dataType = TCPConnEvent.ERROR_TYPE_SECURITY_ERROR;
                    break;
            };
            _local_3.setTarget(this);
            _local_3.message = _local_2;
            logToServer([4], [((this.m_cHost + ":") + this.m_cPort), _arg_1.type]);
            dispatchEvent(_local_3);
        }

        protected function onConnConnected(_arg_1:Event):void
        {
            var _local_2:TCPConnEvent = new TCPConnEvent(TCPConnEvent.TCPCONN_CONNECTED, this._id);
            _local_2.setTarget(this);
            dispatchEvent(_local_2);
        }

        protected function onConnClosed(_arg_1:Event):void
        {
            var _local_2:TCPConnEvent = new TCPConnEvent(TCPConnEvent.TCPCONN_CLOSED, this._id);
            _local_2.setTarget(this);
            dispatchEvent(_local_2);
        }

        protected function tryReadADFHead():ADFHead
        {
            var _local_2:ADFHead;
            var _local_1:int = ADFHead.canRead(this.m_socket);
            while (_local_1 != ADFHead.NOT_EN_BYTES) {
                if (_local_1 == ADFHead.HEAD_READY){
                    _local_2 = new ADFHead();
                    _local_2.read(this.m_socket);
                    return (_local_2);
                };
                _local_1 = ADFHead.canRead(this.m_socket);
            };
            return (null);
        }

        protected function tryReadADFBody():int
        {
            var _local_1:int = (this.m_socket.bytesAvailable - this.m_inByteBuff.limit);
            if (_local_1 >= 0){
                this.m_inByteBuff.fill(this.m_socket);
                this.m_emptyADF.buf = this.m_inByteBuff;
                if (DEFINE.IS_WATCH_NET > 0){
                    if (!this.isDebugConnetion){
                        debug(((("[AITCPConnection] TCP[" + this._id) + "] 收到服务器协议CMDTYPE:0x") + this.m_emptyADF.head.cmdID.toString(16)));
                    };
                };
                if ((((this.m_RadfProcesser == null)) || (this.m_RadfProcesser(this.m_emptyADF)))){
                    this._adfEvent.data = this.m_emptyADF;
                    dispatchEvent(this._adfEvent);
                };
            };
            return (_local_1);
        }

        protected function readSocketData(_arg_1:ProgressEvent):void
        {
            var _local_2:ADFHead;
            var _local_3:int;
            if (this.m_emptyADF == null){
                _local_2 = this.tryReadADFHead();
                if (_local_2 != null){
                    this.m_emptyADF = new ADF(_local_2);
                    this.m_inByteBuff.allocate(_local_2.pkgLen);
                };
            };
            if (this.m_emptyADF != null){
                _local_3 = this.tryReadADFBody();
                if (_local_3 >= 0){
                    this.m_emptyADF = null;
                    if (_local_3 > 0){
                        this.readSocketData(null);
                    };
                };
            };
        }

        public function initialize(_arg_1:Object=null):void
        {
            if (_arg_1 != null){
                this.isDebugConnetion = _arg_1.isDebugConnetion;
            };
            this.m_inByteBuff = new ByteBuffer();
            this.m_inByteBuff.allocate(0);
            this.m_outByteBuff = new ByteArray();
            this.setPolicyPort(843);
            this.newSocketInstance();
        }

        public function newSocketInstance():void
        {
            if (this.m_socket != null){
                this.close();
                this.m_socket.removeEventListener(Event.CONNECT, this.onConnConnected);
                this.m_socket.removeEventListener(Event.CLOSE, this.onConnClosed);
                this.m_socket.removeEventListener(ProgressEvent.SOCKET_DATA, this.readSocketData);
                this.m_socket.removeEventListener(IOErrorEvent.IO_ERROR, this.onConnError);
                this.m_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onConnError);
                this.m_socket = null;
            };
            this.m_socket = new Socket();
            this.m_socket.addEventListener(Event.CONNECT, this.onConnConnected);
            this.m_socket.addEventListener(Event.CLOSE, this.onConnClosed);
            this.m_socket.addEventListener(ProgressEvent.SOCKET_DATA, this.readSocketData);
            this.m_socket.addEventListener(IOErrorEvent.IO_ERROR, this.onConnError);
            this.m_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onConnError);
        }

        public function getConnID():int
        {
            return (this._id);
        }

        public function setTimeOut(_arg_1:int):void
        {
        }

        public function setPolicyPort(_arg_1:int):void
        {
            this.m_policyPort = _arg_1;
        }

        public function connect(_arg_1:String, _arg_2:int):void
        {
            this.m_cHost = _arg_1;
            this.m_cPort = _arg_2;
            this.reconnect();
        }

        public function reconnect():void
        {
            var _local_1:String;
            if (this.m_policyPort != 843){
                _local_1 = ((("xmlsocket://" + this.m_cHost) + ":") + this.m_policyPort);
                if (DEFINE.IS_WATCH_NET > 0){
                    if (!this.isDebugConnetion){
                        debug((("[AITCPConnection] 请求策略文件[" + _local_1) + "]"));
                    };
                };
                Security.loadPolicyFile(_local_1);
            };
            this.m_socket.connect(this.m_cHost, this.m_cPort);
        }

        public function isConnected():Boolean
        {
            return (this.m_socket.connected);
        }

        public function send(_arg_1:ADF):Boolean
        {
            if (this.m_socket.connected){
                if (DEFINE.IS_WATCH_NET > 0){
                    if (!this.isDebugConnetion){
                        debug(((((((("[AITCPConnection] TCP[" + this._id) + "]向服务器发送CMDTYPE=0x") + _arg_1.head.cmdID.toString(16)) + " MsgID=") + _arg_1.head.msgID) + " ") + _arg_1.head.playerID));
                    };
                };
                if (this.m_SadfProcesser != null){
                    this.m_SadfProcesser(_arg_1);
                };
                this.m_outByteBuff.length = 0;
                _arg_1.write(this.m_outByteBuff);
                this.m_socket.writeBytes(this.m_outByteBuff);
                this.m_socket.flush();
                return (true);
            };
            if (!this.isDebugConnetion){
                warning(((((((("[AITCPConnection] 错误:尝试向一个非连接的SOCKET上写数据! TCP[" + this._id) + "]向服务器发送CMDTYPE=0x") + _arg_1.head.cmdID.toString(16)) + " MsgID=") + _arg_1.head.msgID) + " ") + _arg_1.head.playerID));
            };
            return (false);
        }

        public function sendBytes(_arg_1:ByteArray):void
        {
            if (this.m_socket.connected){
                this.m_socket.writeBytes(_arg_1);
                this.m_socket.flush();
            } else {
                if (!this.isDebugConnetion){
                    warning("[AITCPConnection] 错误:尝试向一个非连接的SOCKET上写数据!");
                };
            };
        }

        public function writeBytes(_arg_1:ByteArray):void
        {
            if (this.m_socket.connected){
                this.m_socket.writeBytes(_arg_1);
            } else {
                if (!this.isDebugConnetion){
                    warning("[AITCPConnection] 错误:尝试向一个非连接的SOCKET上写数据!");
                };
            };
        }

        public function close():void
        {
            if (this.m_socket != null){
                this.m_socket.close();
            };

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        public function dispose():void
        {
            this.m_socket.removeEventListener(Event.CONNECT, this.onConnConnected);
            this.m_socket.removeEventListener(Event.CLOSE, this.onConnClosed);
            this.m_socket.removeEventListener(ProgressEvent.SOCKET_DATA, this.readSocketData);
            this.m_socket.removeEventListener(IOErrorEvent.IO_ERROR, this.onConnError);
            this.m_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onConnError);
            clear();
            this.close();
            this.m_socket = null;
        }

        public function getHost():String
        {
            return (this.m_cHost);
        }

        public function getPort():int
        {
            return (this.m_cPort);
        }

        public /*  ©init. */ function _SafeStr_798()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_798 = " TCPConnection" (String#13742)


