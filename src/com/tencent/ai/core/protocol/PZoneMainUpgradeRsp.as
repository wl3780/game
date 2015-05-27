// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneMainUpgradeRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.AttributeInfo;
    import com.tencent.ai.core.protocol.data.P_CombatAttrib;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1073;

    public class PZoneMainUpgradeRsp implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_MAIN_UPGRADE_RSP;//524372

        public var uin:uint = 0;
        public var upgrade_lv:uint;
        public var attr:AttributeInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.upgrade_lv = _arg_1.readUnsignedShort();
            var _local_2:P_CombatAttrib = P_CombatAttrib.P;
            _local_2.read(_arg_1);
            this.attr = _local_2.data;
            this.attr.level = this.upgrade_lv;
            _local_2.data = null;
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1073()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1073 = " PZoneMainUpgradeRsp" (String#16097)


