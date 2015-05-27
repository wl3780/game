// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.TqosScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_172;

    public class TqosScriptArg extends ScriptArg 
    {

        public var intArr:String;
        public var strArr:String;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.intArr = String(_arg_1.@intArr);
            this.strArr = String(_arg_1.@strArr);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@intArr = this.intArr;
            _local_1.@strArr = this.strArr;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:TqosScriptArg = (super.clone() as TqosScriptArg);
            _local_1.intArr = this.intArr;
            _local_1.strArr = this.strArr;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_172()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_172 = " TqosScriptArg" (String#15233)


