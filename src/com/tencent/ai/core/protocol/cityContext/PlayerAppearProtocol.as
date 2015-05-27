// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PlayerAppearProtocol

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.protocol.data.P_PlayerAppear;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_858;

    public class PlayerAppearProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_PLAYER_APPEAR_REQ;//524295
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_PLAYER_APPEAR_RSP;//524296

        public var player:P_PlayerAppear;


        public function read(_arg_1:IDataInput):void
        {
            this.player = new P_PlayerAppear();
            this.player.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_858()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_858 = " PlayerAppearProtocol" (String#15932)


