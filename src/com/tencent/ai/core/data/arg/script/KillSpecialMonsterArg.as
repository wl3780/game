// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.KillSpecialMonsterArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_133;

    public class KillSpecialMonsterArg extends ScriptArg 
    {

        public var groupID:int;
        public var killType:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.groupID = int(_arg_1.@argStr);
            this.killType = int(_arg_1.@killType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@argStr = this.groupID;
            _local_1.@killType = this.killType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:KillSpecialMonsterArg = (super.clone() as KillSpecialMonsterArg);
            _local_1.groupID = this.groupID;
            _local_1.killType = this.killType;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_133()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_133 = " KillSpecialMonsterArg" (String#15224)


