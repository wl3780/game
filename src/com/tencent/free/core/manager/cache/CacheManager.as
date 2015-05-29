package com.tencent.free.core.manager.cache
{

    public class CacheManager 
    {

        protected var _memory:CacheBufferMemory;
        protected var _refuse:CacheBufferRefuse;

        public function CacheManager()
        {
            _memory = new CacheBufferMemory();
            _refuse = new CacheBufferRefuse();
        }

        public function addCache(key:*, _arg_2:ICache):Boolean
        {
            if (null == this.getCache(key)) {
                return _refuse.addCache(key, _arg_2);
            }
            return false;
        }

        public function removeCache(key:*):void
        {
            _memory.removeCache(key);
            _refuse.removeCache(key);
        }

        public function getCache(key:*, hash:String=null, func:Function=null):ICache
        {
            var ret:ICache = _memory.getCache(key, hash, func) || _refuse.getCache(key, hash, func);
            return ret;
        }

        public function addCacheReference(key:*, item:*):Boolean
        {
            var isOK:Boolean = null != key && null != item;
            if (isOK) {
	            var res:ICache = _memory.getCache(key);
	            var buffer:ICacheBuffer = null;
                if (res != null) {
                    buffer = _memory;
                } else {
                    res = _refuse.getCache(key);
                    if (res != null) {
                        buffer = _refuse;
                    }
                }
                if (null != res) {
                    if (buffer != _memory) {
                        buffer.removeCache(key);
                        _memory.addCache(key, res);
                    }
                    isOK = _memory.addCacheReference(key, item);
                } else {
                    isOK = false;
                }
            }
            return isOK;
        }

        public function removeCacheReference(key:*, item:Object):void
        {
            if (null != key && null != item) {
	            var res:ICache = _memory.getCache(key);
                if (null != res) {
                    _memory.removeCacheReference(key, item);
                    if (_memory.getCacheReferenceNumber(key) == 0) {
                        _memory.removeCache(key);
                        _refuse.addCache(key, res);
                    }
                }
            }
        }

        public function clearRefuse():void
        {
            _refuse.removeAllCache();
        }

    }
}
