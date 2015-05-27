// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PlayerBaseInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_907;

    public class P_PlayerBaseInfo implements ISerialize 
    {

        public var playerID:PlayerID;
        public var player_nick:String;
        public var career_id:uint;
        public var level:int;
        public var is_ready:uint;
        public var seat_id:uint;
        public var vip_info:VipSimpleInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.player_nick = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.career_id = _arg_1.readUnsignedInt();
            this.level = _arg_1.readUnsignedShort();
            this.is_ready = _arg_1.readUnsignedByte();
            this.seat_id = _arg_1.readUnsignedByte();
            this.vip_info = new VipSimpleInfo();
            this.vip_info.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_907()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_907 = " P_PlayerBaseInfo" (String#15197)


