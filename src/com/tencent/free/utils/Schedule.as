// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.Schedule

package com.tencent.free.utils
{
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import  ©init._SafeStr_77;
    import __AS3__.vec.*;

    public class Schedule 
    {

        private static var __instance:Schedule;

        const DEFAULT_DELAY:int = 10;

        private var _timer:Timer;
        private var _currentInvokes:Vector.<InvokeItem>;
        private var _buffInvokes:Vector.<InvokeItem>;

        public function Schedule()
        {
            this._timer = new Timer(this.DEFAULT_DELAY);
            this._timer.addEventListener(TimerEvent.TIMER, this.onTimer);
            this._currentInvokes = new Vector.<InvokeItem>();
            this._buffInvokes = new Vector.<InvokeItem>();
        }

        public static function get Default():Schedule
        {
            if (__instance == null){
                __instance = new (Schedule)();
            };
            return (__instance);
        }

        public static function addInvoke(_arg_1:CFunction, _arg_2:int=0):void
        {
            Default.addInvoke(_arg_1, _arg_2);
        }

        public static function removeInvoke(_arg_1:CFunction):void
        {
            Default.removeInvoke(_arg_1);
        }


        protected function onTimer(_arg_1:TimerEvent):void
        {
            var _local_4:InvokeItem;
            var _local_2:int = getTimer();
            var _local_3:int = (this._currentInvokes.length - 1);
            while (_local_3 >= 0) {
                _local_4 = this._currentInvokes[_local_3];
                _local_4.func.invoke();
                _local_3--;
            };
            this._currentInvokes.length = 0;
            this.checkRuning();
        }

        protected function checkRuning():void
        {
            var _local_1:Vector.<InvokeItem>;
            if (this._buffInvokes.length == 0){
                this._timer.stop();
            } else {
                _local_1 = this._currentInvokes;
                this._currentInvokes = this._buffInvokes;
                this._buffInvokes = _local_1;
            };
        }

        public function setDelay(_arg_1:int):void
        {
            this._timer.delay = _arg_1;
        }

        public function addInvoke(_arg_1:CFunction, _arg_2:int=0):void
        {
            var _local_3:Vector.<InvokeItem>;
            if (_arg_1 != null){
                _local_3 = this._buffInvokes;
                _local_3.splice(0, 0, new InvokeItem(_arg_1, _arg_2, getTimer()));
                if (!this._timer.running){
                    this._timer.start();
                };
            };
        }

        public function removeInvoke(_arg_1:CFunction):void
        {
            var _local_5:InvokeItem;
            if (_arg_1 == null){
                return;
            };
            var _local_2:Vector.<InvokeItem> = this._buffInvokes;
            var _local_3:int = _local_2.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                if (_local_5.func == _arg_1){
                    _local_2.splice(_local_4, 1);
                    return;
                };
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_77()
        {
        }


    }
}//package com.tencent.free.utils

import com.tencent.free.utils.CFunction;
import  ©init._SafeStr_78;

class InvokeItem 
{

    public var func:CFunction;
    public var delay:int;
    public var begin:int;
    public var once:Boolean;

    public function InvokeItem(_arg_1:CFunction, _arg_2:int, _arg_3:int, _arg_4:Boolean=true)
    {
        this.func = _arg_1;
        this.delay = _arg_2;
        this.begin = _arg_3;
        this.once = _arg_4;
    }

    public /*  ©init. */ function _SafeStr_78()
    {
    }


}

// _SafeStr_77 = " Schedule" (String#1469)
// _SafeStr_78 = " InvokeItem" (String#1472)


