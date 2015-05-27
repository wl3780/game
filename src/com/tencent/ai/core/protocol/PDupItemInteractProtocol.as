// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupItemInteractProtocol

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.protocol.data.P_InteractItemtInfo;
    import com.tencent.ai.core.data.SyncServerMsgInfo;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.protocol.data.P_SyncServerInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_992;

    public class PDupItemInteractProtocol extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589884;
        public static const OUT_CMD:int = 589883;

        public var sequence_no:uint;
        public var index:uint;
        public var pos:MapPosition;
        public var result:uint;
        public var playerID:PlayerID;
        public var take_effect_frame:uint;
        public var item_info:P_InteractItemtInfo;
        public var serverMsgInfo:SyncServerMsgInfo;

        public function PDupItemInteractProtocol()
        {
            use_event_no = true;
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                error("[PDupItemInteractReq]>>>read:result=", this.result);
                return;
            };
            this.sequence_no = _arg_1.readUnsignedInt();
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.take_effect_frame = _arg_1.readUnsignedInt();
            var _local_2:P_SyncServerInfo = new P_SyncServerInfo();
            _local_2.read(_arg_1);
            this.serverMsgInfo = _local_2.data;
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.sequence_no);
            _arg_1.writeShort(this.index);
            this.playerID.write(_arg_1);
            this.pos.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_992()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_992 = " PDupItemInteractProtocol" (String#16706)


