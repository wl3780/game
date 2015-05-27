// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.RemoveNpcScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_146;

    public class RemoveNpcScriptArg extends ScriptArg 
    {

        public var npcID:int;


        override public function clone():ScriptArg
        {
            var _local_1:RemoveNpcScriptArg = (super.clone() as RemoveNpcScriptArg);
            _local_1.npcID = this.npcID;
            return (_local_1);
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.npcID = int(_arg_1.@npcID);
        }

        override public function encode()
        {
            var _local_1:XML = (super.encode() as XML);
            _local_1.@npcID = this.npcID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_146()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_146 = " RemoveNpcScriptArg" (String#14804)


