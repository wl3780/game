// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_DupFilterStat

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_883;

    public class P_DupFilterStat implements ISerialize 
    {

        public var dup_id:uint;
        public var filter_stat:uint;
        public var dup_status:uint;
        public var top_rank:uint;
        public var show_fire:uint;
        public var top_combo_rate:uint;
        public var minimum_ac_time:uint;
        public var minimum_hurt_count:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.dup_id = _arg_1.readUnsignedInt();
            this.filter_stat = _arg_1.readUnsignedInt();
            this.dup_status = _arg_1.readUnsignedByte();
            this.top_rank = _arg_1.readUnsignedByte();
            this.show_fire = _arg_1.readUnsignedByte();
            this.top_combo_rate = _arg_1.readUnsignedByte();
            this.minimum_ac_time = _arg_1.readUnsignedShort();
            this.minimum_hurt_count = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function toString():String
        {
            return ((((("{" + this.dup_id) + ",") + this.filter_stat) + "}"));
        }

        public /*  ©init. */ function _SafeStr_883()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_883 = " P_DupFilterStat" (String#16712)


