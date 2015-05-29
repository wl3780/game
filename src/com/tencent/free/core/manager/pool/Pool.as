package com.tencent.free.core.manager.pool
{
    import com.tencent.free.utils.DictionaryEx;

    public class Pool 
    {

        private var _maxNumber:int;
        private var _type:Class;
        private var _dicResource:DictionaryEx;

        public function Pool(type:Class, maxNum:int, weakKeys:Boolean=false)
        {
            _type = type;
            _maxNumber = maxNum;
            _dicResource = new DictionaryEx(weakKeys);
        }

        public function getResource():Object
        {
            var ret:Object;
            for (var res:Object in _dicResource) {
                if (res && _dicResource[res] == true) {
                    _dicResource[res] = false;
                    ret = res;
                    break;
                }
            }
            if (!ret) {
                if (_dicResource.length < _maxNumber) {
                    ret = new _type();
                    _dicResource[ret] = false;
                }
            }
            return ret;
        }

        public function returnResource(res:Object):void
        {
            if (res) {
                _dicResource[res] = true;
            }
        }

    }
}
