// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PFriendChat

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_999;

    public class PFriendChat implements ISerialize 
    {

        public static const MAX_CHAT_TEXT_LEN:int = 200;
        public static const REQ:int = 524643;
        public static const RSP:int = 524644;

        public var playerID:PlayerID;
        public var sendTime:uint;
        public var chatMsg:String = "";


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.sendTime = _arg_1.readUnsignedInt();
            this.chatMsg = XString.ReadChars(_arg_1, MAX_CHAT_TEXT_LEN);
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.playerID.write(_arg_1);
            _arg_1.writeUnsignedInt(1);
            XString.WriteChars(_arg_1, this.chatMsg, MAX_CHAT_TEXT_LEN);
        }

        public /*  ©init. */ function _SafeStr_999()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_999 = " PFriendChat" (String#15086)


