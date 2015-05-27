// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PvpPlayerInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_911;

    public class P_PvpPlayerInfo implements ISerialize 
    {

        public var playerID:PlayerID;
        public var groupID:int;
        public var pkLevel:int;
        public var nickname:String;
        public var careerID:int;
        public var isFriend:int;
        public var isReady:Boolean;
        public var clientGroupID:int;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.groupID = _arg_1.readByte();
            this.pkLevel = _arg_1.readUnsignedShort();
            this.nickname = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.careerID = _arg_1.readUnsignedInt();
            this.isFriend = _arg_1.readUnsignedByte();
            this.isReady = _arg_1.readBoolean();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_911()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_911 = " P_PvpPlayerInfo" (String#17414)


