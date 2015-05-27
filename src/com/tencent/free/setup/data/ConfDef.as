// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.data.ConfDef

package com.tencent.free.setup.data
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_53;

    public dynamic class ConfDef 
    {

        public var name:String;
        public var key:String;
        public var src:String;
        public var hash:String;
        public var compress:Boolean;
        public var text:String;
        public var byteArray:ByteArray;

        public function ConfDef(_arg_1:String="", _arg_2:String="", _arg_3:String="", _arg_4:String="", _arg_5:Boolean=false)
        {
            this.name = _arg_1;
            this.key = _arg_2;
            this.src = _arg_3;
            this.hash = _arg_4;
            this.compress = _arg_5;
        }

        public /*  ©init. */ function _SafeStr_53()
        {
        }


    }
}//package com.tencent.free.setup.data

// _SafeStr_53 = " ConfDef" (String#1529)


