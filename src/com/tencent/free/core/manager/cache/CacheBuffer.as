// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.cache.CacheBuffer

package com.tencent.free.core.manager.cache
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_17;

    public class CacheBuffer implements ICacheBuffer 
    {

        protected var _dicCache:Dictionary;
        protected var _length:int;

        public function CacheBuffer()
        {
            this._dicCache = new Dictionary();
            this._length = 0;
        }

        public function addCache(_arg_1:*, _arg_2:ICache):Boolean
        {
            var _local_3 = !((null == _arg_2));
            if (((_local_3) && (!((_arg_1 == null))))){
                if (null == this._dicCache[_arg_1]){
                    this._length++;
                };
                this._dicCache[_arg_1] = _arg_2;
            };
            return (_local_3);
        }

        public function removeCache(_arg_1:*):void
        {
            if (((!((_arg_1 == null))) && (!((null == this._dicCache[_arg_1]))))){
                this._length--;
                delete this._dicCache[_arg_1];
            };
        }

        public function removeAllCache():void
        {
            this._length = 0;
            this._dicCache = new Dictionary();
        }

        public function getCache(_arg_1:*, _arg_2:*=null, _arg_3:Function=null):ICache
        {
            var _local_4:ICache;
            var _local_5:ICache;
            if (null != _arg_1){
                _local_5 = this._dicCache[_arg_1];
                if (null != _local_5){
                    if (null == _arg_3){
                        _local_4 = _local_5;
                    } else {
                        if (_local_5.check(_arg_3, _arg_2)){
                            _local_4 = _local_5;
                        };
                    };
                };
            };
            return (_local_4);
        }

        public /*  ©init. */ function _SafeStr_17()
        {
        }


    }
}//package com.tencent.free.core.manager.cache

// _SafeStr_17 = " CacheBuffer" (String#1400)


