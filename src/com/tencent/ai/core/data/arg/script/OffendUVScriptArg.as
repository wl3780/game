// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.OffendUVScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_137;

    public class OffendUVScriptArg extends ScriptArg 
    {

        public var targetGroup:int = 0;
        public var searchX:int = 200;
        public var searchZ:int = 100;
        public var speed:int = 100;
        public var canThrough:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.targetGroup = int(_arg_1.@targetGroup);
            this.searchX = int(_arg_1.@x);
            this.searchZ = int(_arg_1.@z);
            this.speed = int(_arg_1.@speed);
            this.canThrough = int(_arg_1.@canThrough);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@targetGroup = this.targetGroup;
            _local_1.@x = this.searchX;
            _local_1.@z = this.searchZ;
            _local_1.@speed = this.speed;
            _local_1.@canThrough = this.canThrough;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:OffendUVScriptArg = (super.clone() as OffendUVScriptArg);
            _local_1.targetGroup = this.targetGroup;
            _local_1.searchX = this.searchX;
            _local_1.searchZ = this.searchZ;
            _local_1.speed = this.speed;
            _local_1.canThrough = this.canThrough;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_137()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_137 = " OffendUVScriptArg" (String#17447)


