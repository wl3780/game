// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_WeekMissOnBoard

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_927;

    public class P_WeekMissOnBoard implements ISerialize 
    {

        public var miss_id:uint;
        public var fresh_time:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.miss_id = _arg_1.readUnsignedInt();
            this.fresh_time = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_927()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_927 = " P_WeekMissOnBoard" (String#15368)


