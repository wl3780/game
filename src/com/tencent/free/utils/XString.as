package com.tencent.free.utils
{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class XString 
    {

        public static var CHARSET:String = "utf-8";
		
        private static var __Vars:Object;
        private static var __Exp:RegExp = /\{([Z-z$_][^\}\{]+)\}/g;
        
		private static var byteBuff:ByteBuffer = new ByteBuffer();

        public static function Trim(str:String):String
        {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }

        public static function LTrim(str:String):String
        {
            return str.replace(/(^\s*)/g, "");
        }

        public static function RTrim(str:String):String
        {
            return str.replace(/(\s*$)/g, "");
        }

        public static function getFileName(path:String):String
        {
            var idx:int = path.lastIndexOf("/");
            if (idx == -1) {
                idx = path.lastIndexOf("\\");
            }
            return path.substring(idx + 1, path.length);
        }

        public static function getURLExtension(url:String):String
        {
            var aURL:String = url.substr(0, url.lastIndexOf("?") == -1 ? url.length : url.lastIndexOf("?"));
            return aURL.substring(aURL.lastIndexOf(".") + 1);
        }

        public static function equalsIgnoreCase(strA:String, strB:String):Boolean
        {
            return strA.toLowerCase() == strB.toLowerCase();
        }

        public static function equals(strA:String, strB:String):Boolean
        {
            return strA == strB;
        }

        public static function isEmail(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            str = XString.Trim(str);
            var mailExp:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
            var matchs:Object = mailExp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isNumber(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            return !isNaN(Number(str));
        }

        public static function isDouble(str:String):Boolean
        {
            str = XString.Trim(str);
            var numExp:RegExp = /^[-\+]?\d+(\.\d+)?$/;
            var matchs:Object = numExp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isInteger(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            str = XString.Trim(str);
            var intExp:RegExp = /^[-\+]?\d+$/;
            var matchs:Object = intExp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isEnglish(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            str = XString.Trim(str);
            var engExp:RegExp = /^[A-Za-z]+$/;
            var matchs:Object = engExp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isChinese(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            str = XString.Trim(str);
            var chExp:RegExp = /^[Α-￥]+$/;
            var matchs:Object = chExp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isDoubleChar(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            str = XString.Trim(str);
            var exp:RegExp = /^[^\x00-\xff]+$/;
            var matchs:Object = exp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function hasChineseChar(_arg_1:String):Boolean
        {
            if (_arg_1 == null) {
                return false;
            }
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /[^\x00-\xff]/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null) {
                return false;
            }
            return true;
        }

        public static function hasAccountChar(str:String, size:uint=15):Boolean
        {
            if (str == null) {
                return false;
            }
            if (size < 10) {
                size = 15;
            }
            str = XString.Trim(str);
            var exp:RegExp = new RegExp("^[a-zA-Z0-9][a-zA-Z0-9_-]{0," + size + "}$", "");
            var matchs:Object = exp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isURL(str:String):Boolean
        {
            if (str == null) {
                return false;
            }
            str = XString.Trim(str).toLowerCase();
            var exp:RegExp = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\’:+!]*([^<>\"\"])*$/;
            var matchs:Object = exp.exec(str);
            if (matchs == null) {
                return false;
            }
            return true;
        }

        public static function isWhitespace(str:String):Boolean
        {
            switch (str) {
                case " ":
                case "\t":
                case "\r":
                case "\n":
                case "\f":
                    return true;
                default:
                    return false;
            }
        }

        public static function beginsWith(str:String, subStr:String):Boolean
        {
            return subStr == str.substring(0, subStr.length);
        }

        public static function endsWith(str:String, subStr:String):Boolean
        {
            return subStr == str.substring(str.length - 1, subStr.length);
        }

        public static function remove(str:String, subStr:String):String
        {
            return replace(str, subStr, '"');
        }

        public static function replace(str:String, repStr:String, toStr:String):String
        {
            return str.split(repStr).join(toStr);
        }

        public static function replaceAt(str:String, subStr:String, from:int, to:int):String
        {
            from = Math.max(from, 0);
            to = Math.min(to, str.length);
            var head:String = str.substr(0, from);
            var end:String = str.substr(to, str.length);
            return head + subStr + end;
        }

        public static function removeAt(str:String, from:int, to:int):String
        {
            return replaceAt(str, "", from, to);
        }

        public static function fixNewlines(str:String):String
        {
            return str.replace(/\r\n/gm, "\n");
        }

        public static function TranArgs(str:String, arg:Object):String
        {
            if (arg == null || str.indexOf("{") == -1 || str.indexOf("}") == -1) {
                return str;
            }
            __Vars = arg;
            str = str.replace(__Exp, __Method);
            __Vars = null;
            return str;
        }
        private static function __Method(... args):String
        {
            return __Vars[args[1]];
        }

        public static function DecodePoint(str:String, delimiter:String=","):Point
        {
            var idx:int = str.indexOf(delimiter);
            if (idx != -1) {
            	var x:int = int(str.substring(0, idx));
            	var y:int = int(str.substring(idx + 1, str.length));
                return new Point(x, y);
            }
            return null;
        }

        public static function DecodeRect(str:String, delimiter:String=","):Rectangle
        {
            var idxX:int = str.indexOf(delimiter);
            var idxY:int = str.indexOf(delimiter, idxX + 1);
            var idxW:int = str.indexOf(delimiter, idxY + 1);
            var x:int = int(str.substring(0, idxX));
            var y:int = int(str.substring(idxX + 1, idxY));
            var width:int = int(str.substring(idxY + 1, idxW));
            var height:int = int(str.substring(idxW + 1, str.length));
            return new Rectangle(x, y, width, height);
        }

        public static function ReadIP(data:IDataInput):String
        {
            var num:uint = data.readUnsignedInt();
            return (num & 0xFF) + "." + (uint(num >> 8) & 0xFF) + "." + (uint(num >> 16) & 0xFF) + "." + (uint(num >> 24) & 0xFF);
        }

        public static function WriteIP(data:IDataOutput, str:String):void
        {
            var arr:Array = str.split(".");
            var num:uint = (uint(arr[0]) & 0xFF) | (uint(arr[1]) & (0xFF << 8)) | (uint(arr[2]) & (0xFF << 16)) | (uint(arr[3]) & (0xFF << 24));
            data.writeUnsignedInt(num);
        }

        public static function ReadChars(data:IDataInput, len:int, charset:String=""):String
        {
            if (charset == "") {
                charset = CHARSET;
            }
            return data.readMultiByte(len, charset);
        }

        public static function WriteChars(data:IDataOutput, str:String, len:int):void
        {
            byteBuff.allocate(len);
            byteBuff.writeMultiByte(str, CHARSET);
            if (len == 0) {
                data.writeShort(byteBuff.position);
            }
            if (byteBuff.position > 0) {
                data.writeBytes(byteBuff, 0, byteBuff.position);
            }
            if (len > 0) {
	            var idx:int = len - byteBuff.position;
                while (idx > 0) {
                    data.writeByte(0);
                    idx--;
                }
            }
        }

        public static function WriteString(data:IDataOutput, str:String):void
        {
            if (str == null) {
                str = "";
            }
            WriteChars(data, str, 0);
        }

        public static function ReadString(data:IDataInput):String
        {
            var str:int = data.readUnsignedShort();
            return data.readMultiByte(str, CHARSET);
        }

		/**
		 * 模式匹配{0}{1}...
		 * @param str
		 * @param args
		 * @return 
		 */		
        public static function substitute(str:String, ... args):String
        {
            var arr:Array;
            var len:uint = args.length;
            if (len == 1 && args[0] is Array) {
                arr = args[0] as Array;
                len = arr.length;
            } else {
                arr = args;
            }
            var idx:int;
            while (idx < len) {
                str = str.replace(new RegExp("\\{" + idx + "\\}", "g"), arr[idx]);
                idx++;
            }
            return str;
        }

        public static function getFilterString(str:String):String
        {
            str = str.replace(/</g, "&lt;");
            return str.replace(/>/g, "&gt;");
        }


        public static function matchsRegExp(str:String, exp:RegExp):Boolean
        {
			var matchs:Object = exp.exec(str);
			if (matchs == null) {
				return false;
			}
			return true;
        }

    }
}
