// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.compare.NumberRecord

package com.tencent.ai.core.utils.binary.compare
{
    import  ©init._SafeStr_1363;

    public class NumberRecord implements IRecord 
    {

        public var name:String;
        public var max:Number = 4.94065645841247E-324;
        public var min:Number = 1.79769313486232E308;


        public function statistics(_arg_1:Object):void
        {
            var _local_2:Number = (_arg_1 as Number);
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
        }

        public /*  ©init. */ function _SafeStr_1363()
        {
        }


    }
}//package com.tencent.ai.core.utils.binary.compare

// _SafeStr_1363 = " NumberRecord" (String#17807)


