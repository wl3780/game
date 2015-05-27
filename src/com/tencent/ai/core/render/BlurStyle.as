// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.BlurStyle

package com.tencent.ai.core.render
{
    import flash.filters.BlurFilter;
    import  ©init._SafeStr_1104;

    public class BlurStyle 
    {

        public var priority:int;
        public var filter:BlurFilter;

        public function BlurStyle(_arg_1:int=0, _arg_2:Number=4, _arg_3:Number=4, _arg_4:int=1)
        {
            this.priority = _arg_1;
            this.filter = new BlurFilter(_arg_2, _arg_3, _arg_4);
        }

        public function clone():BlurStyle
        {
            return (new BlurStyle(this.priority, this.filter.blurX, this.filter.blurY, this.filter.quality));
        }

        public /*  ©init. */ function _SafeStr_1104()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1104 = " BlurStyle" (String#16499)


