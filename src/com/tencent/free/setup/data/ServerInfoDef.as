// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.data.ServerInfoDef

package com.tencent.free.setup.data
{
    import  ©init._SafeStr_56;

    public dynamic class ServerInfoDef 
    {

        public var DefaultServer1:HostDef;
        public var DefaultServer2:HostDef;
        public var DefaultServer3:HostDef;
        public var DirServer:HostDef;
        public var RoleListServer:HostDef;
        public var RegServer:HostDef;
        public var CrossDomain:HostDef;
        public var P2PServer:HostDef;

        public function ServerInfoDef()
        {
            this.DirServer = new HostDef();
            this.RoleListServer = new HostDef();
            this.RegServer = new HostDef();
            this.CrossDomain = new HostDef();
            this.DefaultServer1 = new HostDef();
            this.DefaultServer2 = new HostDef();
            this.DefaultServer3 = new HostDef();
            this.P2PServer = new HostDef();
        }

        public /*  ©init. */ function _SafeStr_56()
        {
        }


    }
}//package com.tencent.free.setup.data

// _SafeStr_56 = " ServerInfoDef" (String#1376)


