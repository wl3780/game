// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PWalkBroadcast

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.protocol.data.P_WalkStateInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_865;

    public class PWalkBroadcast implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_WALK_BROADCAST_REQ;//524307
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_WALK_BROADCAST_RSP;//524308

        public var walkState:P_WalkStateInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.walkState = new P_WalkStateInfo();
            this.walkState.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_865()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_865 = " PWalkBroadcast" (String#13826)


