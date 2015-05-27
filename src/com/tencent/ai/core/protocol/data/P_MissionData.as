// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_MissionData

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_896;
    import __AS3__.vec.*;

    public class P_MissionData implements ISerialize 
    {

        public var miss_id:uint;
        public var phase_id:uint;
        public var accept_day:uint;
        public var rank:uint;
        public var state:uint;
        public var miss_cdtn:Vector.<P_MissCdtnData>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_MissCdtnData;
            this.miss_id = _arg_1.readUnsignedInt();
            this.phase_id = _arg_1.readUnsignedInt();
            this.accept_day = _arg_1.readUnsignedShort();
            this.state = _arg_1.readUnsignedShort();
            this.rank = ((this.state & 0xFF00) >> 8);
            this.state = (this.state & 0xFF);
            _local_3 = _arg_1.readUnsignedShort();
            this.miss_cdtn = new Vector.<P_MissCdtnData>();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_MissCdtnData();
                _local_4.read(_arg_1);
                this.miss_cdtn.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_896()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_896 = " P_MissionData" (String#15428)


