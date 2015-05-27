// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.AutoAIActArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_111;

    public class AutoAIActArg extends ScriptArg 
    {

        public static const DELETE_AUTOAI:int = 0;
        public static const MAKE_ACTOR_ACT:int = 1;

        public var id:int;
        public var targetType:int;
        public var targetID:uint;
        public var beginVKey:int;
        public var endVKey:int;
        public var frameTimes:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.id = int(_arg_1.@id);
            this.targetType = int(_arg_1.@targetType);
            this.targetID = uint(_arg_1.@targetID);
            this.beginVKey = int(_arg_1.@beginVKey);
            this.endVKey = int(_arg_1.@endVKey);
            this.frameTimes = int(_arg_1.@frameTimes);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@id = this.id;
            _local_1.@targetType = this.targetType;
            _local_1.@targetID = this.targetID;
            _local_1.@beginVKey = this.beginVKey;
            _local_1.@endVKey = this.endVKey;
            _local_1.@frameTimes = this.frameTimes;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:AutoAIActArg = (super.clone() as AutoAIActArg);
            _local_1.id = this.id;
            _local_1.targetType = this.targetType;
            _local_1.targetID = this.targetID;
            _local_1.beginVKey = this.beginVKey;
            _local_1.endVKey = this.endVKey;
            _local_1.frameTimes = this.frameTimes;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_111()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_111 = " AutoAIActArg" (String#15548)


