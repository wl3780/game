// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ProtocolEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_555;

    public class ProtocolEvent extends BaseEvent 
    {

        public static const PROTOCOL_ERROR_CODE:String = "protocolErrorCode";
        public static const DUP_ENTER_ERROR_CODE:String = "dupEnterErrorCode";
        public static const DUP_NETWORK_STATE:String = "dupNetworkState";

        public function ProtocolEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_555()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_555 = " ProtocolEvent" (String#16562)


