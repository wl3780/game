// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.TingeArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_108;

    public class TingeArg extends PropertyArg 
    {

        public var alphaOffset:Number;
        public var alphaMultiplier:Number;
        public var redOffset:Number;
        public var redMultiplier:Number;
        public var greenOffset:Number;
        public var greenMultiplier:Number;
        public var blueOffset:Number;
        public var blueMultiplier:Number;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.alphaOffset = Number(_arg_1.@a_o);
            this.alphaMultiplier = Number(_arg_1.@a_m);
            this.redOffset = Number(_arg_1.@r_o);
            this.redMultiplier = Number(_arg_1.@r_m);
            this.greenOffset = Number(_arg_1.@g_o);
            this.greenMultiplier = Number(_arg_1.@g_m);
            this.blueOffset = Number(_arg_1.@b_o);
            this.blueMultiplier = Number(_arg_1.@b_m);
        }

        override public function clone():PropertyArg
        {
            var _local_1:TingeArg = new TingeArg();
            _local_1.alphaMultiplier = this.alphaMultiplier;
            _local_1.alphaOffset = this.alphaOffset;
            _local_1.blueMultiplier = this.blueMultiplier;
            _local_1.blueOffset = this.blueOffset;
            _local_1.greenMultiplier = this.greenMultiplier;
            _local_1.greenOffset = this.greenOffset;
            _local_1.redMultiplier = this.redMultiplier;
            _local_1.redOffset = this.redOffset;
            _local_1.type = this.type;
            return (_local_1);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@a_o = this.alphaOffset;
            _local_1.@a_m = this.alphaMultiplier;
            _local_1.@r_o = this.redOffset;
            _local_1.@r_m = this.redMultiplier;
            _local_1.@g_o = this.greenOffset;
            _local_1.@g_m = this.greenMultiplier;
            _local_1.@b_o = this.blueOffset;
            _local_1.@b_m = this.blueMultiplier;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_108()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_108 = " TingeArg" (String#17798)


