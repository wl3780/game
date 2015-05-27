// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneRealNameRegistReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1085;

    public class PZoneRealNameRegistReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_REAL_NAME_REG_RSP2;//524463
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_REAL_NAME_REG_REQ2;//524462

        public var ret:uint;
        public var status:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            this.status = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1085()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1085 = " PZoneRealNameRegistReq" (String#15914)


