// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PMailGetRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.data.P_MailData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1010;

    public class PMailGetRsp implements ISerialize 
    {

        public static const IN_CMD:int = 0x140004;

        public var mailData:P_MailData;


        public function read(_arg_1:IDataInput):void
        {
            this.mailData = new P_MailData();
            this.mailData.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1010()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1010 = " PMailGetRsp" (String#14051)


