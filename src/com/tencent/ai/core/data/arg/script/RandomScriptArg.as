// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.RandomScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_144;

    public class RandomScriptArg extends ScriptArg 
    {

        public var value:Number = 0.5;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.value = Number(_arg_1.@value);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@value = this.value;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:RandomScriptArg = (super.clone() as RandomScriptArg);
            _local_1.value = this.value;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_144()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_144 = " RandomScriptArg" (String#17768)


