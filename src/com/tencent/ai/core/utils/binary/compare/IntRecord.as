// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.compare.IntRecord

package com.tencent.ai.core.utils.binary.compare
{
    import  ©init._SafeStr_1362;

    public class IntRecord implements IRecord 
    {

        public var name:String;
        public var max:int = -2147483648;
        public var min:int = 2147483647;


        public function statistics(_arg_1:Object):void
        {
            var _local_2:int = (_arg_1 as int);
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
            var _local_2:int = (this.max - this.min);
            _arg_1.@length = _local_2;
            if (this.min >= 0){
                _arg_1.@recommand = (((_local_2 <= 0xFF)) ? "unsigned byte" : (((_local_2 <= 0xFFFF)) ? "unsigned short" : ("unsigned int")));
            } else {
                _arg_1.@recommand = (((((this.max <= 143)) && ((-(this.min) <= 143)))) ? "byte" : (((((this.max <= 36863)) && ((-(this.min) <= 36863)))) ? "short" : "int"));
            };
        }

        public /*  ©init. */ function _SafeStr_1362()
        {
        }


    }
}//package com.tencent.ai.core.utils.binary.compare

// _SafeStr_1362 = " IntRecord" (String#15089)


