// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PIndulgeStateReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1004;

    public class PIndulgeStateReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_INDULGE_STATE_RSP;//524455
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_INDULGE_STATE_REQ;//524454

        public var indulgestate:uint;
        public var daytype:uint;
        public var onlinetime:uint;
        public var type:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.indulgestate = _arg_1.readUnsignedByte();
            this.daytype = _arg_1.readUnsignedByte();
            this.onlinetime = _arg_1.readUnsignedShort();
            this.type = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1004()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1004 = " PIndulgeStateReq" (String#15866)


