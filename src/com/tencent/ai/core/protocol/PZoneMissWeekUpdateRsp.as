// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneMissWeekUpdateRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_WeekMissOnBoard;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1078;
    import __AS3__.vec.*;

    public class PZoneMissWeekUpdateRsp implements ISerialize 
    {

        public static const IN_CMD:int = 524568;
        public static const OUT_CMD:int = 524567;

        public var week_miss_on_board:Vector.<P_WeekMissOnBoard>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_WeekMissOnBoard;
            this.week_miss_on_board = new Vector.<P_WeekMissOnBoard>();
            _local_3 = 20;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_WeekMissOnBoard();
                _local_4.read(_arg_1);
                this.week_miss_on_board.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1078()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1078 = " PZoneMissWeekUpdateRsp" (String#15320)


