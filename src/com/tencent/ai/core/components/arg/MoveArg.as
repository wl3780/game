// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.components.arg.MoveArg

package com.tencent.ai.core.components.arg
{
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_79;

    public class MoveArg 
    {

        public var dir:int;
        public var v:int = 0;
        public var f:int = 0;
        public var func:CFunction;
        public var igT:Boolean = false;

        public function MoveArg(_arg_1:int=1, _arg_2:int=0, _arg_3:int=0, _arg_4:CFunction=null)
        {
            this.dir = _arg_1;
            this.v = _arg_2;
            this.f = _arg_3;
            this.func = _arg_4;
        }

        public /*  ©init. */ function _SafeStr_79()
        {
        }


    }
}//package com.tencent.ai.core.components.arg

// _SafeStr_79 = " MoveArg" (String#17402)


