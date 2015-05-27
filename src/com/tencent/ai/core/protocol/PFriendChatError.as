// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PFriendChatError

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1000;

    public class PFriendChatError implements ISerialize 
    {

        public static const RSP:int = 524662;

        public var result:int;
        public var playerID:PlayerID;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1000()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1000 = " PFriendChatError" (String#15569)


