// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.MoveXYArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_104;

    public class MoveXYArg extends PropertyArg 
    {

        public var speedX:int;
        public var speedY:int;
        public var gapFrame:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.gapFrame = int(_arg_1.@gapFrame);
            this.speedX = int(_arg_1.@speedX);
            this.speedY = int(_arg_1.@speedY);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@speedX = this.speedX;
            _local_1.@speedY = this.speedY;
            _local_1.@gapFrame = this.gapFrame;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_104()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_104 = " MoveXYArg" (String#15857)


