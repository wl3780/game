// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.TargetAOEScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_167;

    public class TargetAOEScriptArg extends SearchElementScriptArg 
    {

        public static const AOET_EFFECT:int = 0;
        public static const AOET_INTERACT:int = 1;
        public static const AOET_SF:int = 2;
        public static const AOET_SS:int = 3;
        public static const AOET_REMOVE_SS:int = 4;

        public var type:int = 0;
        public var id:int = 0;
        public var bind:Boolean = false;
        public var limitCount:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.type = int(_arg_1.@type);
            this.id = int(_arg_1.@id);
            this.bind = !((int(_arg_1.@bind) == 0));
            this.limitCount = int(_arg_1.@lcount);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@type = this.type;
            _local_1.@id = this.id;
            _local_1.@bind = ((this.bind) ? 1 : 0);
            _local_1.@lcount = this.limitCount;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:TargetAOEScriptArg = (super.clone() as TargetAOEScriptArg);
            _local_1.type = this.type;
            _local_1.id = this.id;
            _local_1.bind = this.bind;
            _local_1.limitCount = this.limitCount;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_167()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_167 = " TargetAOEScriptArg" (String#15989)


