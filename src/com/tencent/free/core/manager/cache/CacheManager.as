// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.cache.CacheManager

package com.tencent.free.core.manager.cache
{
    import  ©init._SafeStr_20;

    public class CacheManager 
    {

        protected var _memory:CacheBufferMemory;
        protected var _refuse:CacheBufferRefuse;

        public function CacheManager()
        {
            this._memory = new CacheBufferMemory();
            this._refuse = new CacheBufferRefuse();
        }

        public function addCache(_arg_1:*, _arg_2:ICache):Boolean
        {
            if (null == this.getCache(_arg_1)){
                return (this._refuse.addCache(_arg_1, _arg_2));
            };
            return (false);
        }

        public function removeCache(_arg_1:*):void
        {
            this._memory.removeCache(_arg_1);
            this._refuse.removeCache(_arg_1);
        }

        public function getCache(_arg_1:*, _arg_2:String=null, _arg_3:Function=null):ICache
        {
            var _local_4:ICache;
            _local_4 = ((this._memory.getCache(_arg_1, _arg_2, _arg_3)) || (this._refuse.getCache(_arg_1, _arg_2, _arg_3)));
            return (_local_4);
        }

        public function addCacheReference(_arg_1:*, _arg_2:*):Boolean
        {
            var _local_4:ICache;
            var _local_5:ICacheBuffer;
            var _local_3:Boolean = ((!((null == _arg_1))) && (!((null == _arg_2))));
            if (_local_3){
                _local_4 = null;
                _local_5 = null;
                _local_4 = this._memory.getCache(_arg_1);
                if (_local_4 != null){
                    _local_5 = this._memory;
                } else {
                    _local_4 = this._refuse.getCache(_arg_1);
                    if (_local_4 != null){
                        _local_5 = this._refuse;
                    };
                };
                if (null != _local_4){
                    if (_local_5 != this._memory){
                        _local_5.removeCache(_arg_1);
                        this._memory.addCache(_arg_1, _local_4);
                    };
                    _local_3 = this._memory.addCacheReference(_arg_1, _arg_2);
                } else {
                    _local_3 = false;
                };
            };
            return (_local_3);
        }

        public function removeCacheReference(_arg_1:*, _arg_2:Object):void
        {
            var _local_3:ICache;
            if (((!((null == _arg_1))) && (!((null == _arg_2))))){
                _local_3 = this._memory.getCache(_arg_1);
                if (null != _local_3){
                    this._memory.removeCacheReference(_arg_1, _arg_2);
                    if (this._memory.getCacheReferenceNumber(_arg_1) == 0){
                        this._memory.removeCache(_arg_1);
                        this._refuse.addCache(_arg_1, _local_3);
                    };
                };
            };
        }

        public function clearRefuse():void
        {
            this._refuse.removeAllCache();
        }

        public /*  ©init. */ function _SafeStr_20()
        {
        }


    }
}//package com.tencent.free.core.manager.cache

// _SafeStr_20 = " CacheManager" (String#1364)


