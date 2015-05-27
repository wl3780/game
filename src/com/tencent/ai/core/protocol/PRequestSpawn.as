// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PRequestSpawn

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.MonsterPackInfo;
    import com.tencent.ai.core.protocol.data.P_MonsterPackInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1026;

    public class PRequestSpawn extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = ProtocolIDDef.DUP_CMD_SPAWN_MONSTER_REQ;//589875
        public static const IN_CMD:int = ProtocolIDDef.DUP_CMD_SPAWN_MONSTER_RSP;//589876

        public var sequence_no:uint;
        public var spawnType:int;
        public var spawnData1:int;
        public var spawnData2:int;
        public var spawnData3:int;
        public var packID:uint;
        public var mapPos:MapPosition;
        public var _result:int;
        public var _monsterPackInfo:MonsterPackInfo;

        public function PRequestSpawn()
        {
            use_event_no = true;
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this._result = _arg_1.readInt();
            var _local_2:P_MonsterPackInfo = P_MonsterPackInfo.P;
            _local_2.read(_arg_1);
            this._monsterPackInfo = _local_2.data;
            _local_2.data = null;
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.sequence_no);
            _arg_1.writeInt(this.spawnType);
            _arg_1.writeInt(this.spawnData1);
            _arg_1.writeInt(this.spawnData2);
            _arg_1.writeInt(this.spawnData3);
            _arg_1.writeUnsignedInt(this.packID);
            this.mapPos.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1026()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1026 = " PRequestSpawn" (String#16247)


