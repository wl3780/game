// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PlayerMissMask

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_910;
    import __AS3__.vec.*;

    public class P_PlayerMissMask implements ISerialize 
    {

        public var last_update_day:uint;
        public var last_main_miss:uint;
        public var main_data_mask:Vector.<uint>;
        public var branch_data_mask:Vector.<uint>;
        public var week_data_mask:Vector.<uint>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.last_update_day = _arg_1.readUnsignedInt();
            this.main_data_mask = new Vector.<uint>();
            _local_3 = 64;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.main_data_mask.push(_arg_1.readUnsignedInt());
                _local_2++;
            };
            this.branch_data_mask = new Vector.<uint>();
            _local_3 = 64;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.branch_data_mask.push(_arg_1.readUnsignedInt());
                _local_2++;
            };
            this.week_data_mask = new Vector.<uint>();
            _local_3 = 32;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.week_data_mask.push(_arg_1.readUnsignedInt());
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_910()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_910 = " P_PlayerMissMask" (String#17729)


