// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.TargetBeRidedArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_168;

    public class TargetBeRidedArg extends ScriptArg 
    {

        public static const RIDE_STATUS_UNKNOW:int = 0;
        public static const RIDE_STATUS_WAITING:int = 1;
        public static const RIDE_STATUS_JUMP_IN:int = 2;
        public static const RIDE_STATUS_JUMP_OUT:int = 3;
        public static const RIDE_STATUS_CLEAR:int = -1;

        public var status:int = 1;
        public var dx:int = 30;
        public var dz:int = 20;
        public var dy:int = 100;
        public var minY:int = 50;
        public var maxVY:int = 0;
        public var aiTimes:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.status = int(_arg_1.@status);
            this.dx = int(_arg_1.@dx);
            this.dz = int(_arg_1.@dz);
            this.dy = int(_arg_1.@dy);
            this.minY = int(_arg_1.@minY);
            this.maxVY = int(_arg_1.@maxVY);
            this.aiTimes = int(_arg_1.@aiTimes);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@status = this.status;
            _local_1.@dx = this.dx;
            _local_1.@dz = this.dz;
            _local_1.@dy = this.dy;
            _local_1.@minY = this.minY;
            _local_1.@maxVY = this.maxVY;
            _local_1.@aiTimes = this.aiTimes;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:TargetBeRidedArg = (super.clone() as TargetBeRidedArg);
            _local_1.status = this.status;
            _local_1.dx = this.dx;
            _local_1.dz = this.dz;
            _local_1.dy = this.dy;
            _local_1.minY = this.minY;
            _local_1.maxVY = this.maxVY;
            _local_1.aiTimes = this.aiTimes;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_168()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_168 = " TargetBeRidedArg" (String#14855)


