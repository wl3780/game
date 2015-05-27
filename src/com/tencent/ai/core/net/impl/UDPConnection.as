// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.UDPConnection

package com.tencent.ai.core.net.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.net.IConnection;
    import flash.net.NetConnection;
    import com.tencent.free.utils.ByteBuffer;
    import flash.utils.ByteArray;
    import com.tencent.ai.core.net.ADF;
    import com.tencent.ai.core.net.IProtocolListener;
    import com.tencent.ai.core.events.UDPConnEvent;
    import flash.utils.Dictionary;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import com.tencent.free.logging.logToServer;
    import flash.events.Event;
    import com.tencent.ai.core.net.ADFHead;
    import flash.events.NetStatusEvent;
    import flash.net.NetStream;
    import com.tencent.ai.core.protocol.PBaseP2PProtocol;
    import com.tencent.free.logging.warning;
    import  ©init._SafeStr_803;

    public class UDPConnection extends EventDispatcher2 implements IConnection 
    {

        public var isDebugConnetion:Boolean;
        protected var m_cHost:String;
        protected var m_cPort:int;
        protected var m_nc:NetConnection;
        protected var m_inByteBuff:ByteBuffer;
        protected var m_outByteBuff:ByteArray;
        protected var m_emptyADF:ADF;
        protected var m_adfListener:IProtocolListener;
        protected var m_RadfProcesser:Function;
        protected var m_SadfProcesser:Function;
        private var _id:int;
        private var _adfEvent:UDPConnEvent;
        protected var m_p2pStream:Dictionary;
        private var _data:ByteArray;

        public function UDPConnection(_arg_1:int=0)
        {
            this._id = _arg_1;
            this._adfEvent = new UDPConnEvent(UDPConnEvent.UDPCONN_ONADF, this._id);
            this._adfEvent.setTarget(this);
            this.m_cHost = "";
            this.m_cPort = 0;
            this.m_p2pStream = new Dictionary();
            this.isDebugConnetion = false;
        }

        protected function onConnError(_arg_1:Event):void
        {
            this.close();
            var _local_2 = "";
            var _local_3:UDPConnEvent = new UDPConnEvent(UDPConnEvent.UDPCONN_ERROR, this._id);
            switch (_arg_1.type){
                case IOErrorEvent.IO_ERROR:
                    _local_2 = (_local_2 + (_arg_1 as IOErrorEvent).text);
                    _local_3.dataType = UDPConnEvent.ERROR_TYPE_IO_ERROR;
                    break;
                case IOErrorEvent.VERIFY_ERROR:
                    _local_2 = (_local_2 + (_arg_1 as IOErrorEvent).text);
                    _local_3.dataType = UDPConnEvent.ERROR_TYPE_VERIFY_ERROR;
                    break;
                case SecurityErrorEvent.SECURITY_ERROR:
                    _local_2 = (_local_2 + (_arg_1 as SecurityErrorEvent).text);
                    _local_3.dataType = UDPConnEvent.ERROR_TYPE_SECURITY_ERROR;
                    break;
            };
            _local_3.setTarget(this);
            _local_3.message = _local_2;
            logToServer([4], [((this.m_cHost + ":") + this.m_cPort), _arg_1.type]);
            dispatchEvent(_local_3);
        }

        protected function tryReadADFHead():ADFHead
        {
            var _local_2:ADFHead;
            var _local_1:int = ADFHead.canRead(this._data);
            while (_local_1 != ADFHead.NOT_EN_BYTES) {
                if (_local_1 == ADFHead.HEAD_READY){
                    _local_2 = new ADFHead();
                    _local_2.read(this._data);
                    return (_local_2);
                };
                _local_1 = ADFHead.canRead(this._data);
            };
            return (null);
        }

        public function setPolicyPort(_arg_1:int):void
        {
        }

        protected function tryReadADFBody():int
        {
            var _local_1:int = (this._data.bytesAvailable - this.m_inByteBuff.limit);
            if (_local_1 >= 0){
                this.m_inByteBuff.fill(this._data);
                this.m_emptyADF.buf = this.m_inByteBuff;
                if ((((this.m_RadfProcesser == null)) || (this.m_RadfProcesser(this.m_emptyADF)))){
                    this._adfEvent.data = this.m_emptyADF;
                    dispatchEvent(this._adfEvent);
                };
            };
            return (_local_1);
        }

        public function initialize(_arg_1:Object=null):void
        {
            var _local_2:UDPConnEvent;
            if (_arg_1 != null){
                this.isDebugConnetion = _arg_1.isDebugConnetion;
                _local_2 = new UDPConnEvent(UDPConnEvent.UDPCONN_CONNECTED, this._id);
                _local_2.setTarget(this);
                dispatchEvent(_local_2);
            };
            this.m_inByteBuff = new ByteBuffer();
            this.m_inByteBuff.allocate(0);
            this.m_outByteBuff = new ByteArray();
            this.setPolicyPort(843);
            this.newSocketInstance();
        }

        public function newSocketInstance():void
        {
            if (this.m_nc != null){
                this.close();
                this.m_nc.removeEventListener(NetStatusEvent.NET_STATUS, this.connNetStatus);
                this.m_nc = null;
            };
            this.m_nc = new NetConnection();
            this.m_nc.addEventListener(NetStatusEvent.NET_STATUS, this.connNetStatus);
        }

        private function connNetStatus(_arg_1:NetStatusEvent):void
        {
            var _local_2:UDPConnEvent;
            var _local_3:NetStream;
            switch (_arg_1.info.code){
                case "NetConnection.Connect.Success":
                    _local_2 = new UDPConnEvent(UDPConnEvent.UDPCONN_CONNECTED, this._id);
                    _local_2.setTarget(this);
                    _local_2.message = this.m_nc.nearID;
                    dispatchEvent(_local_2);
                    return;
                case "NetConnection.Connect.Failed":
                case "NetConnection.Connect.Rejected":
                    this.close();
                    _local_2 = new UDPConnEvent(UDPConnEvent.UDPCONN_ERROR, this._id);
                    _local_2.setTarget(this);
                    return;
                case "NetConnection.Connect.Closed":
                    _local_2 = new UDPConnEvent(UDPConnEvent.UDPCONN_CLOSED, this._id);
                    _local_2.setTarget(this);
                    dispatchEvent(_local_2);
                    return;
                case "NetStream.Connect.Success":
                    _local_3 = _arg_1.info.stream;
                    _local_3.client = this;
                    return;
                case "NetStream.Connect.Closed":
                    _local_3 = NetStream(_arg_1.info.stream);
                    return;
                case "NetStream.Connect.Rejected":
                case "NetStream.Connect.Failed":
                    _local_3 = NetStream(_arg_1.info.stream);
                    return;
            };
        }

        public function onPeerData(_arg_1:Object):void
        {
            var _local_2:ADFHead;
            var _local_3:int;
            this._data = (_arg_1 as ByteArray);
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
                        this.onPeerData(null);
                    };
                };
            };
        }

        private function netGroupNetStatus(_arg_1:NetStatusEvent):void
        {
        }

        public function getConnID():int
        {
            return (this._id);
        }

        public function setTimeOut(_arg_1:int):void
        {
        }

        public function connect(_arg_1:String, _arg_2:int):void
        {
            this.m_cHost = _arg_1;
            this.m_cPort = _arg_2;
            this.reconnect();
        }

        public function reconnect():void
        {
            this.m_nc.connect(((("rtmfp://" + this.m_cHost) + ":") + this.m_cPort));
        }

        public function isConnected():Boolean
        {
            return (this.m_nc.connected);
        }

        public function send(_arg_1:ADF):Boolean
        {
            var _local_3:NetStream;
            var _local_2:PBaseP2PProtocol = (_arg_1.body as PBaseP2PProtocol);
            if (this.m_nc.connected){
                if (this.m_SadfProcesser != null){
                    this.m_SadfProcesser(_arg_1);
                };
                this.m_outByteBuff.length = 0;
                _arg_1.write(this.m_outByteBuff);
                _local_3 = this.m_p2pStream[_local_2.p2pKey];
                if (!_local_3){
                    _local_3 = new NetStream(this.m_nc, _local_2.p2pKey);
                    _local_3.client = this;
                    this.m_p2pStream[_local_2.p2pKey] = _local_3;
                };
                _local_3.send("onPeerData", this.m_outByteBuff);
                return (true);
            };
            if (!this.isDebugConnetion){
                warning("[AIUDPConnection] 错误:尝试向一个非连接的SOCKET上写数据!");
            };
            return (false);
        }

        public function sendBytes(_arg_1:ByteArray):void
        {
        }

        public function writeBytes(_arg_1:ByteArray):void
        {
        }

        public function close():void
        {
            var key:Object;
            var netStream:NetStream;
            if (this.m_nc != null){
                for (/*?*/in this.m_p2pStream) {
                };
                this.m_nc.close();
            };

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        public function dispose():void
        {
            this.close();
            this.m_nc.removeEventListener(NetStatusEvent.NET_STATUS, this.connNetStatus);
            this.m_nc = null;
            clear();
        }

        public function getHost():String
        {
            return (this.m_cHost);
        }

        public function getPort():int
        {
            return (this.m_cPort);
        }

        public /*  ©init. */ function _SafeStr_803()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_803 = " UDPConnection" (String#14720)


