// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SkillHurtArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_156;

    public class SkillHurtArg extends ScriptArg 
    {

        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.offsetX = int(_arg_1.@x);
            this.offsetY = int(_arg_1.@y);
            this.offsetZ = int(_arg_1.@z);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@x = this.offsetX;
            _local_1.@y = this.offsetY;
            _local_1.@z = this.offsetZ;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_156()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_156 = " SkillHurtArg" (String#17600)


