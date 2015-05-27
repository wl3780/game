// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.ColorStyle

package com.tencent.ai.core.render
{
    import flash.geom.ColorTransform;
    import  ©init._SafeStr_1108;

    public class ColorStyle 
    {

        public static var DEFAULT:ColorStyle = new (ColorStyle)();

        public var priority:int;
        public var colorTF:ColorTransform;
        protected var cls:Class;

        public function ColorStyle(_arg_1:int=0, _arg_2:Number=1, _arg_3:Number=1, _arg_4:Number=1, _arg_5:Number=1, _arg_6:Number=0, _arg_7:Number=0, _arg_8:Number=0, _arg_9:Number=0, _arg_10:Class=null)
        {
            this.priority = _arg_1;
            this.cls = _arg_10;
            if (_arg_10 == null){
                _arg_10 = ColorTransform;
            };
            this.colorTF = (new (_arg_10)(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9) as ColorTransform);
        }

        public function clone():ColorStyle
        {
            return (new ColorStyle(this.priority, this.colorTF.redMultiplier, this.colorTF.greenMultiplier, this.colorTF.blueMultiplier, this.colorTF.alphaMultiplier, this.colorTF.redOffset, this.colorTF.greenOffset, this.colorTF.blueOffset, this.colorTF.alphaOffset, this.cls));
        }

        public function toString():String
        {
            return ((((((((("[" + this.colorTF.redMultiplier) + ",") + this.colorTF.greenMultiplier) + ",") + this.colorTF.blueMultiplier) + ",") + this.colorTF.alphaMultiplier) + "]"));
        }

        public /*  ©init. */ function _SafeStr_1108()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1108 = " ColorStyle" (String#14327)


