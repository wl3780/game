// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.TCPConnGroup

package com.tencent.ai.core.net.impl
{
    import com.tencent.ai.core.net.IGroup;
    import com.tencent.ai.core.net.INetwork;
    import com.tencent.ai.core.net.IConnection;
    import  ©init._SafeStr_802;

    public class TCPConnGroup implements IGroup 
    {

        protected var net:INetwork;
        protected var connID:int;
        protected var conn:IConnection;
        protected var type:String;

        public function TCPConnGroup(_arg_1:INetwork, _arg_2:IConnection, _arg_3:String)
        {
            this.net = _arg_1;
            this.connID = _arg_2.getConnID();
            this.type = _arg_3;
            this.conn = _arg_2;
        }

        public function send(_arg_1:int, _arg_2:Object):Boolean
        {
            return (this.net.sendAndListen2(_arg_1, _arg_2, null, this.conn));
        }

        public function sendAndListen(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean
        {
            return (this.net.sendAndListen2(_arg_1, _arg_2, _arg_3, this.conn, true));
        }

        public function getConnection():IConnection
        {
            return (this.conn);
        }

        public function getType():String
        {
            return (this.type);
        }

        public /*  ©init. */ function _SafeStr_802()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_802 = " TCPConnGroup" (String#14873)


