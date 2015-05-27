// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PlayerMission

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.mission.P_XMissionOnBoard;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_909;
    import __AS3__.vec.*;

    public class P_PlayerMission implements ISerialize 
    {

        public var version:uint;
        public var main_miss:Vector.<P_MissionData>;
        public var week_miss_on_board:Vector.<P_WeekMissOnBoard>;
        public var week_miss:Vector.<P_MissionData>;
        public var day_miss:Vector.<P_MissionData>;
        public var branch_miss:Vector.<P_MissionData>;
        public var x_miss:Vector.<P_MissionData>;
        public var x_miss_on_board:P_XMissionOnBoard;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_MissionData;
            var _local_5:P_WeekMissOnBoard;
            this.version = _arg_1.readUnsignedShort();
            this.main_miss = new Vector.<P_MissionData>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_MissionData();
                _local_4.read(_arg_1);
                this.main_miss.push(_local_4);
                _local_2++;
            };
            this.week_miss_on_board = new Vector.<P_WeekMissOnBoard>();
            _local_3 = 20;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new P_WeekMissOnBoard();
                _local_5.read(_arg_1);
                this.week_miss_on_board.push(_local_5);
                _local_2++;
            };
            this.week_miss = new Vector.<P_MissionData>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_MissionData();
                _local_4.read(_arg_1);
                this.week_miss.push(_local_4);
                _local_2++;
            };
            this.day_miss = new Vector.<P_MissionData>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_MissionData();
                _local_4.read(_arg_1);
                this.day_miss.push(_local_4);
                _local_2++;
            };
            this.x_miss = new Vector.<P_MissionData>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_MissionData();
                _local_4.read(_arg_1);
                this.x_miss.push(_local_4);
                _local_2++;
            };
            this.x_miss_on_board = new P_XMissionOnBoard();
            this.x_miss_on_board.read(_arg_1);
            this.branch_miss = new Vector.<P_MissionData>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_MissionData();
                _local_4.read(_arg_1);
                this.branch_miss.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_909()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_909 = " P_PlayerMission" (String#15650)


