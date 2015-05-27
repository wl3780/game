// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.redirect.RedirectConfig

package com.tencent.free.core.redirect
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_39;

    public class RedirectConfig 
    {

        public var redirectMap:Dictionary;

        public function RedirectConfig()
        {
            this.redirectMap = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:RedirectFile;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Redirect;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new RedirectFile();
                _local_7.url = String(_local_6.@url);
                _local_7.redirctPath = String(_local_6.@to);
                _local_7.len = int(_local_6.@len);
                this.redirectMap[_local_7.url] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function decode(_arg_1:XML):Boolean
        {
            return (this.parse(_arg_1));
        }

        public function encode():XML
        {
            var _local_2:Object;
            var _local_3:RedirectFile;
            var _local_4:XML;
            var _local_1:XML = <RedirectMap/>
            ;
            for (_local_2 in this.redirectMap) {
                _local_3 = this.redirectMap[_local_2];
                _local_4 = <Redirect/>
                ;
                _local_4.@url = _local_3.url;
                _local_4.@to = _local_3.redirctPath;
                _local_4.@len = _local_3.len;
                _local_1.appendChild(_local_4);
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_39()
        {
        }


    }
}//package com.tencent.free.core.redirect

// _SafeStr_39 = " RedirectConfig" (String#1511)


