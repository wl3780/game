// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CancelActionArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_116;

    public class CancelActionArg extends ScriptArg 
    {

        public var cancelVKeys:String = "";
        public var clear:Boolean = true;
        public var cancelVkeyGroups:Array;


        override public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:CancelVkeyGroup;
            super.decode(_arg_1);
            this.clear = (int(_arg_1.@clear) == 1);
            this.cancelVKeys = _arg_1.@cancelVKeys;
            var _local_2:XMLList = _arg_1.CancelVkeyGroup;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                this.cancelVkeyGroups = [];
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = new CancelVkeyGroup();
                    _local_5.decode(_local_2[_local_4]);
                    this.cancelVkeyGroups.push(_local_5);
                    _local_4++;
                };
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@clear = ((this.clear) ? 1 : 0);
            _local_1.@cancelVKeys = this.cancelVKeys;
            var _local_2:int = (((this.cancelVkeyGroups)!=null) ? (this.cancelVkeyGroups.length) : 0);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_1.appendChild(this.cancelVkeyGroups[_local_3].encode());
                _local_3++;
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CancelActionArg = (super.clone() as CancelActionArg);
            _local_1.cancelVKeys = this.cancelVKeys;
            _local_1.clear = this.clear;
            _local_1.cancelVkeyGroups = (((this.cancelVkeyGroups)!=null) ? this.cancelVkeyGroups.concat() : null);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_116()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_116 = " CancelActionArg" (String#16652)


