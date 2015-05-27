// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallDupRadisArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_177;

    public class CallDupRadisArg implements IXMLSerialize 
    {

        public static const OPEN_DUP_RADIS_1:int = 1;
        public static const OPEN_DUP_RADIS_2:int = 2;
        public static const OPEN_DUP_RADIS_3:int = 3;

        public var mode:int;
        public var dupID:int;
        public var data:Object;
        public var type:int;
        public var startLevel:int;
        public var endLevel:int;

        public function CallDupRadisArg(_arg_1:int=1)
        {
            this.mode = _arg_1;
        }

        public function decode(_arg_1:XML):void
        {
            this.mode = _arg_1.@callType;
        }

        public function encode()
        {
            return ("");
        }

        public /*  ©init. */ function _SafeStr_177()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_177 = " CallDupRadisArg" (String#14015)


