// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.components.arg.JumpArg

package com.tencent.ai.core.components.arg
{
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_78;

    public class JumpArg 
    {

        public var v:int;
        public var g:int;
        public var endFunc:CFunction;
        public var vChange:CFunction;

        public function JumpArg(_arg_1:int=0, _arg_2:CFunction=null, _arg_3:CFunction=null, _arg_4:int=-1)
        {
            this.v = _arg_1;
            this.g = -1;
            this.endFunc = _arg_2;
            this.vChange = _arg_3;
        }

        public /*  ©init. */ function _SafeStr_78()
        {
        }


    }
}//package com.tencent.ai.core.components.arg

// _SafeStr_78 = " JumpArg" (String#14132)


