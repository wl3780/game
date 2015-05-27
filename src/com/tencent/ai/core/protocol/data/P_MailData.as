// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_MailData

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.MailID;
    import com.tencent.ai.core.data.PlayerID;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.AttribPair;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_894;
    import __AS3__.vec.*;

    public class P_MailData implements ISerialize 
    {

        public var version:int;
        public var mail_id:MailID;
        public var player_id:PlayerID;
        public var sendPlayerNick:String;
        public var mailType:int;
        public var sendTime:int;
        public var readTime:int;
        public var readFlag:int;
        public var mailTitle:String;
        public var mailContent:String;
        public var annexSize:int;
        public var annexList:Vector.<AttribPair>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:AttribPair;
            this.version = _arg_1.readUnsignedShort();
            this.mail_id = new MailID();
            this.mail_id.read(_arg_1);
            this.player_id = new PlayerID();
            this.player_id.read(_arg_1);
            this.sendPlayerNick = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.mailType = _arg_1.readUnsignedInt();
            this.sendTime = _arg_1.readUnsignedInt();
            this.readTime = _arg_1.readUnsignedInt();
            this.readFlag = _arg_1.readUnsignedByte();
            this.mailTitle = XString.ReadChars(_arg_1, Constants.LEN_MAIL_TITLE);
            this.mailContent = XString.ReadChars(_arg_1, Constants.LEN_MAIL_CONTENT);
            this.annexSize = _arg_1.readUnsignedShort();
            this.annexList = new Vector.<AttribPair>();
            var _local_3:int;
            while (_local_3 < this.annexSize) {
                _local_2 = new AttribPair();
                _local_2.read(_arg_1);
                this.annexList.push(_local_2);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_894()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_894 = " P_MailData" (String#14861)


