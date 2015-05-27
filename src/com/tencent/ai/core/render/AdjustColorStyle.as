// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.AdjustColorStyle

package com.tencent.ai.core.render
{
    import flash.filters.ColorMatrixFilter;
    import fl.motion.AdjustColor;
    import  ©init._SafeStr_1101;

    public class AdjustColorStyle 
    {

        public var priority:int;
        public var filter:ColorMatrixFilter;
        private var _adjustColor:AdjustColor;

        public function AdjustColorStyle(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number)
        {
            this.priority = _arg_1;
            this._adjustColor = new AdjustColor();
            this._adjustColor.brightness = _arg_2;
            this._adjustColor.contrast = _arg_3;
            this._adjustColor.saturation = _arg_4;
            this._adjustColor.hue = _arg_5;
            this.filter = new ColorMatrixFilter();
            this.filter.matrix = this._adjustColor.CalculateFinalFlatArray();
        }

        public /*  ©init. */ function _SafeStr_1101()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1101 = " AdjustColorStyle" (String#15893)


