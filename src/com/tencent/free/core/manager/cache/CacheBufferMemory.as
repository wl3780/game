// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.cache.CacheBufferMemory

package com.tencent.free.core.manager.cache
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_18;

    public class CacheBufferMemory extends CacheBuffer 
    {

        private var _cacheReference:Dictionary;

        public function CacheBufferMemory()
        {
            this._cacheReference = new Dictionary();
        }

        public function addCacheReference(_arg_1:*, _arg_2:*):Boolean
        {
            var _local_4:Array;
            var _local_3:ICache = super.getCache(_arg_1);
            if (_local_3){
                _local_4 = this._cacheReference[_arg_1];
                if (null == _local_4){
                    _local_4 = new Array();
                    this._cacheReference[_arg_1] = _local_4;
                };
                if (-1 == _local_4.indexOf(_arg_2)){
                    _local_4.push(_arg_2);
                };
            };
            return (!((null == _local_3)));
        }

        public function removeCacheReference(_arg_1:*, _arg_2:*):void
        {
            var _local_3:Array;
            var _local_4:int;
            if (((!((null == _arg_1))) && (!((null == _arg_2))))){
                _local_3 = this._cacheReference[_arg_1];
                if (null != _local_3){
                    _local_4 = _local_3.indexOf(_arg_2);
                    if (-1 != _local_4){
                        _local_3.splice(_local_4, 1);
                    };
                };
            };
        }

        public function getCacheReferenceNumber(_arg_1:*):int
        {
            var _local_3:Array;
            var _local_2:int;
            if (null != _arg_1){
                _local_3 = this._cacheReference[_arg_1];
                if (null != _local_3){
                    _local_2 = _local_3.length;
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_18()
        {
        }


    }
}//package com.tencent.free.core.manager.cache

// _SafeStr_18 = " CacheBufferMemory" (String#1451)


