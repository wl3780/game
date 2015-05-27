// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.SnowArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_107;

    public class SnowArg extends PropertyArg 
    {

        public var num:int;
        public var maxSpeedVX:int;
        public var maxSpeedVZ:int;
        public var minScale:Number;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.num = int(_arg_1.@num);
            this.maxSpeedVZ = int(_arg_1.@maxSpeedVZ);
            this.maxSpeedVX = int(_arg_1.@maxSpeedVX);
            this.minScale = Number(_arg_1.@minScale);
        }

        override public function clone():PropertyArg
        {
            var _local_1:SnowArg = new SnowArg();
            _local_1.type = this.type;
            _local_1.num = this.num;
            _local_1.maxSpeedVZ = this.maxSpeedVZ;
            _local_1.maxSpeedVX = this.maxSpeedVX;
            _local_1.minScale = this.minScale;
            return (_local_1);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@num = this.num;
            _local_1.@maxSpeedVZ = this.maxSpeedVZ;
            _local_1.@maxSpeedVX = this.maxSpeedVX;
            _local_1.@minScale = this.minScale;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_107()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_107 = " SnowArg" (String#14705)


