// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ChangeTargetArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_122;

    public class ChangeTargetArg extends ScriptArg 
    {

        public var release:Boolean = false;
        public var self:Boolean = false;
        public var frameIndex:int = 0;
        public var rotation:int = 0;
        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;
        public var dirValue:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.release = !((int(_arg_1.@release) == 0));
            this.self = !((int(_arg_1.@self) == 0));
            this.frameIndex = int(_arg_1.@frameIndex);
            this.offsetX = int(_arg_1.@x);
            this.offsetY = int(_arg_1.@y);
            this.offsetZ = int(_arg_1.@z);
            this.rotation = int(_arg_1.@rotation);
            this.dirValue = int(_arg_1.@dirValue);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@release = ((this.release) ? 1 : 0);
            _local_1.@self = ((this.self) ? 1 : 0);
            _local_1.@frameIndex = this.frameIndex;
            _local_1.@x = this.offsetX;
            _local_1.@y = this.offsetY;
            _local_1.@z = this.offsetZ;
            _local_1.@rotation = this.rotation;
            _local_1.@dirValue = this.dirValue;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ChangeTargetArg = (super.clone() as ChangeTargetArg);
            _local_1.release = this.release;
            _local_1.self = this.self;
            _local_1.frameIndex = this.frameIndex;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetY = this.offsetY;
            _local_1.offsetZ = this.offsetZ;
            _local_1.rotation = this.rotation;
            _local_1.dirValue = this.dirValue;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_122()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_122 = " ChangeTargetArg" (String#14462)


