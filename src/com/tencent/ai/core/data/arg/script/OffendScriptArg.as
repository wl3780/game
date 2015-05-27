// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.OffendScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_136;

    public class OffendScriptArg extends ScriptArg 
    {

        public var targetGroup:int = 0;
        public var searchX:int = 200;
        public var searchZ:int = 100;
        public var moveTime:int = 80;
        public var speedMax:int = 100;
        public var canThrough:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.targetGroup = int(_arg_1.@targetGroup);
            this.searchX = int(_arg_1.@x);
            this.searchZ = int(_arg_1.@z);
            this.moveTime = int(_arg_1.@moveTimes);
            this.speedMax = int(_arg_1.@speedMax);
            this.canThrough = int(_arg_1.@canThrough);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@targetGroup = this.targetGroup;
            _local_1.@x = this.searchX;
            _local_1.@z = this.searchZ;
            _local_1.@moveTimes = this.moveTime;
            _local_1.@speedMax = this.speedMax;
            _local_1.@canThrough = this.canThrough;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:OffendScriptArg = (super.clone() as OffendScriptArg);
            _local_1.targetGroup = this.targetGroup;
            _local_1.searchX = this.searchX;
            _local_1.searchZ = this.searchZ;
            _local_1.moveTime = this.moveTime;
            _local_1.speedMax = this.speedMax;
            _local_1.canThrough = this.canThrough;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_136()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_136 = " OffendScriptArg" (String#14711)


