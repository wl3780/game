// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.TCPConnEvent

package com.tencent.ai.core.events
{
    import com.tencent.ai.core.net.ADF;
    import flash.events.Event;
    import  ©init._SafeStr_560;

    public class TCPConnEvent extends BaseEvent 
    {

        public static const TCPCONN_CONNECTED:String = "tcpConnConnected";
        public static const TCPCONN_CLOSED:String = "tcpConnClosed";
        public static const TCPCONN_ERROR:String = "tcpConnError";
        public static const TCPCONN_ONADF:String = "tcpConnOnADF";
        public static const TCPCONN_TIMEOUT:String = "tcpConnTimeOut";
        public static const TCPCONN_REQ_POLICY:String = "tcpConnReqPolicy";
        public static const ERROR_TYPE_IO_ERROR:int = 1;
        public static const ERROR_TYPE_VERIFY_ERROR:int = 2;
        public static const ERROR_TYPE_SECURITY_ERROR:int = 3;

        public var dataType:int;
        private var __tcpID:int = 0;

        public function TCPConnEvent(_arg_1:String, _arg_2:int=0, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.__tcpID = _arg_2;
        }

        public function getTCPID():int
        {
            return (this.__tcpID);
        }

        public function getADF():ADF
        {
            return ((data as ADF));
        }

        override public function clone():Event
        {
            var _local_1:TCPConnEvent = (super.clone() as TCPConnEvent);
            _local_1.dataType = this.dataType;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_560()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_560 = " TCPConnEvent" (String#16166)


