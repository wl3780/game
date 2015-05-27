// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PReadMail

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.MailID;
    import com.tencent.ai.core.protocol.data.P_MailData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1024;

    public class PReadMail implements ISerialize 
    {

        public static const IN_CMD:int = 0x140006;
        public static const OUT_CMD:int = 0x140005;

        public var mail_id:MailID;
        public var result:int;
        public var mailData:P_MailData;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.mailData = new P_MailData();
            this.mailData.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.mail_id.group_id);
            _arg_1.writeUnsignedInt(this.mail_id.id);
        }

        public /*  ©init. */ function _SafeStr_1024()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1024 = " PReadMail" (String#15839)


