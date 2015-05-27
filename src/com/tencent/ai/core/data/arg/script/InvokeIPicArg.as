// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.InvokeIPicArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_132;

    public class InvokeIPicArg extends ScriptArg 
    {

        public static const MODE_NORMAL:int = 0;
        public static const MODE_SKILL_0:int = 100;

        public var mode:int = 0;
        public var effectID:int = 0;
        public var motionID:int = 0;
        public var frameIndex:int = 0;
        public var time:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.effectID = int(_arg_1.@effectID);
            this.motionID = int(_arg_1.@motionID);
            this.frameIndex = int(_arg_1.@frameIndex);
            this.time = int(_arg_1.@time);
            this.mode = int(_arg_1.@mode);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@effectID = this.effectID;
            _local_1.@motionID = this.motionID;
            _local_1.@frameIndex = this.frameIndex;
            _local_1.@time = this.time;
            _local_1.@mode = this.mode;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:InvokeIPicArg = (super.clone() as InvokeIPicArg);
            _local_1.effectID = this.effectID;
            _local_1.motionID = this.motionID;
            _local_1.frameIndex = this.frameIndex;
            _local_1.time = this.time;
            _local_1.mode = this.mode;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_132()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_132 = " InvokeIPicArg" (String#17567)


