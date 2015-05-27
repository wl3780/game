// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.AcceptVKeyArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_110;

    public class AcceptVKeyArg extends ScriptArg 
    {

        public var clear:Boolean = true;
        public var checkUp:Boolean = false;
        public var limitFrames:int = 6;
        public var limitMapY:int = 0;
        public var limitStep:int = 0;
        public var vkeys:Array;
        public var checkNow:Boolean = false;

        public function AcceptVKeyArg()
        {
            this.vkeys = [];
            super();
        }

        public function isNull():Boolean
        {
            return ((this.vkeys.length == 0));
        }

        override public function decode(_arg_1:XML):void
        {
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int;
            super.decode(_arg_1);
            var _local_2:String = String(_arg_1.@vkeys);
            if (_local_2 != ""){
                this.vkeys = _local_2.split("|");
                _local_3 = 0;
                while (_local_3 < this.vkeys.length) {
                    _local_4 = this.vkeys[_local_3].split(",");
                    _local_5 = 0;
                    while (_local_5 < _local_4.length) {
                        _local_4[_local_5] = int(_local_4[_local_5]);
                        _local_5++;
                    };
                    this.vkeys[_local_3] = _local_4;
                    _local_3++;
                };
            };
            this.clear = (int(_arg_1.@clear) == 1);
            this.checkUp = (int(_arg_1.@checkUp) == 1);
            this.limitFrames = int(_arg_1.@limitFrames);
            this.limitMapY = int(_arg_1.@limitMapY);
            this.limitStep = int(_arg_1.@limitStep);
            this.checkNow = (int(_arg_1.@checkNow) == 1);
        }

        override public function encode()
        {
            var _local_4:String;
            var _local_1:XML = super.encode();
            var _local_2 = "";
            var _local_3:int;
            while (_local_3 < this.vkeys.length) {
                _local_4 = this.vkeys[_local_3].join(",");
                if (_local_3 == 0){
                    _local_2 = _local_4;
                } else {
                    _local_2 = (_local_2 + ("|" + _local_4));
                };
                _local_3++;
            };
            _local_1.@vkeys = _local_2;
            _local_1.@clear = ((this.clear) ? 1 : 0);
            _local_1.@checkUp = ((this.checkUp) ? 1 : 0);
            _local_1.@limitFrames = this.limitFrames;
            _local_1.@limitMapY = this.limitMapY;
            _local_1.@limitStep = this.limitStep;
            _local_1.@checkNow = ((this.checkNow) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:AcceptVKeyArg = (super.clone() as AcceptVKeyArg);
            _local_1.clear = this.clear;
            _local_1.checkUp = this.checkUp;
            _local_1.limitFrames = this.limitFrames;
            _local_1.limitMapY = this.limitMapY;
            _local_1.limitStep = this.limitStep;
            _local_1.vkeys = this.vkeys.concat();
            _local_1.checkNow = this.checkNow;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_110()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_110 = " AcceptVKeyArg" (String#17303)


