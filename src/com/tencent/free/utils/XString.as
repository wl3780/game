// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.XString

package com.tencent.free.utils
{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_80;

    public class XString 
    {

        private static var __Vars:Object;
        private static var __Exp:RegExp = /\{([Z-z$_][^\}\{]+)\}/g;
        public static var CHARSET:String = "utf-8";
        private static var byteBuff:ByteBuffer = new ByteBuffer();


        public static function Trim(_arg_1:String):String
        {
            return (_arg_1.replace(/(^\s*)|(\s*$)/g, ""));
        }

        public static function LTrim(_arg_1:String):String
        {
            return (_arg_1.replace(/(^\s*)/g, ""));
        }

        public static function RTrim(_arg_1:String):String
        {
            return (_arg_1.replace(/(\s*$)/g, ""));
        }

        public static function getFileName(_arg_1:String):String
        {
            var _local_2:int = _arg_1.lastIndexOf("/");
            if (_local_2 == -1){
                _local_2 = _arg_1.lastIndexOf("\\");
            };
            return (_arg_1.substring((_local_2 + 1), _arg_1.length));
        }

        public static function getURLExtension(_arg_1:String):String
        {
            var _local_2:String = _arg_1.substr(0, (((_arg_1.lastIndexOf("?") == -1)) ? _arg_1.length : (_arg_1.lastIndexOf("?"))));
            return (_local_2.substring((_local_2.lastIndexOf(".") + 1)));
        }

        public static function equalsIgnoreCase(_arg_1:String, _arg_2:String):Boolean
        {
            return ((_arg_1.toLowerCase() == _arg_2.toLowerCase()));
        }

        public static function equals(_arg_1:String, _arg_2:String):Boolean
        {
            return ((_arg_1 == _arg_2));
        }

        public static function isEmail(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function isNumber(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            return (!(isNaN(Number(_arg_1))));
        }

        public static function isDouble(_arg_1:String):Boolean
        {
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /^[-\+]?\d+(\.\d+)?$/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function isInteger(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /^[-\+]?\d+$/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function isEnglish(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /^[A-Za-z]+$/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function isChinese(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /^[Α-￥]+$/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function isDoubleChar(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /^[^\x00-\xff]+$/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function hasChineseChar(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_2:RegExp = /[^\x00-\xff]/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function hasAccountChar(_arg_1:String, _arg_2:uint=15):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            if (_arg_2 < 10){
                _arg_2 = 15;
            };
            _arg_1 = XString.Trim(_arg_1);
            var _local_3:RegExp = new RegExp((("^[a-zA-Z0-9][a-zA-Z0-9_-]{0," + _arg_2) + "}$"), "");
            var _local_4:Object = _local_3.exec(_arg_1);
            if (_local_4 == null){
                return (false);
            };
            return (true);
        }

        public static function isURL(_arg_1:String):Boolean
        {
            if (_arg_1 == null){
                return (false);
            };
            _arg_1 = XString.Trim(_arg_1).toLowerCase();
            var _local_2:RegExp = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\’:+!]*([^<>\"\"])*$/;
            var _local_3:Object = _local_2.exec(_arg_1);
            if (_local_3 == null){
                return (false);
            };
            return (true);
        }

        public static function isWhitespace(_arg_1:String):Boolean
        {
            switch (_arg_1){
                case " ":
                case "\t":
                case "\r":
                case "\n":
                case "\f":
                    return (true);
                default:
                    return (false);
            };
        }

        public static function beginsWith(_arg_1:String, _arg_2:String):Boolean
        {
            return ((_arg_2 == _arg_1.substring(0, _arg_2.length)));
        }

        public static function endsWith(_arg_1:String, _arg_2:String):Boolean
        {
            return ((_arg_2 == _arg_1.substring((_arg_1.length - 1), _arg_2.length)));
        }

        public static function remove(_arg_1:String, _arg_2:String):String
        {
            return (replace(_arg_1, _arg_2, '"'));
        }

        public static function replace(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            return (_arg_1.split(_arg_2).join(_arg_3));
        }

        public static function replaceAt(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int):String
        {
            _arg_3 = Math.max(_arg_3, 0);
            _arg_4 = Math.min(_arg_4, _arg_1.length);
            var _local_5:String = _arg_1.substr(0, _arg_3);
            var _local_6:String = _arg_1.substr(_arg_4, _arg_1.length);
            return (((_local_5 + _arg_2) + _local_6));
        }

        public static function removeAt(_arg_1:String, _arg_2:int, _arg_3:int):String
        {
            return (replaceAt(_arg_1, "", _arg_2, _arg_3));
        }

        public static function fixNewlines(_arg_1:String):String
        {
            return (_arg_1.replace(/\r\n/gm, "\n"));
        }

        public static function TranArgs(_arg_1:String, _arg_2:Object):String
        {
            if ((((((_arg_2 == null)) || ((_arg_1.indexOf("{") == -1)))) || ((_arg_1.indexOf("}") == -1)))){
                return (_arg_1);
            };
            __Vars = _arg_2;
            _arg_1 = _arg_1.replace(__Exp, __Method);
            __Vars = null;
            return (_arg_1);
        }

        private static function __Method(... _args):String
        {
            return (__Vars[_args[1]]);
        }

        public static function DecodePoint(_arg_1:String, _arg_2:String=","):Point
        {
            var _local_4:int;
            var _local_5:int;
            var _local_3:int = _arg_1.indexOf(_arg_2);
            if (_local_3 != -1){
                _local_4 = int(_arg_1.substring(0, _local_3));
                _local_5 = int(_arg_1.substring((_local_3 + 1), _arg_1.length));
                return (new Point(_local_4, _local_5));
            };
            return (null);
        }

        public static function DecodeRect(_arg_1:String, _arg_2:String=","):Rectangle
        {
            var _local_3:int = _arg_1.indexOf(_arg_2);
            var _local_4:int = _arg_1.indexOf(_arg_2, (_local_3 + 1));
            var _local_5:int = _arg_1.indexOf(_arg_2, (_local_4 + 1));
            var _local_6:int = int(_arg_1.substring(0, _local_3));
            var _local_7:int = int(_arg_1.substring((_local_3 + 1), _local_4));
            var _local_8:int = int(_arg_1.substring((_local_4 + 1), _local_5));
            var _local_9:int = int(_arg_1.substring((_local_5 + 1), _arg_1.length));
            return (new Rectangle(_local_6, _local_7, _local_8, _local_9));
        }

        public static function ReadIP(_arg_1:IDataInput):String
        {
            var _local_2:uint = _arg_1.readUnsignedInt();
            return ((((((((_local_2 & 0xFF) + ".") + (uint((_local_2 >> 8)) & 0xFF)) + ".") + (uint((_local_2 >> 16)) & 0xFF)) + ".") + (uint((_local_2 >> 24)) & 0xFF)));
        }

        public static function WriteIP(_arg_1:IDataOutput, _arg_2:String):void
        {
            var _local_3:Array = _arg_2.split(".");
            var _local_4:uint = ((((uint(_local_3[0]) & 0xFF) | (uint(_local_3[1]) & (0xFF << 8))) | (uint(_local_3[2]) & (0xFF << 16))) | (uint(_local_3[3]) & (0xFF << 24)));
            _arg_1.writeUnsignedInt(_local_4);
        }

        public static function ReadChars(_arg_1:IDataInput, _arg_2:int, _arg_3:String=""):String
        {
            var _local_5:int;
            if (_arg_3 == ""){
                _arg_3 = CHARSET;
            };
            return (_arg_1.readMultiByte(_arg_2, _arg_3));
        }

        public static function WriteChars(_arg_1:IDataOutput, _arg_2:String, _arg_3:int):void
        {
            var _local_4:int;
            byteBuff.allocate(_arg_3);
            byteBuff.writeMultiByte(_arg_2, CHARSET);
            if (_arg_3 == 0){
                _arg_1.writeShort(byteBuff.position);
            };
            if (byteBuff.position > 0){
                _arg_1.writeBytes(byteBuff, 0, byteBuff.position);
            };
            if (_arg_3 > 0){
                _local_4 = (_arg_3 - byteBuff.position);
                while (_local_4 > 0) {
                    _arg_1.writeByte(0);
                    _local_4--;
                };
            };
        }

        public static function WriteString(_arg_1:IDataOutput, _arg_2:String):void
        {
            if (_arg_2 == null){
                _arg_2 = "";
            };
            WriteChars(_arg_1, _arg_2, 0);
        }

        public static function ReadString(_arg_1:IDataInput):String
        {
            var _local_2:int = _arg_1.readUnsignedShort();
            return (_arg_1.readMultiByte(_local_2, CHARSET));
        }

        public static function substitute(_arg_1:String, ... _args):String
        {
            var _local_4:Array;
            var _local_3:uint = _args.length;
            if ((((_local_3 == 1)) && ((_args[0] is Array)))){
                _local_4 = (_args[0] as Array);
                _local_3 = _local_4.length;
            } else {
                _local_4 = _args;
            };
            var _local_5:int;
            while (_local_5 < _local_3) {
                _arg_1 = _arg_1.replace(new RegExp((("\\{" + _local_5) + "\\}"), "g"), _local_4[_local_5]);
                _local_5++;
            };
            return (_arg_1);
        }

        public static function getFilterString(_arg_1:String):String
        {
            _arg_1 = _arg_1.replace(/</g, "&lt;");
            return (_arg_1.replace(/>/g, "&gt;"));
        }


        public /*  ©init. */ function _SafeStr_80()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_80 = " XString" (String#1415)


