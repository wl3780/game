// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneGeneralGiftPackageReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_GiftPackageStatusInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1072;
    import __AS3__.vec.*;

    public class PZoneGeneralGiftPackageReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_REAL_NAME_REG_RSP;//524467
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_REAL_NAME_REG_REQ;//524466

        public var getorquery:uint;
        public var type:uint;
        public var id:uint;
        public var backtype:uint;
        public var backboxnum:uint;
        public var ret:int;
        public var serverinfos:Vector.<P_GiftPackageStatusInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:P_GiftPackageStatusInfo;
            this.ret = _arg_1.readInt();
            this.backtype = _arg_1.readUnsignedShort();
            this.backboxnum = _arg_1.readUnsignedShort();
            this.serverinfos = new Vector.<P_GiftPackageStatusInfo>();
            var _local_2:uint;
            while (_local_2 < this.backboxnum) {
                _local_3 = new P_GiftPackageStatusInfo();
                _local_3.read(_arg_1);
                this.serverinfos.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.getorquery);
            _arg_1.writeShort(this.type);
            _arg_1.writeInt(this.id);
        }

        public /*  ©init. */ function _SafeStr_1072()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1072 = " PZoneGeneralGiftPackageReq" (String#14279)


