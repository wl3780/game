// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupEnterReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.protocol.data.P_CombatPlayerInfo;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_935;
    import __AS3__.vec.*;

    public class PDupEnterReq extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = 589827;
        public static const IN_CMD:int = 589830;

        public var dup_key:uint;
        public var p2p_key:String;
        public var _result:int;
        public var _dup_index:int;
        public var _players:Vector.<PlayerInfo>;
        public var birthSceneID:int;
        public var initPlayerNum:int;
        public var extraMonsterNum:int;
        public var extraMonsterVect:Vector.<int>;


        override public function read(_arg_1:IDataInput):void
        {
            var _local_5:PlayerInfo;
            super.read(_arg_1);
            this._result = _arg_1.readInt();
            this._dup_index = _arg_1.readUnsignedByte();
            this._players = new Vector.<PlayerInfo>();
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:P_CombatPlayerInfo = new P_CombatPlayerInfo();
            var _local_4:int;
            while (_local_4 < _local_2) {
                _local_3.read(_arg_1);
                _local_5 = _local_3.data;
                _local_3.data = null;
                this._players.push(_local_5);
                _local_4++;
            };
            _local_2 = _arg_1.readUnsignedShort();
            _local_4 = 0;
            while (_local_4 < _local_2) {
                this._players[_local_4].p2pKey = XString.ReadChars(_arg_1, Constants.LEN_P2PKEY);
                _local_4++;
            };
            this.birthSceneID = _arg_1.readUnsignedByte();
            this.initPlayerNum = _arg_1.readUnsignedByte();
            this.extraMonsterNum = _arg_1.readUnsignedShort();
            this.extraMonsterVect = new Vector.<int>();
            _local_4 = 0;
            while (_local_4 < this.extraMonsterNum) {
                this.extraMonsterVect.push(_arg_1.readUnsignedInt());
                _local_4++;
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.dup_key);
            XString.WriteChars(_arg_1, this.p2p_key, Constants.LEN_P2PKEY);
        }

        public /*  ©init. */ function _SafeStr_935()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_935 = " PDupEnterReq" (String#16667)


