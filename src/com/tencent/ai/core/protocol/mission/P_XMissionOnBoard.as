// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mission.P_XMissionOnBoard

package com.tencent.ai.core.protocol.mission
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_965;
    import __AS3__.vec.*;

    public class P_XMissionOnBoard implements ISerialize 
    {

        public var miss_on_board:Vector.<P_XMissionBoardData>;
        public var fresh_time:uint;
        public var fresh_count:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.miss_on_board = new Vector.<P_XMissionBoardData>();
            var _local_2:int;
            while (_local_2 < 5) {
                this.miss_on_board[_local_2] = new P_XMissionBoardData();
                this.miss_on_board[_local_2].read(_arg_1);
                _local_2++;
            };
            this.fresh_time = _arg_1.readUnsignedInt();
            this.fresh_count = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_965()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mission

// _SafeStr_965 = " P_XMissionOnBoard" (String#17018)


