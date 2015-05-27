// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.compare.UintRecord

package com.tencent.ai.core.utils.binary.compare
{
    import  ©init._SafeStr_1365;

    public class UintRecord implements IRecord 
    {

        public var name:String;
        public var max:uint = 0;
        public var min:uint = 0xFFFFFFFF;


        public function statistics(_arg_1:Object):void
        {
            var _local_2:uint = (_arg_1 as uint);
            if (_local_2 > this.max){
                this.max = _local_2;
            };
            if (_local_2 < this.min){
                this.min = _local_2;
            };
        }

        public function dump(_arg_1:XML):void
        {
            _arg_1.@max = this.max;
            _arg_1.@min = this.min;
            var _local_2:uint = (this.max - this.min);
            _arg_1.@length = _local_2;
            _arg_1.@recommand = (((_local_2 <= 0xFF)) ? "unsigned byte" : (((_local_2 <= 0xFFFF)) ? "unsigned short" : "unsigned int"));
        }

        public /*  ©init. */ function _SafeStr_1365()
        {
        }


    }
}//package com.tencent.ai.core.utils.binary.compare

// _SafeStr_1365 = " UintRecord" (String#15314)


