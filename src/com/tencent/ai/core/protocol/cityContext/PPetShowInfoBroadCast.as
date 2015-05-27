// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PPetShowInfoBroadCast

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.PetShowInfo;
    import com.tencent.ai.core.protocol.data.ReadIn;
    import com.tencent.ai.core.protocol.data.P_PetShowInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_862;

    public class PPetShowInfoBroadCast implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_FOLLOWPET_BROADCAST_RSP;//524736
        public static var BC_TYPE_ADD:int = 0;
        public static var BC_TYPE_REMOVE:int = 1;
        public static var BC_TYPE_UPATE:int = 2;

        public var broadCastType:int;
        public var playerID:PlayerID;
        public var petshowInfo:PetShowInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.broadCastType = _arg_1.readInt();
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.petshowInfo = new PetShowInfo();
            ReadIn(_arg_1, this.petshowInfo, P_PetShowInfo);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_862()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_862 = " PPetShowInfoBroadCast" (String#17483)


