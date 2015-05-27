// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ShakeScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_155;

    public class ShakeScriptArg extends ScriptArg 
    {

        public var shakeDir:int;
        public var shakeR:int;
        public var shakeTimes:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.shakeDir = int(_arg_1.@dir);
            this.shakeTimes = int(_arg_1.@times);
            this.shakeR = int(_arg_1.@r);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@dir = this.shakeDir;
            _local_1.@times = this.shakeTimes;
            _local_1.@r = this.shakeR;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ShakeScriptArg = (super.clone() as ShakeScriptArg);
            _local_1.shakeDir = this.shakeDir;
            _local_1.shakeTimes = this.shakeTimes;
            _local_1.shakeR = this.shakeR;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_155()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_155 = " ShakeScriptArg" (String#15740)


