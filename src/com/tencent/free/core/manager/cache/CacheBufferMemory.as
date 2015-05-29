package com.tencent.free.core.manager.cache
{
    import flash.utils.Dictionary;

    public class CacheBufferMemory extends CacheBuffer 
    {

        private var _cacheReference:Dictionary;

        public function CacheBufferMemory()
        {
            _cacheReference = new Dictionary();
        }

        public function addCacheReference(key:*, item:*):Boolean
        {
            var res:ICache = super.getCache(key);
            if (res) {
	            var subList:Array = _cacheReference[key];
                if (null == subList) {
                    subList = new Array();
                    _cacheReference[key] = subList;
                }
                if (-1 == subList.indexOf(item)) {
                    subList.push(item);
                }
            }
            return null != res;
        }

        public function removeCacheReference(key:*, item:*):void
        {
            if (null != key && null != item) {
	            var subList:Array = _cacheReference[key];
                if (null != subList) {
		            var idx:int = subList.indexOf(item);
                    if (-1 != idx) {
                        subList.splice(idx, 1);
                    }
                }
            }
        }

        public function getCacheReferenceNumber(key:*):int
        {
            var num:int;
            if (null != key) {
	            var subList:Array = _cacheReference[key];
                if (null != subList) {
                    num = subList.length;
                }
            }
            return num;
        }

    }
}
