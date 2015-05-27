// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPvpMatch

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_PvpPlayerInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1018;
    import __AS3__.vec.*;

    public class PPvpMatch implements ISerialize 
    {

        public static const REQ:int = 526081;
        public static const RSP:int = 526082;
        public static const MODE_1v1:int = 1;
        public static const MODE_NvN:int = 2;
        public static const MODE_Team:int = 3;
        public static const MODE_Null:int = 4;
        public static const TYPE_ENTER:int = 0;
        public static const TYPE_QUIT:int = 1;
        public static const MATCH_STATUS_SUCCESS:int = 0;
        public static const MATCH_STATUS_MATCHING:int = 80217;
        public static const MATCH_STATUS_FAIL:int = 80202;

        public var type:uint;
        public var mode:uint;
        public var result:int;
        public var numPlayer:int;
        public var playerList:Vector.<P_PvpPlayerInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:P_PvpPlayerInfo;
            var _local_3:int;
            this.result = _arg_1.readInt();
            this.numPlayer = _arg_1.readUnsignedShort();
            this.playerList = new Vector.<P_PvpPlayerInfo>();
            _local_3 = 0;
            while (_local_3 < this.numPlayer) {
                _local_2 = new P_PvpPlayerInfo();
                _local_2.read(_arg_1);
                this.playerList.push(_local_2);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.type);
            _arg_1.writeByte(this.mode);
        }

        public /*  ©init. */ function _SafeStr_1018()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1018 = " PPvpMatch" (String#16418)


