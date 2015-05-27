// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AdjustColorInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import fl.motion.AdjustColor;
    import flash.filters.ColorMatrixFilter;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_208;

    public class AdjustColorInfo implements IXMLSerialize, ISerialize 
    {

        public var brightness:Number;
        public var contrast:Number;
        public var hue:Number;
        public var saturation:Number;

        public function AdjustColorInfo()
        {
            this.brightness = 0;
            this.contrast = 0;
            this.hue = 0;
            this.saturation = 0;
        }

        public function decode(_arg_1:XML):void
        {
            if (_arg_1 == null){
                return;
            };
            this.brightness = Number(_arg_1.@brightness);
            this.contrast = Number(_arg_1.@contrast);
            this.hue = Number(_arg_1.@hue);
            this.saturation = Number(_arg_1.@saturation);
        }

        public function encode()
        {
            var _local_1:XML = <AdjustColor/>
            ;
            _local_1.@brightness = this.brightness;
            _local_1.@contrast = this.contrast;
            _local_1.@hue = this.hue;
            _local_1.@saturation = this.saturation;
            return (_local_1);
        }

        public function toColorMatrixFilter():ColorMatrixFilter
        {
            var _local_1:AdjustColor = new AdjustColor();
            _local_1.brightness = this.brightness;
            _local_1.contrast = this.contrast;
            _local_1.hue = this.hue;
            _local_1.saturation = this.saturation;
            var _local_2:ColorMatrixFilter = new ColorMatrixFilter();
            _local_2.matrix = _local_1.CalculateFinalFlatArray();
            return (_local_2);
        }

        public function isEmpty():Boolean
        {
            return ((((((((this.brightness == 0)) && ((this.contrast == 0)))) && ((this.hue == 0)))) && ((this.saturation == 0))));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.brightness = _arg_1.readFloat();
            this.contrast = _arg_1.readFloat();
            this.hue = _arg_1.readFloat();
            this.saturation = _arg_1.readFloat();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeFloat(this.brightness);
            _arg_1.writeFloat(this.contrast);
            _arg_1.writeFloat(this.hue);
            _arg_1.writeFloat(this.saturation);
        }

        public /*  ©init. */ function _SafeStr_208()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_208 = " AdjustColorInfo" (String#16331)


