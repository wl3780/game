package com.tencent.free.utils
{
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import flash.utils.getTimer;

    public class Schedule 
    {

        private static var __instance:Schedule;

        const DEFAULT_DELAY:int = 10;

        private var _timer:Timer;
        private var _currentInvokes:Vector.<InvokeItem>;
        private var _buffInvokes:Vector.<InvokeItem>;

        public function Schedule()
        {
            _timer = new Timer(this.DEFAULT_DELAY);
            _timer.addEventListener(TimerEvent.TIMER, this.onTimer);
            
			_currentInvokes = new Vector.<InvokeItem>();
            _buffInvokes = new Vector.<InvokeItem>();
        }

        public static function get Default():Schedule
        {
            if (__instance == null) {
                __instance = new Schedule();
            }
            return __instance;
        }

        public static function addInvoke(func:CFunction, delay:int=0):void
        {
            Default.addInvoke(func, delay);
        }

        public static function removeInvoke(func:CFunction):void
        {
            Default.removeInvoke(func);
        }


        protected function onTimer(evt:TimerEvent):void
        {
            var item:InvokeItem;
            var idx:int = _currentInvokes.length - 1;
            while (idx >= 0) {
                item = _currentInvokes[idx];
                item.func.invoke();
                idx--;
            }
            _currentInvokes.length = 0;
            this.checkRuning();
        }

        protected function checkRuning():void
        {
            if (_buffInvokes.length == 0) {
                _timer.stop();
            } else {
	            var tmp:Vector.<InvokeItem> = _currentInvokes;
                _currentInvokes = _buffInvokes;
                _buffInvokes = tmp;
            }
        }

        public function setDelay(value:int):void
        {
            _timer.delay = value;
        }

        public function addInvoke(func:CFunction, delay:int=0):void
        {
            if (func != null) {
	            var list:Vector.<InvokeItem> = _buffInvokes;
                list.splice(0, 0, new InvokeItem(func, delay, getTimer()));
                if (!_timer.running) {
                    _timer.start();
                }
            }
        }

        public function removeInvoke(func:CFunction):void
        {
            if (func == null) {
                return;
            }
            var list:Vector.<InvokeItem> = _buffInvokes;
            var len:int = list.length;
            var idx:int;
            while (idx < len) {
	            var item:InvokeItem = list[idx];
                if (item.func == func) {
                    list.splice(idx, 1);
                    return;
                }
                idx++;
            }
        }

    }
}

import com.tencent.free.utils.CFunction;

class InvokeItem 
{

    public var func:CFunction;
    public var delay:int;
    public var begin:int;
    public var once:Boolean;

    public function InvokeItem(func:CFunction, delay:int, begin:int, once:Boolean=true)
    {
        this.func = func;
        this.delay = delay;
        this.begin = begin;
        this.once = once;
    }

}
