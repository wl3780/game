// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.data.AttrDef

package com.tencent.free.setup.data
{
    import com.tencent.free.utils.XString;
    import  ©init._SafeStr_52;

    public dynamic class AttrDef 
    {

        public var name:String;
        public var type:String;
        public var value:Object;
        private var _strValue:String;

        public function AttrDef(_arg_1:String="", _arg_2:String="", _arg_3:String="")
        {
            this.name = _arg_1;
            this.type = _arg_2;
            this.setStrValue(_arg_3);
        }

        public function setStrValue(_arg_1:String):void
        {
            if ((((_arg_1 == null)) || ((_arg_1 == "")))){
                return;
            };
            this._strValue = _arg_1;
            switch (this.type){
                case "num":
                    this.value = Number(this._strValue);
                    return;
                case "point":
                    this.value = XString.DecodePoint((this._strValue as String));
                    return;
                case "rect":
                    this.value = XString.DecodeRect((this._strValue as String));
                    return;
                default:
                    this.value = this._strValue;
            };
        }

        public /*  ©init. */ function _SafeStr_52()
        {
        }


    }
}//package com.tencent.free.setup.data

// _SafeStr_52 = " AttrDef" (String#1397)


