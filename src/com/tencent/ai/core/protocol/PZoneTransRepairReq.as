// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneTransRepairReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_ZoneTransRepairChg;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1096;
    import __AS3__.vec.*;

    public class PZoneTransRepairReq implements ISerialize 
    {

        public static const IN_CMD:int = 524392;
        public static const OUT_CMD:int = 524391;

        public var oSids:Vector.<int>;
        public var iResult:uint;
        public var iCost:int;
        public var iSids:Vector.<P_ZoneTransRepairChg>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_ZoneTransRepairChg;
            this.iSids = new Vector.<P_ZoneTransRepairChg>();
            this.iResult = _arg_1.readUnsignedInt();
            if (this.iResult != 0){
                ProtocolHelper.handlerError(this.iResult, IN_CMD);
                return;
            };
            this.iCost = _arg_1.readUnsignedInt();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_ZoneTransRepairChg();
                _local_4.read(_arg_1);
                this.iSids.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _local_3 = this.oSids.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _arg_1.writeUnsignedInt(this.oSids[_local_2]);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_1096()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1096 = " PZoneTransRepairReq" (String#15476)


