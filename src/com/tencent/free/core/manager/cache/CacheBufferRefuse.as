// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.cache.CacheBufferRefuse

package com.tencent.free.core.manager.cache
{
    import com.tencent.free.utils.CFunction;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import  ©init._SafeStr_19;

    public class CacheBufferRefuse extends CacheBuffer 
    {

        private var _burnFunc:CFunction;
        private var _lastTime:int;
        private var _bStart:Boolean;
        private var _timer:Timer;

        public function CacheBufferRefuse()
        {
            this._timer = new Timer(1000);
            this._timer.addEventListener(TimerEvent.TIMER, this.burnCache);
            this._bStart = false;
        }

        override public function addCache(_arg_1:*, _arg_2:ICache):Boolean
        {
            var _local_3:Boolean = super.addCache(_arg_1, _arg_2);
            if (!this._bStart){
                this.startBurnCache();
            };
            return (_local_3);
        }

        override public function removeCache(_arg_1:*):void
        {
            super.removeCache(_arg_1);
            if (this._length == 0){
                this.stopBurnCache();
            };
        }

        override public function removeAllCache():void
        {
            var _local_1:*;
            var _local_2:*;
            for (_local_1 in this._dicCache) {
                _local_2 = this._dicCache[_local_1];
                _local_2.remainingTime = -1;
                if (_local_2.remainingTime < 0){
                    _local_2.release();
                };
            };
            super.removeAllCache();
            this.stopBurnCache();
        }

        protected function startBurnCache():void
        {
            if (!this._bStart){
                this._bStart = true;
                this._lastTime = getTimer();
                this._timer.start();
            };
        }

        protected function stopBurnCache():void
        {
            this._bStart = false;
            this._timer.stop();
        }

        protected function burnCache(_arg_1:TimerEvent):void
        {
            var _local_2:int = getTimer();
            this.burn((_local_2 - this._lastTime));
            this._lastTime = _local_2;
        }

        public function burn(_arg_1:int):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:Boolean;
            for (_local_3 in this._dicCache) {
                _local_4 = this._dicCache[_local_3];
                _local_4.remainingTime = (_local_4.remainingTime - _arg_1);
                if (_local_4.remainingTime < 0){
                    this._length--;
                    delete this._dicCache[_local_3];
                    _local_4.release();
                    _local_2 = true;
                };
            };
            if (_local_2){
            };
            if (this._length == 0){
                this.stopBurnCache();
            };
        }

        public /*  ©init. */ function _SafeStr_19()
        {
        }


    }
}//package com.tencent.free.core.manager.cache

// _SafeStr_19 = " CacheBufferRefuse" (String#1481)


