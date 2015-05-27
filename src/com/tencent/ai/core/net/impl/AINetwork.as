// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.AINetwork

package com.tencent.ai.core.net.impl
{
    import com.tencent.ai.core.net.INetwork;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ServerInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import com.tencent.ai.core.events.TCPConnEvent;
    import com.tencent.ai.core.events.UDPConnEvent;
    import com.tencent.ai.core.net.IConnection;
    import com.tencent.ai.core.net.ADF;
    import com.tencent.ai.core.net.ADFHead;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ConnectionType;
    import com.tencent.ai.core.net.IHttpLoader;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.net.IProtocolListener;
    import com.tencent.ai.core.net.IGroup;
    import  ©init._SafeStr_792;

    public class AINetwork implements INetwork 
    {

        public static const VERSION:String = "20120216";

        protected var m_connClsMap:Dictionary;
        protected var m_conns:Array;
        protected var m_protocolClasses:Dictionary;
        protected var m_protocolInstances:Dictionary;
        protected var m_protocolListeners:Dictionary;
        protected var m_groups:Dictionary;
        protected var m_tcpID:int = 0;
        protected var m_defaultTcpID:int = 0;
        protected var m_clientMsgID:int = 0;
        protected var m_msgIDListeners:Dictionary;
        protected var m_serverInfo:ServerInfo;
        protected var m_cryptoManager:Object;

        public function AINetwork()
        {
            this.m_protocolClasses = ProtocolHelper.M_PROTOCOL_CLASSES;
            this.m_protocolInstances = ProtocolHelper.M_PROTOCOL_INSTANCES;
            this.m_protocolListeners = new Dictionary();
        }

        private function _destroyConnection(_arg_1:IConnection):void
        {
            if (_arg_1 != null){
                _arg_1.close();
                _arg_1.removeEventListener(TCPConnEvent.TCPCONN_ONADF, this.onReceiveADF);
                _arg_1.removeEventListener(UDPConnEvent.UDPCONN_ONADF, this.onReceiveADF);
                delete this.m_conns[_arg_1.getConnID()];
            };
        }

        protected function indexOf(_arg_1:Array, _arg_2:String, _arg_3:Function):int
        {
            var _local_4:int = (_arg_1.length - 1);
            while (_local_4 >= 0) {
                if (_arg_1[_local_4][_arg_2] == _arg_3){
                    return (_local_4);
                };
                _local_4--;
            };
            return (-1);
        }

        protected function broadCast(_arg_1:Array, _arg_2:ADF, _arg_3:int):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            var _local_4:int = _arg_1.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _arg_1[_local_5].onReceiveADF(_arg_2, _arg_3);
                _local_5++;
            };
            return (true);
        }

        protected function onReceiveADF(_arg_1:TCPConnEvent):void
        {
            var _local_8:Class;
            var _local_9:Object;
            var _local_2:ADF = _arg_1.getADF();
            var _local_3:int = _arg_1.getTCPID();
            var _local_4:ADFHead = _local_2.head;
            var _local_5:int = _local_4.cmdID;
            var _local_6:ISerialize = (this.m_protocolInstances[_local_5] as ISerialize);
            if (_local_6 == null){
                _local_8 = (this.m_protocolClasses[_local_5] as Class);
                if (_local_8 != null){
                    _local_6 = (new (_local_8)() as ISerialize);
                };
            };
            if (_local_6 != null){
                _local_6.read(_local_2.buf);
                _local_2.body = _local_6;
            };
            var _local_7:int = _local_4.msgID;
            if (_local_7 != 0){
                _local_9 = this.m_msgIDListeners[_local_7];
                if (_local_9 != null){
                    _local_9.onReceiveADF(_local_2, _local_3);
                    delete this.m_msgIDListeners[_local_7];
                    return;
                };
            };
            this.broadCast(this.m_protocolListeners[_local_5], _local_2, _local_3);
        }

        public function initialize(_arg_1:Object=null):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:Object;
            this.m_connClsMap = new Dictionary();
            this.m_connClsMap[ConnectionType.TCP_LINGER] = TcpConnectionLinger;
            this.m_connClsMap[ConnectionType.TCP_UNLINGER] = TcpConnetionUNLinger;
            this.m_connClsMap[ConnectionType.TCP_SERVER] = TcpConnectionServer;
            this.m_connClsMap[ConnectionType.UDP_LINGER] = UDPConnection;
            if (_arg_1 != null){
                _local_2 = _arg_1.connections;
                if (_local_2 != null){
                    _local_3 = 0;
                    while (_local_3 < _local_2.length) {
                        _local_4 = _local_2[_local_3];
                        this.m_connClsMap[_local_4.type] = _local_4.cls;
                        _local_3++;
                    };
                };
                this.m_serverInfo = _arg_1.serverInfo;
                this.m_cryptoManager = _arg_1.cryptoManager;
            };
            this.m_conns = [];
            this.m_msgIDListeners = new Dictionary();
            this.m_groups = new Dictionary();
        }

        public function getConnection(_arg_1:int):IConnection
        {
            return (this.m_conns[_arg_1]);
        }

        public function createConnection(_arg_1:int, _arg_2:Object=null):IConnection
        {
            var _local_3:Class = this.m_connClsMap[_arg_1];
            if (_local_3 == null){
                return (null);
            };
            var _local_4:IConnection = (new (_local_3)(this.m_tcpID) as IConnection);
            if (_arg_2 == null){
                _arg_2 = {};
            };
            _arg_2.serverInfo = this.m_serverInfo;
            _arg_2.cryptoManager = this.m_cryptoManager;
            _local_4.initialize(_arg_2);
            _local_4.addEventListener(TCPConnEvent.TCPCONN_ONADF, this.onReceiveADF);
            _local_4.addEventListener(UDPConnEvent.UDPCONN_ONADF, this.onReceiveADF);
            this.m_conns[this.m_tcpID] = _local_4;
            this.m_tcpID++;
            if (((!((_arg_2 == null))) && (!((_arg_2.helloBodyClass == null))))){
                this.registerProtocolClass(_arg_2.helloCmdIn, _arg_2.helloBodyClass);
            };
            return (_local_4);
        }

        public function destroyConnection(_arg_1:int):void
        {
            this._destroyConnection(this.m_conns[_arg_1]);
        }

        public function createHttpLoader(_arg_1:Boolean, _arg_2:int=-1, _arg_3:Object=null):IHttpLoader
        {
            var _local_4:HttpLoader = new HttpLoader(this.getServerInfo());
            _local_4.setNoCache(_arg_1);
            _local_4.setTimeOut(_arg_2);
            return (_local_4);
        }

        public function send(_arg_1:int, _arg_2:Object, _arg_3:int=-1):Boolean
        {
            return (this.sendAndListen2(_arg_1, _arg_2, null, this.m_conns[(((_arg_3 == -1)) ? this.m_defaultTcpID : _arg_3)], false));
        }

        public function sendAndListen(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean
        {
            return (this.sendAndListen2(_arg_1, _arg_2, _arg_3, this.m_conns[(((_arg_4 == -1)) ? this.m_defaultTcpID : _arg_4)], true));
        }

        public function sendAndListen2(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:IConnection, _arg_5:Boolean=false):Boolean
        {
            if (_arg_4 == null){
                return (false);
            };
            var _local_6:ADF;
            if (_arg_5){
                this.m_clientMsgID++;
                if (_arg_3 != null){
                    this.m_msgIDListeners[this.m_clientMsgID] = (((_arg_3 is Function)) ? {"onReceiveADF":_arg_3} : _arg_3);
                };
                _local_6 = ProtocolHelper.CreateADF(_arg_1, this.m_clientMsgID, _arg_2);
            } else {
                _local_6 = ProtocolHelper.CreateADF(_arg_1, 0, _arg_2);
            };
            return (_arg_4.send(_local_6));
        }

        public function cancelSendAndListen(_arg_1:Object, _arg_2:int=-1):void
        {
            var _local_3:Array;
            var _local_4:*;
            var _local_5:Object;
            var _local_6:int;
            for (_local_4 in this.m_msgIDListeners) {
                _local_5 = this.m_msgIDListeners[_local_4];
                if ((((_local_5 == _arg_1)) || ((_local_5.onReceiveADF == _arg_1)))){
                    if (_local_3 == null){
                        _local_3 = [];
                    };
                    _local_3.push(_local_4);
                };
            };
            if (_local_3){
                _local_6 = (_local_3.length - 1);
                while (_local_6 >= 0) {
                    delete this.m_msgIDListeners[_local_3[_local_6]];
                    _local_6--;
                };
            };
        }

        public function addFuncListener(_arg_1:int, _arg_2:Function):void
        {
            var _local_3:Array = this.m_protocolListeners[_arg_1];
            if (_local_3 == null){
                var _local_4 = [];
                _local_3 = _local_4;
                this.m_protocolListeners[_arg_1] = _local_4;
            };
            if (this.indexOf(_local_3, "onReceiveADF", _arg_2) == -1){
                _local_3.push({"onReceiveADF":_arg_2});
            };
        }

        public function removeFuncListener(_arg_1:int, _arg_2:Function):void
        {
            var _local_3:Array = this.m_protocolListeners[_arg_1];
            if (_local_3 == null){
                return;
            };
            var _local_4:int = this.indexOf(_local_3, "onReceiveADF", _arg_2);
            if (_local_4 != -1){
                _local_3.splice(_local_4, 1);
            };
        }

        public function addProtocolListener(_arg_1:IProtocolListener):void
        {
            var _local_5:int;
            var _local_6:Array;
            var _local_2:Vector.<int> = _arg_1.getCmdsInterest();
            if (_local_2 == null){
                return;
            };
            var _local_3:int = _local_2.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_6 = this.m_protocolListeners[_local_5];
                if (_local_6 == null){
                    _local_6 = [];
                    this.m_protocolListeners[_local_5] = _local_6;
                };
                if (_local_6.indexOf(_arg_1) == -1){
                    _local_6.push(_arg_1);
                };
                _local_4++;
            };
        }

        public function removeProtocolListener(_arg_1:IProtocolListener):void
        {
            var _local_5:int;
            var _local_6:Array;
            var _local_7:int;
            var _local_2:Vector.<int> = _arg_1.getCmdsInterest();
            if (_local_2 == null){
                return;
            };
            var _local_3:int = _local_2.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_6 = this.m_protocolListeners[_local_5];
                if (_local_6 != null){
                    _local_7 = _local_6.indexOf(_arg_1);
                    if (_local_7 != -1){
                        _local_6.splice(_local_7, 1);
                    };
                };
                _local_4++;
            };
        }

        public function setDefaultConnID(_arg_1:int):void
        {
            this.m_defaultTcpID = _arg_1;
        }

        public function getDefaultConnID():int
        {
            return (this.m_defaultTcpID);
        }

        public function getCurrentMsgID():int
        {
            return (this.m_clientMsgID);
        }

        public function registerProtocolClass(_arg_1:int, _arg_2:Class):void
        {
            this.m_protocolClasses[_arg_1] = _arg_2;
        }

        public function unregisterProtocolClass(_arg_1:int):void
        {
            delete this.m_protocolClasses[_arg_1];
        }

        public function hasProtocolClass(_arg_1:int):Boolean
        {
            return ((this.m_protocolClasses[_arg_1] is Class));
        }

        public function getProtocolClass(_arg_1:int):Class
        {
            return ((this.m_protocolClasses[_arg_1] as Class));
        }

        public function createGroup(_arg_1:String, _arg_2:int):IGroup
        {
            var _local_3:IConnection = this.getConnection(_arg_2);
            if (_local_3 == null){
                return (null);
            };
            var _local_4:TCPConnGroup = this.m_groups[_arg_1];
            if (_local_4 == null){
                _local_4 = new TCPConnGroup(this, _local_3, _arg_1);
                this.m_groups[_arg_1] = _local_4;
            } else {
                throw (new Error("[AINetwork] 这个Type分组已经存在，请destroyGroup 删除！"));
            };
            return (_local_4);
        }

        public function destroyGroup(_arg_1:String):void
        {
            var _local_2:IGroup = this.m_groups[_arg_1];
            if (_local_2 != null){
                delete this.m_groups[_arg_1];
                this._destroyConnection((_local_2.getConnection() as TCPConnection));
            };
        }

        public function getGroup(_arg_1:String):IGroup
        {
            return (this.m_groups[_arg_1]);
        }

        public function getServerInfo():ServerInfo
        {
            return (this.m_serverInfo);
        }

        public /*  ©init. */ function _SafeStr_792()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_792 = " AINetwork" (String#17684)


