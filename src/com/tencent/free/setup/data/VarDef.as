// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.data.VarDef

package com.tencent.free.setup.data
{
    import  ©init._SafeStr_58;

    public class VarDef 
    {

        public var key:String;
        public var regExp:RegExp;
        public var value:String;

        public function VarDef(_arg_1:String, _arg_2:String)
        {
            this.key = _arg_1;
            this.regExp = new RegExp((("\\{" + _arg_1) + "\\}"), "g");
            this.value = _arg_2;
        }

        public function replace(_arg_1:String):String
        {
            return (_arg_1.replace(this.regExp, this.value));
        }

        public /*  ©init. */ function _SafeStr_58()
        {
        }


    }
}//package com.tencent.free.setup.data

// _SafeStr_58 = " VarDef" (String#1496)


