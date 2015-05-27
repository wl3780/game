// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.SharedObjectManager

package com.tencent.free.core.filesystem
{
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import  ©init._SafeStr_15;

    public class SharedObjectManager extends EventDispatcher 
    {

        private static var _needSOConfig:Object;
        private static var _instance:ISOProxy;


        public static function InitInstance(_arg_1:ISOProxy):void
        {
            _instance = _arg_1;
        }

        public static function get instance():ISOProxy
        {
            if (_instance == null){
                _instance = new DefaultSOProxy();
            };
            return (_instance);
        }

        public static function InitSOConfig(_arg_1:Object):void
        {
            _needSOConfig = _arg_1;
        }

        public static function tryOpen(_arg_1:String="17xf.qq.com"):Boolean
        {
            return (instance.tryOpen(_arg_1));
        }

        public static function open(_arg_1:String="17xf.qq.com"):void
        {
            instance.open(_arg_1);
        }

        public static function saveFile(_arg_1:Object, _arg_2:String, _arg_3:ByteArray):Boolean
        {
            return (instance.saveFile(_arg_1, _arg_2, _arg_3));
        }

        public static function delFile(_arg_1:Object):void
        {
            instance.delFile(_arg_1);
        }

        public static function getFile(_arg_1:Object, _arg_2:String):ByteArray
        {
            return (instance.getFile(_arg_1, _arg_2));
        }

        public static function needSO(_arg_1:Object):Boolean
        {
            if (_needSOConfig != null){
                return ((_needSOConfig[_arg_1] == true));
            };
            return (false);
        }


        public /*  ©init. */ function _SafeStr_15()
        {
        }


    }
}//package com.tencent.free.core.filesystem

// _SafeStr_15 = " SharedObjectManager" (String#1484)


