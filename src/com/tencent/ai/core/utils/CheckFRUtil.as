package com.tencent.ai.core.utils
{
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;
    import flash.utils.getTimer;

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
            return _FPS;
        }

        public static function init(stage:DisplayObjectContainer):void
        {
            if (!_dic) {
                _dic = new Vector.<Object>();
            }
            _pr = stage;
            stage.addEventListener(Event.ENTER_FRAME, onFresh);
            _hasFocus = true;
            _pr.addEventListener(Event.ACTIVATE, onActive);
            _pr.addEventListener(Event.DEACTIVATE, onDeActive);
            _prevT = getTimer();
            _counter = 0;
        }

        protected static function onDeActive(evt:Event):void
        {
            _hasFocus = false;
        }

        protected static function onActive(evt:Event):void
        {
            _hasFocus = true;
            _counter = getTimer();
        }

        public static function addEventListener(func:Function, frames:int=15):void
        {
            if (!_dic) {
                _dic = new Vector.<Object>();
            }
            _dic.push({
                "callBack":func,
                "lowestFrame":frames
            });
        }

        public static function removeEventListener(func:Function, frames:int=15):void
        {
            var idx:int;
            while (idx < _dic.length) {
                if (_dic[idx].callBack === func && _dic[idx].lowestFrame == frames) {
                    _dic.splice(idx, 1);
                    idx--;
                }
                idx++;
            }
        }

        private static function onFresh(evt:Event):void
        {
            _startT = getTimer();
            if ((_startT - _prevT) >= (1000 * 30)) {
                _prevT = _startT;
                _FPS = _counterForFPS;
            	var len:int = _dic.length;
	            var idx:uint = 0;
                while (idx < len) {
	            	var item:Object = _dic[idx];
                    if ((item.lowestFrame * 30) >= _counterForFPS) {
                        if (!_hasFocus || (_hasFocus && (_startT - _counter < 2 * 1000 * 60))) {
                            return;
                        }
                        item.callBack();
                    }
                    idx++;
                }
                _counterForFPS = 0;
            }
            _counterForFPS++;
        }

    }
}
