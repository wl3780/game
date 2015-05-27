// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneTransMissCdtnCheck

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.data.P_Tetrad;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1094;

    public class PZoneTransMissCdtnCheck implements ISerialize 
    {

        public static const IN_CMD:int = 524400;
        public static const OUT_CMD:int = 524399;

        public var oMissID:uint;
        public var oMiss_cdtn:P_Tetrad;
        public var iRet:int;


        public function read(_arg_1:IDataInput):void
        {
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                ProtocolHelper.handlerError(this.iRet, IN_CMD);
                return;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.oMissID);
            this.oMiss_cdtn.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1094()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1094 = " PZoneTransMissCdtnCheck" (String#16361)


