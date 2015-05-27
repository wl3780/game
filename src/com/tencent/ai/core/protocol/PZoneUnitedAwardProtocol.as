// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneUnitedAwardProtocol

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1097;
    import __AS3__.vec.*;

    public class PZoneUnitedAwardProtocol implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_AWARD_RSP;//524504
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_AWARD_REQ;//524503

        public var sim:ServerMsgInfo;
        public var num:uint;
        public var sims:Vector.<ServerMsgInfo>;

        public function PZoneUnitedAwardProtocol()
        {
            this.sim = new ServerMsgInfo();
            this.sims = new Vector.<ServerMsgInfo>();
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:ServerMsgInfo;
            this.sim.read(_arg_1);
            this.num = _arg_1.readUnsignedShort();
            var _local_2:uint;
            while (_local_2 < this.num) {
                _local_3 = new ServerMsgInfo();
                _local_3.read(_arg_1);
                this.sims.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1097()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1097 = " PZoneUnitedAwardProtocol" (String#15533)


