package com.tencent.free.core.redirect
{
    import flash.utils.Dictionary;

    public class Redirect 
    {

        public static var MD5:String = "";
        public static var redirectMap:Dictionary;
        public static var preUrl:String = "";
        
		private static var _hasData:Boolean = false;


        public static function setData(xml:XML):void
        {
            var config:RedirectConfig = new RedirectConfig();
            config.parse(xml);
            this.redirectMap = config.redirectMap;
            _hasData = true;
        }

        public static function clearData():void
        {
            this.redirectMap = new Dictionary();
            _hasData = false;
        }

        public static function hasData():Boolean
        {
            return _hasData;
        }

        public static function redirect(url:String):String
        {
            var newURL:String = url.replace(/\\/g, "/");
            var dirFile:RedirectFile = this.getRedirectFile(newURL);
            if (dirFile) {
                if (dirFile.redirctPath.indexOf("://") == -1 && this.preUrl != "") {
                    return this.preUrl + "/" + dirFile.redirctPath;
                }
                return dirFile.redirctPath;
            }
            return url;
        }

        public static function getRedirectFile(url:String):RedirectFile
        {
            var aURL:String = url.substr(0, url.lastIndexOf("?") == -1 ? url.length : url.lastIndexOf("?"));
            var dirFile:RedirectFile;
            if (this.redirectMap) {
                dirFile = this.redirectMap[aURL];
                if (!dirFile) {
                    dirFile = this.redirectMap[this.relativePath(url)];
                }
            }
            return dirFile;
        }

        public static function relativePath(url:String):String
        {
            var aURL:String = url.substr(0, url.lastIndexOf("?") == -1 ? url.length : url.lastIndexOf("?"));
            if (this.preUrl != "" && aURL.indexOf(preUrl) == 0) {
                aURL = aURL.substring(preUrl.length + 1);
            }
            return aURL.replace(/\\/g, "/");
        }

    }
}
