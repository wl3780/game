package com.tencent.free.core.manager.cache
{
    import flash.utils.Dictionary;

    public class CacheBuffer implements ICacheBuffer 
    {

        protected var _dicCache:Dictionary;
        protected var _length:int;

        public function CacheBuffer()
        {
            _dicCache = new Dictionary();
            _length = 0;
        }

        public function addCache(key:*, res:ICache):Boolean
        {
            var b:Boolean = res != null;
            if (b && key != null) {
                if (_dicCache[key] != null) {
                    _length++;
                }
                _dicCache[key] = res;
            }
            return b;
        }

        public function removeCache(key:*):void
        {
            if (key != null && _dicCache[key] != null) {
                _length--;
                delete _dicCache[key];
            }
        }

        public function removeAllCache():void
        {
            _length = 0;
            _dicCache = new Dictionary();
        }

        public function getCache(key:*, hash:*=null, func:Function=null):ICache
        {
            var ret:ICache;
            if (null != key) {
	            var res:ICache = _dicCache[key];
                if (null != res) {
                    if (null == func) {
                        ret = res;
                    } else {
                        if (res.check(func, hash)) {
                            ret = res;
                        }
                    }
                }
            }
            return ret;
        }

    }
}
