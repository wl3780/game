// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.FlashAlphaArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_98;

    public class FlashAlphaArg extends PropertyArg 
    {

        public var start:Number = 0;
        public var end:Number = 1;
        public var step:Number = 0.02;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.start = Number(_arg_1.@start);
            this.end = Number(_arg_1.@end);
            this.step = Number(_arg_1.@step);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@start = this.start;
            _local_1.@end = this.end;
            _local_1.@step = this.step;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:FlashAlphaArg = new FlashAlphaArg();
            _local_1.start = this.start;
            _local_1.end = this.end;
            _local_1.step = this.step;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_98()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_98 = " FlashAlphaArg" (String#14585)


