// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.AcceptMissionArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_109;

    public class AcceptMissionArg extends ScriptArg 
    {

        public var mid:int = 0;
        public var pid:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.mid = int(_arg_1.@mid);
            this.pid = int(_arg_1.@pid);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@mid = this.mid;
            _local_1.@pid = this.pid;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:AcceptMissionArg = (super.clone() as AcceptMissionArg);
            _local_1.mid = this.mid;
            _local_1.pid = this.pid;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_109()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_109 = " AcceptMissionArg" (String#17438)


