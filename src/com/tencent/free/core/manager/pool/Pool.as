package com.tencent.free.core.manager.pool
{
    import com.tencent.free.utils.DictionaryEx;

    public class Pool 
    {

        private var _maxNumber:int;
        private var _type:Class;
        private var _dicResource:DictionaryEx;

        public function Pool(_arg_1:Class, _arg_2:int, _arg_3:Boolean=false)
        {
            _type = _arg_1;
            _maxNumber = _arg_2;
            _dicResource = new DictionaryEx(_arg_3);
        }

        public function getResource():Object
        {
            var _local_1:Object;
            var _local_2:Object;
            for (_local_2 in _dicResource) {
                if (((_local_2) && ((_dicResource[_local_2] == true)))){
                    _dicResource[_local_2] = false;
                    _local_1 = _local_2;
                    break;
                };
            };
            if (!_local_1){
                if (_dicResource.length < _maxNumber){
                    _local_1 = new _type();
                    _dicResource[_local_1] = false;
                };
            };
            return (_local_1);
        }

        public function returnResource(_arg_1:Object):void
        {
            if (_arg_1){
                _dicResource[_arg_1] = true;
            };
        }

    }
}
