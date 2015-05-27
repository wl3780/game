// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CBlurScriptArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.render.BlurStyle;
    import flash.filters.BlurFilter;
    import  ©init._SafeStr_118;

    public class CBlurScriptArg extends ScriptArg 
    {

        public var times:int;
        public var style:BlurStyle;

        public function CBlurScriptArg(_arg_1:BlurStyle=null)
        {
            if (_arg_1 == null){
                _arg_1 = new BlurStyle(0, 4, 4, 1);
            };
            this.style = _arg_1;
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.times = int(_arg_1.@times);
            var _local_2:BlurFilter = this.style.filter;
            _local_2.blurX = Number(_arg_1.@blurX);
            _local_2.blurY = Number(_arg_1.@blurY);
            _local_2.quality = int(_arg_1.@quality);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@times = this.times;
            var _local_2:BlurFilter = this.style.filter;
            _local_1.@blurX = _local_2.blurX;
            _local_1.@blurY = _local_2.blurY;
            _local_1.@quality = _local_2.quality;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CBlurScriptArg = (super.clone() as CBlurScriptArg);
            _local_1.times = this.times;
            _local_1.style = this.style.clone();
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_118()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_118 = " CBlurScriptArg" (String#17549)


