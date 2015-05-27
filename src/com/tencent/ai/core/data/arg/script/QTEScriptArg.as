// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.QTEScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_143;

    public class QTEScriptArg extends ScriptArg 
    {

        public var removeQTE:Boolean = false;
        public var vkeyCode:int = 11;
        public var vkeyDownTimes:int = 0;
        public var showTips:Boolean = false;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.removeQTE = (int(_arg_1.@remove) == 1);
            this.vkeyCode = int(_arg_1.@vkey);
            this.vkeyDownTimes = int(_arg_1.@times);
            this.showTips = (int(_arg_1.@show) == 1);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@show = ((this.showTips) ? 1 : 0);
            _local_1.@vkey = this.vkeyCode;
            _local_1.@times = this.vkeyDownTimes;
            _local_1.@remove = ((this.removeQTE) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:QTEScriptArg = (super.clone() as QTEScriptArg);
            _local_1.removeQTE = this.removeQTE;
            _local_1.vkeyCode = this.vkeyCode;
            _local_1.vkeyDownTimes = this.vkeyDownTimes;
            _local_1.showTips = this.showTips;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_143()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_143 = " QTEScriptArg" (String#15671)


