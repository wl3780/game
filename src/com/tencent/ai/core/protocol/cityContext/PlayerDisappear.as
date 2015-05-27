// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PlayerDisappear

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_859;

    public class PlayerDisappear implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_PLAYER_DISAPPEAR_REQ;//524297
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_PLAYER_DISAPPEAR_RSP;//524304

        public var playerID:PlayerID;


        public function read(_arg_1:IDataInput):void
        {
            if (this.playerID == null){
                this.playerID = new PlayerID();
            };
            this.playerID.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_859()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_859 = " PlayerDisappear" (String#17651)


