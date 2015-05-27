// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.pool.Pool

package com.tencent.free.core.manager.pool
{
    import com.tencent.free.utils.DictionaryEx;
    import  ©init._SafeStr_23;

    public class Pool 
    {

        private var _maxNumber:int;
        private var _type:Class;
        private var _dicResource:DictionaryEx;

        public function Pool(_arg_1:Class, _arg_2:int, _arg_3:Boolean=false)
        {
            this._type = _arg_1;
            this._maxNumber = _arg_2;
            this._dicResource = new DictionaryEx(_arg_3);
        }

        public function getResource():Object
        {
            var _local_1:Object;
            var _local_2:Object;
            for (_local_2 in this._dicResource) {
                if (((_local_2) && ((this._dicResource[_local_2] == true)))){
                    this._dicResource[_local_2] = false;
                    _local_1 = _local_2;
                    break;
                };
            };
            if (!_local_1){
                if (this._dicResource.length < this._maxNumber){
                    _local_1 = new this._type();
                    this._dicResource[_local_1] = false;
                };
            };
            return (_local_1);
        }

        public function returnResource(_arg_1:Object):void
        {
            if (_arg_1){
                this._dicResource[_arg_1] = true;
            };
        }

        public /*  ©init. */ function _SafeStr_23()
        {
        }


    }
}//package com.tencent.free.core.manager.pool

// _SafeStr_23 = " Pool" (String#1385)


