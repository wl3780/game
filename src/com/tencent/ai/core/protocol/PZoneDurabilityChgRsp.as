// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneDurabilityChgRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_ZoneTransRepairChg;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1070;
    import __AS3__.vec.*;

    public class PZoneDurabilityChgRsp implements ISerialize 
    {

        public static const IN_CMD:int = 524390;

        public var iChgDatas:Vector.<P_ZoneTransRepairChg>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_ZoneTransRepairChg;
            this.iChgDatas = new Vector.<P_ZoneTransRepairChg>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_ZoneTransRepairChg();
                _local_4.read(_arg_1);
                this.iChgDatas.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1070()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1070 = " PZoneDurabilityChgRsp" (String#15806)


