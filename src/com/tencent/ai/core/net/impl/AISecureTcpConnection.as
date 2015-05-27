// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.AISecureTcpConnection

package com.tencent.ai.core.net.impl
{
    import flash.utils.Dictionary;
    import flash.utils.ByteArray;
    import com.tencent.ai.core.crypto.ICrypto;
    import com.tencent.ai.core.data.ServerInfo;
    import com.tencent.ai.core.crypto.ICryptoManager;
    import com.tencent.ai.core.protocol.PTL_CheckSignature;
    import flash.events.IOErrorEvent;
    import com.tencent.ai.core.net.ADFHead;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.free.utils.MD5;
    import com.tencent.ai.core.net.ADF;
    import com.tencent.ai.core.net.ProtocolHelper;
    import com.tencent.ai.core.protocol.PTL_GetNoCryptoCMDList;
    import com.tencent.ai.core.enum.CryptoID;
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;
    import flash.events.Event;
    import com.tencent.ai.core.utils.ISerialize;
    import  ©init._SafeStr_793;

    public class AISecureTcpConnection extends TCPConnection 
    {

        protected var m_noCryptoCmds:Dictionary;
        protected var m_tgwEnabled:Boolean;
        protected var m_sessionKey:String;
        protected var m_cryptoKey:String;
        protected var m_cryptoKeyBytes:ByteArray;
        protected var m_crypto:ICrypto;
        protected var m_headHost:String;
        protected var m_headPort:int;
        protected var m_serial:int;
        protected var m_needCrypto:Boolean;
        private var _cryptoBuff:ByteArray;
        private var _lastCheckTime:int;
        private var _checkInterval:int = 900000;
        private var _serverInfo:ServerInfo;
        private var _cryptoMgr:ICryptoManager;

        public function AISecureTcpConnection(_arg_1:int=0)
        {
            super(_arg_1);
            this._cryptoBuff = new ByteArray();
            this._lastCheckTime = 0;
            this.m_serial = 0;
            this.m_needCrypto = true;
        }

        override public function initialize(_arg_1:Object=null):void
        {
            super.initialize(_arg_1);
            if (_arg_1 != null){
                this._serverInfo = _arg_1.serverInfo;
                if (_arg_1.setHttpHead){
                    this.setHttpHead(_arg_1.headHost, _arg_1.headPort);
                };
                this._cryptoMgr = (_arg_1.cryptoManager as ICryptoManager);
            };
            this.updateSessionKey();
        }

        override public function reconnect():void
        {
            this.updateSessionKey();
            super.reconnect();
        }

        public function setHttpHead(_arg_1:String, _arg_2:int):void
        {
            this.m_headHost = _arg_1;
            this.m_headPort = _arg_2;
        }

        protected function updateSessionKey():void
        {
            if (this._serverInfo != null){
                this.m_tgwEnabled = this._serverInfo.tgwEnabled;
                this.m_sessionKey = this._serverInfo.sessionKey;
                this.m_cryptoKey = this._serverInfo.cryptoKey;
            };
        }

        protected function onSignatureChecked(_arg_1:ADF):Boolean
        {
            var _local_4:PTL_CheckSignature;
            var _local_5:IOErrorEvent;
            m_RadfProcesser = null;
            var _local_2:Boolean;
            var _local_3:ADFHead = _arg_1.head;
            if (_local_3.cmdID == ProtocolIDDef.SIGNATURE_CMD_RSP){
                _local_4 = new PTL_CheckSignature(this.m_sessionKey);
                _local_4.read(_arg_1.buf);
                _local_2 = _local_4.isValid;
            };
            if (_local_2){
                this.m_cryptoKey = MD5.hash(((_local_4.currentTime + "") + _local_3.playerID.uin));
                this.m_cryptoKey = this.m_cryptoKey.substr(0, 16);
                this.checkCrypto();
            } else {
                _local_5 = new IOErrorEvent(IOErrorEvent.VERIFY_ERROR);
                _local_5.text = "签名验证失败，请重新登录";
                onConnError(_local_5);
            };
            return (false);
        }

        protected function checkCrypto():void
        {
            var _local_1:ADF;
            if (this.m_cryptoKey != null){
                m_RadfProcesser = this.onCheckCrypto;
                _local_1 = ProtocolHelper.CreateADF(ProtocolIDDef.GET_NO_CRYPTO_CMD_LIST_REQ, 0, new PTL_GetNoCryptoCMDList());
                send(_local_1);
            } else {
                this.updateCrypto(CryptoID.NONE, this.m_cryptoKey);
                this.onSecureConnConnected();
            };
        }

        protected function updateCrypto(_arg_1:int=-1, _arg_2:String=null):void
        {
            if (this._cryptoMgr != null){
                this.m_crypto = this._cryptoMgr.getCrypto(_arg_1);
                this.m_cryptoKeyBytes = this._cryptoMgr.getCryptoKey(_arg_2);
            };
        }

        protected function onCheckCrypto(_arg_1:ADF):Boolean
        {
            var _local_3:PTL_GetNoCryptoCMDList;
            var _local_4:Vector.<int>;
            var _local_5:int;
            var _local_6:IOErrorEvent;
            m_RadfProcesser = null;
            var _local_2:Boolean;
            if (_arg_1.head.cmdID == ProtocolIDDef.GET_NO_CRYPTO_CMD_LIST_RSP){
                _local_3 = new PTL_GetNoCryptoCMDList();
                _local_3.read(_arg_1.buf);
                _local_2 = true;
                if (_local_3.isEncrypted){
                    _local_4 = _local_3.noCryptoCmds;
                    _local_5 = 0;
                    while (_local_5 < _local_4.length) {
                        this.m_noCryptoCmds[_local_4[_local_5]] = true;
                        _local_5++;
                    };
                    this.m_needCrypto = true;
                    this.updateCrypto(CryptoID.TEA, this.m_cryptoKey);
                } else {
                    this.m_needCrypto = false;
                    this.updateCrypto(CryptoID.NONE, this.m_cryptoKey);
                };
                this.onSecureConnConnected();
            };
            if (!_local_2){
                _local_6 = new IOErrorEvent(IOErrorEvent.VERIFY_ERROR);
                _local_6.text = "decryptoKey is invalid";
                onConnError(_local_6);
            };
            return (false);
        }

        protected function onSecureConnConnected():void
        {
            m_SadfProcesser = this.__encryptADF;
            m_RadfProcesser = this.__decryptADF;
            this.m_serial = 0;
            super.onConnConnected(null);
        }

        protected function sendCheckSignature():void
        {
            var _local_1:ADF;
            if ((getTimer() - this._lastCheckTime) >= this._checkInterval){
                this._lastCheckTime = getTimer();
                if (this.m_sessionKey != null){
                    _local_1 = ProtocolHelper.CreateADF(ProtocolIDDef.SIGNATURE_CMD_REQ, 0, new PTL_CheckSignature(this.m_sessionKey));
                    send(_local_1);
                };
            };
        }

        override protected function onConnConnected(_arg_1:Event):void
        {
            var _local_2:String;
            var _local_3:ByteArray;
            if (this.m_tgwEnabled){
                _local_2 = (((("tgw_l7_forward\r\nHost: " + this.m_headHost) + ":") + this.m_headPort) + "\r\n\r\n");
                _local_3 = new ByteArray();
                _local_3.writeUTFBytes(_local_2);
                writeBytes(_local_3);
            };
            if (this.m_noCryptoCmds == null){
                this.m_noCryptoCmds = new Dictionary();
                this.m_noCryptoCmds[ProtocolIDDef.SIGNATURE_CMD_REQ] = true;
                this.m_noCryptoCmds[ProtocolIDDef.SIGNATURE_CMD_RSP] = true;
                this.m_noCryptoCmds[ProtocolIDDef.GET_NO_CRYPTO_CMD_LIST_REQ] = true;
                this.m_noCryptoCmds[ProtocolIDDef.GET_NO_CRYPTO_CMD_LIST_RSP] = true;
            };
            if (this.m_sessionKey == null){
                this.m_sessionKey = "just a test key!";
            };
            m_RadfProcesser = this.onSignatureChecked;
            this._lastCheckTime = (0 - this._checkInterval);
            this.sendCheckSignature();
        }

        override public function connect(_arg_1:String, _arg_2:int):void
        {
            this.setHttpHead(_arg_1, _arg_2);
            super.connect(_arg_1, _arg_2);
        }

        override public function dispose():void
        {
            this.m_noCryptoCmds = null;
            if (this._cryptoBuff != null){
                this._cryptoBuff.clear();
                this._cryptoBuff = null;
            };
            if (this.m_cryptoKeyBytes != null){
                this.m_cryptoKeyBytes.clear();
                this.m_cryptoKeyBytes = null;
            };
            super.dispose();
        }

        private function __decryptADF(_arg_1:ADF):Boolean
        {
            var _local_4:ByteArray;
            var _local_2:ADFHead = _arg_1.head;
            var _local_3:int = _local_2.cmdID;
            if (((((this.m_needCrypto) && (!(this.m_noCryptoCmds[_local_3])))) && ((_local_2.pkgLen > 0)))){
                _local_4 = this.m_crypto.decrypt(_arg_1.buf, this.m_cryptoKeyBytes);
                _local_4.position = 0;
                _arg_1.buf = _local_4;
            };
            return (true);
        }

        private function __encryptADF(_arg_1:ADF):Boolean
        {
            var _local_3:ISerialize;
            var _local_2:int = _arg_1.head.cmdID;
            if (((this.m_needCrypto) && (!(this.m_noCryptoCmds[_local_2])))){
                this._cryptoBuff.clear();
                this.m_serial++;
                this.m_serial = (this.m_serial & 0xFF);
                this._cryptoBuff.writeByte(this.m_serial);
                _local_3 = _arg_1.body;
                if (_local_3 != null){
                    _local_3.write(this._cryptoBuff);
                    _arg_1.body = null;
                } else {
                    if (_arg_1.buf){
                        this._cryptoBuff.writeBytes(_arg_1.buf);
                    };
                };
                _arg_1.buf = this.m_crypto.encrypt(this._cryptoBuff, this.m_cryptoKeyBytes);
            };
            return (true);
        }

        public /*  ©init. */ function _SafeStr_793()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_793 = " AISecureTcpConnection" (String#14378)


