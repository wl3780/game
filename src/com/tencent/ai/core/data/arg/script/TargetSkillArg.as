// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.TargetSkillArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_169;

    public class TargetSkillArg extends ScriptArg 
    {

        public var opType:int;
        public var data:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.opType = int(_arg_1.@opType);
            this.data = int(_arg_1.@data);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@opType = this.opType;
            _local_1.@data = this.data;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:TargetSkillArg = (super.clone() as TargetSkillArg);
            _local_1.opType = this.opType;
            _local_1.data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_169()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_169 = " TargetSkillArg" (String#14474)


