// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.TimeChaseScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_171;

    public class TimeChaseScriptArg extends ScriptArg 
    {

        public var moveTime:int = 150;
        public var attackX:int = 100;
        public var attackZ:int = 80;
        public var actionID:int = 100;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.moveTime = int(_arg_1.@moveTimes);
            this.attackX = int(_arg_1.@ax);
            this.attackZ = int(_arg_1.@az);
            this.actionID = int(_arg_1.@actionID);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@moveTimes = this.moveTime;
            _local_1.@ax = this.attackX;
            _local_1.@az = this.attackZ;
            _local_1.@actionID = this.actionID;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:TimeChaseScriptArg = (super.clone() as TimeChaseScriptArg);
            _local_1.moveTime = this.moveTime;
            _local_1.attackX = this.attackX;
            _local_1.attackZ = this.attackZ;
            _local_1.actionID = this.actionID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_171()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_171 = " TimeChaseScriptArg" (String#16388)


