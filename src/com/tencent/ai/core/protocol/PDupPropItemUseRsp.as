// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupPropItemUseRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.SyncServerMsgInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import com.tencent.ai.core.protocol.data.P_SyncServerInfo;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_996;

    public class PDupPropItemUseRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589868;

        public var iPlayerID:PlayerID;
        public var iTakeEffectFrame:uint;
        public var iRet:int;
        public var iSerID:int;
        public var itemUseRsp:SyncServerMsgInfo;
        private var take_effect_seq_:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.iPlayerID = new PlayerID();
            this.iPlayerID.read(_arg_1);
            this.iTakeEffectFrame = _arg_1.readUnsignedInt();
            this.take_effect_seq_ = _arg_1.readUnsignedInt();
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                ProtocolHelper.handlerError(this.iRet, IN_CMD);
                return;
            };
            this.iSerID = _arg_1.readUnsignedInt();
            var _local_2:P_SyncServerInfo = new P_SyncServerInfo();
            _local_2.read(_arg_1);
            this.itemUseRsp = _local_2.data;
        }

        public /*  ©init. */ function _SafeStr_996()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_996 = " PDupPropItemUseRsp" (String#17630)


