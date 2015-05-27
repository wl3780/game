// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneBuffChangeRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.SpecialStatusInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1068;

    public class PZoneBuffChangeRsp implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_BUFF_CHANGE_RSP;//524414

        public var buffType:uint;
        public var change:int;
        public var endTime:uint;
        public var buffInfo:SpecialStatusInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.buffType = _arg_1.readUnsignedInt();
            this.change = _arg_1.readByte();
            this.endTime = _arg_1.readUnsignedInt();
            this.buffInfo = DEFINE.DM.getSpecialStatusInfo(this.buffType);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.buffType);
            _arg_1.writeByte(this.change);
            _arg_1.writeUnsignedInt(this.endTime);
        }

        public /*  ©init. */ function _SafeStr_1068()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1068 = " PZoneBuffChangeRsp" (String#16703)


