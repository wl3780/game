// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SetGlobalValueArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_154;

    public class SetGlobalValueArg extends ScriptArg 
    {

        public static const MAIN_PLAYER_CONTROL:int = 1;
        public static const MAIN_PLAYER_KEYBOARD_TYPE:int = 2;

        public var setType:int = 0;
        public var setValue:String = "";


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.setType = int(_arg_1.@setType);
            this.setValue = String(_arg_1.@setValue);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@setType = this.setType;
            _local_1.@setValue = this.setValue;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SetGlobalValueArg = (super.clone() as SetGlobalValueArg);
            _local_1.setType = this.setType;
            _local_1.setValue = this.setValue;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_154()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_154 = " SetGlobalValueArg" (String#15461)


