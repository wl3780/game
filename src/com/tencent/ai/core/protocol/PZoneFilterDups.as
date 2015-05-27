// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneFilterDups

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_DupFilterStat;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1071;
    import __AS3__.vec.*;

    public class PZoneFilterDups implements ISerialize 
    {

        public static const IN_CMD:int = 524420;
        public static const OUT_CMD:int = 524419;

        public var dup_stat_list:Vector.<P_DupFilterStat>;
        public var dup_id_list:Vector.<uint>;
        public var cur_cpv:uint;
        public var max_cpv:uint;
        public var remain_count:uint;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_DupFilterStat;
            this.dup_stat_list = new Vector.<P_DupFilterStat>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_DupFilterStat();
                _local_4.read(_arg_1);
                this.dup_stat_list.push(_local_4);
                _local_2++;
            };
            this.cur_cpv = _arg_1.readUnsignedInt();
            this.max_cpv = _arg_1.readUnsignedInt();
            this.remain_count = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _local_3 = this.dup_id_list.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _arg_1.writeUnsignedInt(this.dup_id_list[_local_2]);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_1071()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1071 = " PZoneFilterDups" (String#14306)


