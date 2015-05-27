// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.BorderStyle

package com.tencent.ai.core.render
{
    import flash.filters.GlowFilter;
    import  ©init._SafeStr_1106;

    public class BorderStyle 
    {

        public var priority:int;
        public var filter:GlowFilter;

        public function BorderStyle(_arg_1:int=0, _arg_2:uint=0xFF6600, _arg_3:int=6, _arg_4:int=6)
        {
            this.filter = new GlowFilter();
            this.filter.color = _arg_2;
            this.filter.strength = _arg_3;
            this.filter.blurX = _arg_4;
            this.filter.blurY = _arg_4;
            this.priority = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_1106()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1106 = " BorderStyle" (String#16976)


