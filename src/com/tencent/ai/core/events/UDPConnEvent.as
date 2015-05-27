// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.UDPConnEvent

package com.tencent.ai.core.events
{
    import com.tencent.ai.core.net.ADF;
    import flash.events.Event;
    import  ©init._SafeStr_563;

    public class UDPConnEvent extends BaseEvent 
    {

        public static const UDPCONN_CONNECTED:String = "udpConnConnected";
        public static const UDPCONN_CLOSED:String = "udpConnClosed";
        public static const UDPCONN_ERROR:String = "udpConnError";
        public static const UDPCONN_ONADF:String = "udpConnOnADF";
        public static const UDPCONN_TIMEOUT:String = "udpConnTimeOut";
        public static const UDPCONN_REQ_POLICY:String = "udpConnReqPolicy";
        public static const ERROR_TYPE_IO_ERROR:int = 1;
        public static const ERROR_TYPE_VERIFY_ERROR:int = 2;
        public static const ERROR_TYPE_SECURITY_ERROR:int = 3;

        public var dataType:int;
        private var __udpID:int = 0;

        public function UDPConnEvent(_arg_1:String, _arg_2:int=0, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.__udpID = _arg_2;
        }

        public function getUDPID():int
        {
            return (this.__udpID);
        }

        public function getADF():ADF
        {
            return ((data as ADF));
        }

        override public function clone():Event
        {
            var _local_1:UDPConnEvent = (super.clone() as UDPConnEvent);
            _local_1.dataType = this.dataType;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_563()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_563 = " UDPConnEvent" (String#15953)


