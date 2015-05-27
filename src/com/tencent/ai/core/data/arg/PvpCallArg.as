// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.PvpCallArg

package com.tencent.ai.core.data.arg
{
    import  ©init._SafeStr_201;

    public class PvpCallArg 
    {

        public static const LOG_OUT:int = 0;
        public static const EXIT_PVP:int = -1;
        public static const SINGLE_MODE:int = 1;
        public static const MULTI_MODE:int = 2;
        public static const TEAM_MODE:int = 3;
        public static const FRIEND_MODE:int = 4;
        public static const TRAIN_MODE_1:int = 5;
        public static const TRAIN_MODE_2:int = 6;

        public var mode:int;

        public function PvpCallArg(_arg_1:int=1)
        {
            this.mode = _arg_1;
        }

        public function decode(_arg_1:XML):void
        {
            this.mode = _arg_1.@mode;
        }

        public function encode()
        {
            return ("");
        }

        public /*  ©init. */ function _SafeStr_201()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_201 = " PvpCallArg" (String#14927)


