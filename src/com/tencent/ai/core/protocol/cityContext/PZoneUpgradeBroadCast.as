// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PZoneUpgradeBroadCast

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_868;

    public class PZoneUpgradeBroadCast implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_BROADCAST_UPGRADE_RSP;//524522

        public var playerID:PlayerID;
        public var upgradeLV:int;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.upgradeLV = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_868()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_868 = " PZoneUpgradeBroadCast" (String#16700)


