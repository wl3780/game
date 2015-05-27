// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneRealNameRegistReq2

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1086;

    public class PZoneRealNameRegistReq2 implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_REAL_NAME_REG_RSP3;//524465
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_REAL_NAME_REG_REQ3;//524464

        public var ret:uint;
        public var status:uint;
        public var playername:String;
        public var playerid:String;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            this.status = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteString(_arg_1, this.playername);
            XString.WriteString(_arg_1, this.playerid);
        }

        public /*  ©init. */ function _SafeStr_1086()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1086 = " PZoneRealNameRegistReq2" (String#17699)


