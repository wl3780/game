// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.MaskArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import flash.display.BlendMode;
    import  ©init._SafeStr_100;

    public class MaskArg extends PropertyArg 
    {

        public var colors:Array;
        public var alphas:Array;
        public var ratios:Array;
        public var width:int;
        public var height:int;
        public var blendMode:String = "add";


        override public function decode(_arg_1:XML):void
        {
            this.blendMode = ((_arg_1.hasOwnProperty("@blendMode")) ? String(_arg_1.@blendMode) : BlendMode.ADD);
            this.type = String(_arg_1.@type);
            this.width = int(_arg_1.@width);
            this.height = int(_arg_1.@height);
            this.colors = [];
            this.alphas = [];
            this.ratios = [];
            var _local_2:Array = String(_arg_1.@colors).split(",");
            while (_local_2.length) {
                this.colors.push(parseInt(("0x" + _local_2.shift()), 16));
            };
            var _local_3:Array = String(_arg_1.@alphas).split(",");
            while (_local_3.length) {
                this.alphas.push(Number(_local_3.shift()));
            };
            var _local_4:Array = String(_arg_1.@ratios).split(",");
            while (_local_4.length) {
                this.ratios.push(int(_local_4.shift()));
            };
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@width = this.width;
            _local_1.@height = this.height;
            _local_1.@blendMode = this.blendMode;
            _local_1.@colors = this.colors.join(",");
            _local_1.@alphas = this.alphas.join(",");
            _local_1.@ratios = this.ratios.join(",");
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:MaskArg = new MaskArg();
            _local_1.type = this.type;
            _local_1.colors = this.colors.concat();
            _local_1.alphas = this.alphas.concat();
            _local_1.ratios = this.ratios.concat();
            _local_1.width = this.width;
            _local_1.height = this.height;
            _local_1.blendMode = this.blendMode;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_100()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_100 = " MaskArg" (String#15884)


