// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.AdjustColorFilterArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_97;

    public class AdjustColorFilterArg extends PropertyArg 
    {

        public var brightness:Number;
        public var contrast:Number;
        public var saturation:Number;
        public var hue:Number;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.brightness = _arg_1.@brightness;
            this.contrast = _arg_1.@contrast;
            this.saturation = _arg_1.@saturation;
            this.hue = _arg_1.@hue;
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@brightness = this.brightness;
            _local_1.@contrast = this.contrast;
            _local_1.@saturation = this.saturation;
            _local_1.@hue = this.hue;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:AdjustColorFilterArg = new AdjustColorFilterArg();
            _local_1.brightness = this.brightness;
            _local_1.contrast = this.contrast;
            _local_1.saturation = this.saturation;
            _local_1.hue = this.hue;
            _local_1.type = this.type;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_97()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_97 = " AdjustColorFilterArg" (String#13814)


