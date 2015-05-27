// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneTransDropItemReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1092;

    public class PZoneTransDropItemReq implements ISerialize 
    {

        public static const IN_CMD:int = 524378;
        public static const OUT_CMD:int = 524377;

        public var oItemID:int;
        public var oSerialID:int;
        public var oNum:int;
        public var iRet:int;
        public var iItemID:int;
        public var iSerialID:int;
        public var iNum:int;


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
            _arg_1.writeUnsignedInt(this.oSerialID);
            _arg_1.writeUnsignedInt(this.oItemID);
            _arg_1.writeShort(this.oNum);
        }

        public /*  ©init. */ function _SafeStr_1092()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1092 = " PZoneTransDropItemReq" (String#15767)


