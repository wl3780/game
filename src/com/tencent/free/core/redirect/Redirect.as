// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.redirect.Redirect

package com.tencent.free.core.redirect
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_38;

    public class Redirect 
    {

        public static var MD5:String = "";
        public static var redirectMap:Dictionary;
        public static var preUrl:String = "";
        private static var _hasData:Boolean = false;


        public static function setData(_arg_1:XML):void
        {
            var _local_2:RedirectConfig = new RedirectConfig();
            _local_2.parse(_arg_1);
            redirectMap = _local_2.redirectMap;
            _hasData = true;
        }

        public static function clearData():void
        {
            _hasData = false;
            redirectMap = new Dictionary();
        }

        public static function hasData():Boolean
        {
            return (_hasData);
        }

        public static function redirect(_arg_1:String):String
        {
            var _local_2:String = _arg_1.replace(/\\/g, "/");
            var _local_3:RedirectFile = getRedirectFile(_local_2);
            if (_local_3){
                if ((((_local_3.redirctPath.indexOf("://") == -1)) && (!((preUrl == ""))))){
                    return (((preUrl + "/") + _local_3.redirctPath));
                };
                return (_local_3.redirctPath);
            };
            return (_arg_1);
        }

        public static function getRedirectFile(_arg_1:String):RedirectFile
        {
            var _local_2:String = _arg_1.substr(0, (((_arg_1.lastIndexOf("?") == -1)) ? _arg_1.length : _arg_1.lastIndexOf("?")));
            var _local_3:RedirectFile;
            if (redirectMap){
                _local_3 = redirectMap[_local_2];
                if (!_local_3){
                    _local_3 = redirectMap[relativePath(_arg_1)];
                };
            };
            return (_local_3);
        }

        public static function relativePath(_arg_1:String):String
        {
            var _local_2:String = _arg_1.substr(0, (((_arg_1.lastIndexOf("?") == -1)) ? _arg_1.length : _arg_1.lastIndexOf("?")));
            if (((!((preUrl == ""))) && ((_local_2.indexOf(preUrl) == 0)))){
                _local_2 = _local_2.substring((preUrl.length + 1));
            };
            return (_local_2.replace(/\\/g, "/"));
        }


        public /*  ©init. */ function _SafeStr_38()
        {
        }


    }
}//package com.tencent.free.core.redirect

// _SafeStr_38 = " Redirect" (String#1508)


