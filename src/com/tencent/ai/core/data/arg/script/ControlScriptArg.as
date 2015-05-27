// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ControlScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_125;

    public class ControlScriptArg extends ScriptArg 
    {

        public var release:Boolean = false;
        public var useLastestVX:Boolean = false;
        public var useRun:Boolean = false;
        public var useDirection:Boolean = true;
        public var checkContinue:Boolean = false;
        public var speedRate:Number = 1;
        public var rSpeedRate:Number = 1;
        public var zRate:Number = 1;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.release = (int(_arg_1.@release) == 1);
            this.useLastestVX = (int(_arg_1.@useLastestVX) == 1);
            this.useRun = (int(_arg_1.@useRun) == 1);
            this.useDirection = (int(_arg_1.@useDirection) == 1);
            this.checkContinue = (int(_arg_1.@checkContinue) == 1);
            this.speedRate = Number(_arg_1.@speedRate);
            this.rSpeedRate = Number(_arg_1.@rSpeedRate);
            this.zRate = Number(_arg_1.@zRate);
            this.zRate = (((this.zRate == 0)) ? 1 : this.zRate);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@release = ((this.release) ? 1 : 0);
            _local_1.@useLastestVX = ((this.useLastestVX) ? 1 : 0);
            _local_1.@useRun = ((this.useRun) ? 1 : (0));
            _local_1.@useDirection = ((this.useDirection) ? 1 : 0);
            _local_1.@checkContinue = ((this.checkContinue) ? 1 : 0);
            _local_1.@speedRate = this.speedRate;
            _local_1.@rSpeedRate = this.rSpeedRate;
            _local_1.@zRate = this.zRate;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ControlScriptArg = (super.clone() as ControlScriptArg);
            _local_1.release = this.release;
            _local_1.useLastestVX = this.useLastestVX;
            _local_1.useRun = this.useRun;
            _local_1.useDirection = this.useDirection;
            _local_1.checkContinue = this.checkContinue;
            _local_1.speedRate = this.speedRate;
            _local_1.rSpeedRate = this.rSpeedRate;
            _local_1.zRate = this.zRate;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_125()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_125 = " ControlScriptArg" (String#15272)


