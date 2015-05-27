// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ServerInfo

package com.tencent.ai.core.data
{
    import com.tencent.free.setup.data.ServerInfoDef;
    import  ©init._SafeStr_327;

    public class ServerInfo 
    {

        public var defaultHost1:String;
        public var defaultPort1:int;
        public var defaultHost2:String;
        public var defaultPort2:int;
        public var defaultHost3:String;
        public var defaultPort3:int;
        public var dirHost:String = "127.0.0.1";
        public var dirPort:int = 443;
        public var roleListHost:String = "127.0.0.1";
        public var roleListPort:int = 443;
        public var regHost:String = "127.0.0.1";
        public var regPort:int = 443;
        public var roomHost:String = "127.0.0.1";
        public var roomPort:int = 443;
        public var roomName:String = "";
        public var roomID:int;
        public var crossDomainHost:String = "127.0.0.1";
        public var crossDomainPort:int = 843;
        public var sessionKey:String = null;
        public var sessionUpdateTime:int = 1;
        public var uin:int = 329052613;
        public var cryptoKey:String = "1234567890123456";
        public var tgwEnabled:Boolean = true;
        public var p2pHost:String = "127.0.0.1";
        public var p2pPort:int = 6600;

        public function ServerInfo(_arg_1:ServerInfoDef=null)
        {
            if (_arg_1 != null){
                this.dirHost = _arg_1.DirServer.host;
                this.dirPort = _arg_1.DirServer.port;
                this.roleListHost = _arg_1.RoleListServer.host;
                this.roleListPort = _arg_1.RoleListServer.port;
                this.regHost = _arg_1.RegServer.host;
                this.regPort = _arg_1.RegServer.port;
                this.crossDomainHost = _arg_1.CrossDomain.host;
                this.crossDomainPort = _arg_1.CrossDomain.port;
                this.p2pHost = _arg_1.P2PServer.host;
                this.p2pPort = _arg_1.P2PServer.port;
                this.defaultHost1 = _arg_1.DefaultServer1.host;
                this.defaultPort1 = _arg_1.DefaultServer1.port;
                this.defaultHost2 = _arg_1.DefaultServer2.host;
                this.defaultPort2 = _arg_1.DefaultServer2.port;
                this.defaultHost3 = _arg_1.DefaultServer3.host;
                this.defaultPort3 = _arg_1.DefaultServer3.port;
            };
        }

        public /*  ©init. */ function _SafeStr_327()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_327 = " ServerInfo" (String#17795)


