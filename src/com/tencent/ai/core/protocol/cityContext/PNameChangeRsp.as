// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PNameChangeRsp

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_860;

    public class PNameChangeRsp implements ISerialize 
    {

        public static const RSP:int = 526196;

        public var playerID:PlayerID;
        public var newName:String;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.newName = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_860()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_860 = " PNameChangeRsp" (String#16520)


