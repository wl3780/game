package com.tencent.free.core.redirect
{
    import flash.utils.Dictionary;

    public class RedirectConfig
    {

        public var redirectMap:Dictionary;

        public function RedirectConfig()
        {
            this.redirectMap = new Dictionary();
        }

        public function parse(obj:Object):Boolean
        {
            var xml:XML = (obj is String) ? new XML(obj) : (obj as XML);
            var dirXML:XMLList = xml.Redirect;
            var len:int = dirXML.length();
            var idx:int;
            while (idx < len) {
	            var subXML:XML = dirXML[idx];
	            var subDir:RedirectFile = new RedirectFile();
                subDir.url = String(subXML.@url);
                subDir.redirctPath = String(subXML.@to);
                subDir.len = int(subXML.@len);
                this.redirectMap[subDir.url] = subDir;
                idx++;
            }
            return true;
        }

        public function decode(xml:XML):Boolean
        {
            return this.parse(xml);
        }

        public function encode():XML
        {
            var xml:XML = <RedirectMap/>;
            for (var url:Object in this.redirectMap) {
	            var subDir:RedirectFile = this.redirectMap[url];
	            var subXML:XML = <Redirect/>;
                subXML.@url = subDir.url;
                subXML.@to = subDir.redirctPath;
                subXML.@len = subDir.len;
                xml.appendChild(subXML);
            }
            return xml;
        }

    }
}
