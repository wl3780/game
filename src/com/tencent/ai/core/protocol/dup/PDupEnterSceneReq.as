// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupEnterSceneReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_936;
    import __AS3__.vec.*;

    public class PDupEnterSceneReq extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589844;
        public static const OUT_CMD:int = 589841;

        public var dup_key:uint;
        public var scene_id:int;
        public var _result:int;
        public var _random_seed:uint;
        public var _player_pos_arr:Vector.<MapPosition>;
        public var _pet_pos_arr:Vector.<MapPosition>;
        public var _monster_pos_arr:Vector.<MapPosition>;
        public var petID:uint;


        override public function read(_arg_1:IDataInput):void
        {
            var _local_5:PlayerID;
            var _local_6:MapPosition;
            var _local_7:MapPosition;
            super.read(_arg_1);
            this._result = _arg_1.readInt();
            this._random_seed = _arg_1.readUnsignedInt();
            var _local_2:int = _arg_1.readUnsignedShort();
            this._player_pos_arr = new Vector.<MapPosition>();
            this._pet_pos_arr = new Vector.<MapPosition>();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_5 = new PlayerID();
                _local_5.read(_arg_1);
                _local_6 = new MapPosition();
                _local_6.decodeBytes(_arg_1);
                this.petID = _arg_1.readUnsignedInt();
                _local_7 = new MapPosition();
                _local_7.decodeBytes(_arg_1);
                this._pet_pos_arr.push(_local_7);
                this._player_pos_arr.push(_local_6);
                _local_3++;
            };
            this._monster_pos_arr = new Vector.<MapPosition>();
            var _local_4:int = _arg_1.readUnsignedShort();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _arg_1.readUnsignedShort();
                _local_6 = new MapPosition();
                _local_6.decodeBytes(_arg_1);
                this._monster_pos_arr.push(_local_6);
                _local_3++;
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.dup_key);
            _arg_1.writeByte(this.scene_id);
        }

        public /*  ©init. */ function _SafeStr_936()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_936 = " PDupEnterSceneReq" (String#15578)


