// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallPetAwakeComponentArg

package com.tencent.ai.core.data.arg
{
    import  ©init._SafeStr_185;

    public class CallPetAwakeComponentArg 
    {

        public var petID:uint;
        public var skillID:uint;
        public var useCoupon:Boolean;
        public var levelLimit:uint;
        public var inCmd:int;
        public var outCmd:int;
        public var callback:Function;

        public function CallPetAwakeComponentArg(_arg_1:uint, _arg_2:uint, _arg_3:Boolean, _arg_4:uint, _arg_5:int, _arg_6:int, _arg_7:Function)
        {
            this.petID = _arg_1;
            this.skillID = _arg_2;
            this.useCoupon = _arg_3;
            this.levelLimit = _arg_4;
            this.inCmd = _arg_5;
            this.outCmd = _arg_6;
            this.callback = _arg_7;
        }

        public /*  ©init. */ function _SafeStr_185()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_185 = " CallPetAwakeComponentArg" (String#17030)


