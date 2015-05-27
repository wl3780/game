// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.MoveActorScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_134;

    public class MoveActorScriptArg extends SearchElementScriptArg 
    {

        public static const MOVE_TYPE_TRANS_CHAIN:int = 0;
        public static const MOVE_TYPE_ADSORB:int = 1;

        public var vx:int = 0;
        public var vz:int = 0;
        public var vy:int = 0;
        public var times:int = 1;
        public var moveType:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.vx = int(_arg_1.@x);
            this.vz = int(_arg_1.@z);
            this.vy = int(_arg_1.@y);
            this.times = int(_arg_1.@times);
            this.moveType = int(_arg_1.@moveType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@x = this.vx;
            _local_1.@z = this.vz;
            _local_1.@y = this.vy;
            _local_1.@times = this.times;
            _local_1.@moveType = this.moveType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:MoveActorScriptArg = (super.clone() as MoveActorScriptArg);
            _local_1.vx = this.vx;
            _local_1.vz = this.vz;
            _local_1.vy = this.vy;
            _local_1.times = this.times;
            _local_1.moveType = this.moveType;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_134()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_134 = " MoveActorScriptArg" (String#15929)


