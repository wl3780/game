// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.MailEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_545;

    public class MailEvent extends BaseEvent 
    {

        public static const ON_REQUEST_MAIL:String = "onRequestMail";
        public static const ON_MAIL_GET:String = "onMailGet";

        public function MailEvent(_arg_1:String, _arg_2:Object, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_545()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_545 = " MailEvent" (String#14234)


