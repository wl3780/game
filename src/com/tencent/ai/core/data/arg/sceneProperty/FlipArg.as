// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.FlipArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_99;

    public class FlipArg extends PropertyArg 
    {

        public var value:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.value = int(_arg_1.@value);
        }

        override public function clone():PropertyArg
        {
            var _local_1:FlipArg = new FlipArg();
            _local_1.type = this.type;
            _local_1.value = this.value;
            return (_local_1);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@value = this.value;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_99()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_99 = " FlipArg" (String#16964)


