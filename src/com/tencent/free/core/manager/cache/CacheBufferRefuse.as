package com.tencent.free.core.manager.cache
{
    import com.tencent.free.utils.CFunction;
    
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import flash.utils.getTimer;

    public class CacheBufferRefuse extends CacheBuffer 
    {

        private var _burnFunc:CFunction;
        private var _lastTime:int;
        private var _bStart:Boolean;
        private var _timer:Timer;

        public function CacheBufferRefuse()
        {
            _timer = new Timer(1000);
            _timer.addEventListener(TimerEvent.TIMER, this.burnCache);
            _bStart = false;
        }

        override public function addCache(key:*, res:ICache):Boolean
        {
            var b:Boolean = super.addCache(key, res);
            if (!_bStart) {
                this.startBurnCache();
            }
            return b;
        }

        override public function removeCache(key:*):void
        {
            super.removeCache(key);
            if (_length == 0) {
                this.stopBurnCache();
            }
        }

        override public function removeAllCache():void
        {
            for (var key:* in _dicCache) {
	            var res:* = _dicCache[key];
                res.remainingTime = -1;
                if (res.remainingTime < 0) {
                    res.release();
                }
            }
            super.removeAllCache();
            this.stopBurnCache();
        }

        protected function startBurnCache():void
        {
            if (!_bStart) {
                _bStart = true;
                _lastTime = getTimer();
                _timer.start();
            }
        }

        protected function stopBurnCache():void
        {
            _bStart = false;
            _timer.stop();
        }

        protected function burnCache(evt:TimerEvent):void
        {
            var nowTime:int = getTimer();
            this.burn(nowTime - _lastTime);
            _lastTime = nowTime;
        }

        public function burn(passTime:int):void
        {
            var flag:Boolean;
            for (var key:* in _dicCache) {
	            var res:* = _dicCache[key];
                res.remainingTime = res.remainingTime - passTime;
                if (res.remainingTime < 0) {
                    _length--;
                    delete _dicCache[key];
                    res.release();
                    flag = true;
                }
            }
            if (flag) {
            }
            if (_length == 0) {
                this.stopBurnCache();
            }
        }

    }
}
