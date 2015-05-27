// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneTirednessChgRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1091;

    public class PZoneTirednessChgRsp implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_TIREDNESS_CHG_RSP;//524441
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_TIREDNESS_CHG_REQ;//524440

        public var release_type:uint;
        public var tirednum:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.tirednum = _arg_1.readShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.release_type);
        }

        public /*  ©init. */ function _SafeStr_1091()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1091 = " PZoneTirednessChgRsp" (String#15158)


