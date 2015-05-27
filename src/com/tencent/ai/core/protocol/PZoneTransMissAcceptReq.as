// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneTransMissAcceptReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1093;

    public class PZoneTransMissAcceptReq implements ISerialize 
    {

        public static const IN_CMD:int = 524396;
        public static const OUT_CMD:int = 524395;

        public var oMissID:uint;
        public var oPhaseID:uint;
        public var oNPCID:uint;
        public var iRet:int;


        public function read(_arg_1:IDataInput):void
        {
            this.iRet = _arg_1.readInt();
            if (((!((this.iRet == 0))) && (!((this.iRet == 80162))))){
                ProtocolHelper.handlerError2(this.iRet, IN_CMD);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.oMissID);
            _arg_1.writeUnsignedInt(this.oPhaseID);
            _arg_1.writeUnsignedInt(this.oNPCID);
        }

        public /*  ©init. */ function _SafeStr_1093()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1093 = " PZoneTransMissAcceptReq" (String#16742)


