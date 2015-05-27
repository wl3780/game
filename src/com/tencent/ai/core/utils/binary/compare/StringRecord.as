// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.compare.StringRecord

package com.tencent.ai.core.utils.binary.compare
{
    import  ©init._SafeStr_1364;

    public class StringRecord implements IRecord 
    {

        public var name:String;
        public var max:uint = 0;
        public var min:uint = 0xFFFFFFFF;


        public function statistics(_arg_1:Object):void
        {
            if (_arg_1 === null){
                return;
            };
            var _local_2:String = (_arg_1 as String);
            if (_local_2.length > this.max){
                this.max = _local_2.length;
            };
            if (_local_2.length < this.min){
                this.min = _local_2.length;
            };
        }

        public function dump(_arg_1:XML):void
        {
            _arg_1.@maxLength = this.max;
            _arg_1.@minLength = this.min;
        }

        public /*  ©init. */ function _SafeStr_1364()
        {
        }


    }
}//package com.tencent.ai.core.utils.binary.compare

// _SafeStr_1364 = " StringRecord" (String#14162)


