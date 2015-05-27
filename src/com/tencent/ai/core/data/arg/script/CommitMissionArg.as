// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CommitMissionArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_124;

    public class CommitMissionArg extends ScriptArg 
    {

        public var cid:int = 0;
        public var aid:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.cid = int(_arg_1.@cid);
            this.aid = int(_arg_1.@aid);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@cid = this.cid;
            _local_1.@aid = this.aid;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CommitMissionArg = (super.clone() as CommitMissionArg);
            _local_1.cid = this.cid;
            _local_1.aid = this.aid;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_124()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_124 = " CommitMissionArg" (String#16496)


