// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.RequireInfo

package com.tencent.free.core.plugin
{
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.core.lib.DomainType;
    import  ©init._SafeStr_36;

    public class RequireInfo 
    {

        public var type:int;
        public var value:String;
        public var domain:int;
        public var hash:String;
        public var des:String;
        public var domainCls:CLASS;
        public var content:Object;

        public function RequireInfo(_arg_1:int=0, _arg_2:String="", _arg_3:String="", _arg_4:String="")
        {
            this.domain = DomainType.DOMAIN_CHILD;
            super();
            this.type = _arg_1;
            this.value = _arg_2;
            this.hash = _arg_3;
            this.des = _arg_4;
        }

        public function decodeXML(_arg_1:XML):void
        {
            if (_arg_1 == null){
                return;
            };
            this.type = int(_arg_1.@type);
            this.value = String(_arg_1.@value);
            this.domain = int(_arg_1.@domain);
            this.hash = String(_arg_1.@hash);
            this.des = String(_arg_1.@des);
        }

        public function encodeXML():String
        {
            return ("");
        }

        public /*  ©init. */ function _SafeStr_36()
        {
        }


    }
}//package com.tencent.free.core.plugin

// _SafeStr_36 = " RequireInfo" (String#1490)


