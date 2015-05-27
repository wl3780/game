// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupBornStatusChgRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.protocol.data.P_SSModel;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_984;
    import __AS3__.vec.*;

    public class PDupBornStatusChgRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = ProtocolIDDef.DUP_CMD_BORN_STATUS_CHG_RSP;//589922

        public var iPlayerID:PlayerID;
        public var iTakeEffectFrame:uint;
        public var iTakeEffectSeq:uint;
        public var iSSModels:Vector.<SSModel>;


        override public function read(_arg_1:IDataInput):void
        {
            var _local_4:SSModel;
            super.read(_arg_1);
            this.iPlayerID = new PlayerID();
            this.iPlayerID.read(_arg_1);
            this.iTakeEffectFrame = _arg_1.readUnsignedInt();
            this.iTakeEffectSeq = _arg_1.readUnsignedInt();
            this.iSSModels = new Vector.<SSModel>();
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:P_SSModel = new P_SSModel();
            var _local_5:int;
            while (_local_5 < _local_2) {
                _local_3.read(_arg_1);
                _local_4 = _local_3.data;
                _local_4.isBorn = true;
                this.iSSModels.push(_local_4);
                _local_3.data = null;
                _local_5++;
            };
        }

        public /*  ©init. */ function _SafeStr_984()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_984 = " PDupBornStatusChgRsp" (String#15791)


