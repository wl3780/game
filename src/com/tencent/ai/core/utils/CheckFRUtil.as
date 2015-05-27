// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.CheckFRUtil

package com.tencent.ai.core.utils
{
    import __AS3__.vec.Vector;
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;
    import flash.utils.getTimer;
    import  ©init._SafeStr_1370;
    import __AS3__.vec.*;

    public class CheckFRUtil 
    {

        private static var _startT:int;
        private static var _prevT:int;
        private static var _counterForFPS:int;
        private static var _dic:Vector.<Object>;
        private static var _FPS:int;
        private static var _pr:DisplayObjectContainer;
        private static var _hasFocus:Boolean;
        private static var _counter:uint;


        public static function get FPS():int
        {
            return (_FPS);
        }

        public static function init(_arg_1:DisplayObjectContainer):void
        {
            if (!_dic){
                _dic = new Vector.<Object>();
            };
            _pr = _arg_1;
            _arg_1.addEventListener(Event.ENTER_FRAME, onFresh);
            _hasFocus = true;
            _pr.addEventListener(Event.ACTIVATE, onActive);
            _pr.addEventListener(Event.DEACTIVATE, onDeActive);
            _prevT = getTimer();
            _counter = 0;
        }

        protected static function onDeActive(_arg_1:Event):void
        {
            _hasFocus = false;
        }

        protected static function onActive(_arg_1:Event):void
        {
            _hasFocus = true;
            _counter = getTimer();
        }

        public static function addEventListener(_arg_1:Function, _arg_2:int=15):void
        {
            if (!_dic){
                _dic = new Vector.<Object>();
            };
            _dic.push({
                "callBack":_arg_1,
                "lowestFrame":_arg_2
            });
        }

        public static function removeEventListener(_arg_1:Function, _arg_2:int=15):void
        {
            var _local_3:int;
            while (_local_3 < _dic.length) {
                if ((((_dic[_local_3].callBack === _arg_1)) && ((_dic[_local_3].lowestFrame == _arg_2)))){
                    _dic.splice(_local_3, 1);
                    _local_3--;
                };
                _local_3++;
            };
        }

        private static function onFresh(_arg_1:Event):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:uint;
            _startT = getTimer();
            if ((_startT - _prevT) >= (1000 * 30)){
                _prevT = _startT;
                _FPS = _counterForFPS;
                _local_2 = _dic.length;
                _local_4 = 0;
                while (_local_4 < _local_2) {
                    _local_3 = _dic[_local_4];
                    if ((_local_3.lowestFrame * 30) >= _counterForFPS){
                        if (((!(_hasFocus)) || (((_hasFocus) && (((getTimer() - _counter) < ((2 * 1000) * 60))))))){
                            return;
                        };
                        _local_3.callBack();
                    };
                    _local_4++;
                };
                _counterForFPS = 0;
            };
            _counterForFPS++;
        }

        private static function check(_arg_1:Vector.<Boolean>):Boolean
        {
            if (_arg_1.length < 10){
                return (false);
            };
            var _local_2:uint;
            var _local_3:uint;
            while (_local_3 < 10) {
                if (_arg_1[_local_3]){
                    _local_2++;
                };
                _local_3++;
            };
            if (_arg_1.length > 10){
                _arg_1.splice(0, (_arg_1.length - 10));
            };
            return ((_local_2 >= 5));
        }


        public /*  ©init. */ function _SafeStr_1370()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1370 = " CheckFRUtil" (String#14447)


