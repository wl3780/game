// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupMonsterDeadReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.protocol.data.P_Tetrad;
    import com.tencent.ai.core.protocol.data.P_DUPDropItem;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_993;

    public class PDupMonsterDeadReq extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = ProtocolIDDef.DUP_MONSTER_DEAD_RSP;//589878
        public static const OUT_CMD:int = ProtocolIDDef.DUP_MONSTER_DEAD_REQ;//589877

        public var id:int = 0;
        public var monsterID:int = 0;
        public var pos:MapPosition;
        public var tetrad:P_Tetrad;
        public var result:int;
        public var sequence_no:uint;
        public var take_effect_frame:uint;
        public var base_exp:uint;
        public var group_exp:uint;
        public var dropsNum:int;
        public var drops:Array;

        public function PDupMonsterDeadReq()
        {
            use_event_no = true;
        }

        override public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:P_DUPDropItem;
            super.read(_arg_1);
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.sequence_no = _arg_1.readInt();
                this.take_effect_frame = _arg_1.readUnsignedInt();
                this.base_exp = _arg_1.readUnsignedInt();
                this.group_exp = _arg_1.readUnsignedInt();
                this.dropsNum = _arg_1.readUnsignedShort();
                if (this.dropsNum > 0){
                    this.drops = new Array();
                    _local_2 = 0;
                    while (_local_2 < this.dropsNum) {
                        _local_3 = new P_DUPDropItem();
                        _local_3.read(_arg_1);
                        this.drops.push(_local_3);
                        _local_2++;
                    };
                };
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.sequence_no);
            this.tetrad.write(_arg_1);
            _arg_1.writeShort(this.id);
            _arg_1.writeUnsignedInt(this.monsterID);
            this.pos.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_993()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_993 = " PDupMonsterDeadReq" (String#16157)


