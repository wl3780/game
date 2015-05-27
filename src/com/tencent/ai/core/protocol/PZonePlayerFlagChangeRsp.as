// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZonePlayerFlagChangeRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1082;

    public class PZonePlayerFlagChangeRsp implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_BROADCAST_EFFECT_RSP;//524481

        public var playerID:PlayerID;
        public var type:int;
        public var flagType:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.type = _arg_1.readInt();
            this.flagType = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1082()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1082 = " PZonePlayerFlagChangeRsp" (String#15311)


