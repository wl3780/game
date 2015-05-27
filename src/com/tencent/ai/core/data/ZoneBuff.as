// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ZoneBuff

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_358;

    public class ZoneBuff 
    {

        public var endTime:uint;
        public var buffType:uint;
        public var data1:int;
        public var data2:int;
        public var staticInfo:SSTypeInfo;
        public var buffInfo:SpecialStatusInfo;

        public function ZoneBuff(_arg_1:uint=0, _arg_2:uint=0, _arg_3:SpecialStatusInfo=null)
        {
            this.buffType = _arg_1;
            this.endTime = _arg_2;
            this.buffInfo = _arg_3;
        }

        public function get currDuration():int
        {
            return (((this.endTime - AICore.data.runtime.currentTime) * 10));
        }

        public /*  ©init. */ function _SafeStr_358()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_358 = " ZoneBuff" (String#14960)


