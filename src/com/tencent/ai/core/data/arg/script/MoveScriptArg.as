// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.MoveScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_135;

    public class MoveScriptArg extends ScriptArg 
    {

        public var stop:Boolean = false;
        public var stopDir:int = -1;
        public var fRate:Number = 1;
        public var gRate:Number = 1;
        public var dirValue:int = 1;
        public var walkV:Boolean = false;
        public var useLastestVX:Boolean = false;
        public var useCurrentVX:Boolean = false;
        public var useCurrentVY:Boolean = false;
        public var igT:Boolean = false;
        public var rate:Number = 1;
        public var vx:int = 0;
        public var vz:int = 0;
        public var vy:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.stop = (int(_arg_1.@stop) == 1);
            this.stopDir = int(_arg_1.@stopDir);
            this.fRate = Number(_arg_1.@fRate);
            this.gRate = Number(_arg_1.@gRate);
            this.dirValue = int(_arg_1.@dirValue);
            this.walkV = (int(_arg_1.@walkV) == 1);
            this.useLastestVX = (int(_arg_1.@useLastestVX) == 1);
            this.useCurrentVX = (int(_arg_1.@useCurrentVX) == 1);
            this.useCurrentVY = (int(_arg_1.@useCurrentVY) == 1);
            this.igT = (int(_arg_1.@igT) == 1);
            this.rate = Number(_arg_1.@rate);
            this.vx = int(_arg_1.@x);
            this.vz = int(_arg_1.@z);
            this.vy = int(_arg_1.@y);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@stop = ((this.stop) ? 1 : 0);
            _local_1.@stopDir = this.stopDir;
            _local_1.@fRate = this.fRate;
            _local_1.@gRate = this.gRate;
            _local_1.@dirValue = this.dirValue;
            _local_1.@walkV = ((this.walkV) ? 1 : 0);
            _local_1.@useLastestVX = ((this.useLastestVX) ? 1 : (0));
            _local_1.@useCurrentVX = ((this.useCurrentVX) ? 1 : 0);
            _local_1.@useCurrentVY = ((this.useCurrentVY) ? 1 : 0);
            _local_1.@igT = ((this.igT) ? 1 : 0);
            _local_1.@rate = this.rate;
            _local_1.@x = this.vx;
            _local_1.@z = this.vz;
            _local_1.@y = this.vy;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:MoveScriptArg = (super.clone() as MoveScriptArg);
            _local_1.stop = this.stop;
            _local_1.stopDir = this.stopDir;
            _local_1.fRate = this.fRate;
            _local_1.gRate = this.gRate;
            _local_1.dirValue = this.dirValue;
            _local_1.walkV = this.walkV;
            _local_1.useLastestVX = this.useLastestVX;
            _local_1.useCurrentVX = this.useCurrentVX;
            _local_1.useCurrentVY = this.useCurrentVY;
            _local_1.igT = this.igT;
            _local_1.rate = this.rate;
            _local_1.vx = this.vx;
            _local_1.vz = this.vz;
            _local_1.vy = this.vy;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_135()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_135 = " MoveScriptArg" (String#16301)


