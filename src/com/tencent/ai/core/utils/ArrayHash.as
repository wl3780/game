// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.ArrayHash

package com.tencent.ai.core.utils
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_1367;

    public class ArrayHash 
    {

        protected var m_sum:int;
        protected var m_array:Array;
        protected var m_hash:Dictionary;
        protected var m_index2Key:Array;
        protected var m_key2Index:Dictionary;
        protected var m_allowSameKey:Boolean;

        public function ArrayHash(_arg_1:Boolean=false)
        {
            this.m_allowSameKey = _arg_1;
            this.m_array = [];
            this.m_hash = new Dictionary();
            this.m_index2Key = [];
            this.m_key2Index = new Dictionary();
        }

        public function get length():uint
        {
            return (this.m_array.length);
        }

        public function get hash():Dictionary
        {
            return (this.m_hash);
        }

        public function get array():Array
        {
            return (this.m_array);
        }

        public function exist(_arg_1:Object):Boolean
        {
            return (Boolean(this.m_hash[_arg_1]));
        }

        public function push(_arg_1:Object, _arg_2:Object=null):uint
        {
            if (_arg_2 == null){
                _arg_2 = ("#key" + this.m_sum);
            };
            if (this.exist(_arg_2)){
                if (!this.m_allowSameKey){
                    throw (new Error("key 已存在。"));
                };
            };
            var _local_4 = this;
            var _local_5 = (_local_4.m_sum + 1);
            _local_4.m_sum = _local_5;
            var _local_3:uint = this.m_array.push(_arg_1);
            this.m_index2Key.push(_arg_2);
            this.m_hash[_arg_2] = _arg_1;
            return (_local_3);
        }

        public function pop():Object
        {
            var _local_1:Object = this.m_array.pop();
            var _local_2:Object = this.m_index2Key.pop();
            delete this.m_hash[_local_2];
            delete this.m_key2Index[_local_2];
            return (_local_1);
        }

        public function unshift(_arg_1:Object, _arg_2:Object=null):uint
        {
            if (_arg_2 == null){
                _arg_2 = ("#key" + this.m_sum);
            };
            if (this.exist(_arg_2)){
                if (!this.m_allowSameKey){
                    throw (new Error("key 已存在。"));
                };
            };
            var _local_3 = this;
            var _local_4 = (_local_3.m_sum + 1);
            _local_3.m_sum = _local_4;
            this.m_array.unshift(_arg_1);
            this.m_index2Key.unshift(_arg_2);
            this.m_hash[_arg_2] = _arg_1;
            return (this.m_array.length);
        }

        public function shift():Object
        {
            var _local_1:Object = this.m_array.shift();
            var _local_2:Object = this.m_index2Key.shift();
            delete this.m_hash[_local_2];
            delete this.m_key2Index[_local_2];
            return (_local_1);
        }

        private function refreshKey2Index():void
        {
            var _local_3:Object;
            var _local_1:int = this.m_index2Key.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                _local_3 = this.m_index2Key[_local_2];
                this.m_key2Index[_local_3] = _local_2;
                _local_2++;
            };
        }

        public function splice(_arg_1:int, _arg_2:uint):Array
        {
            var _local_7:Object;
            var _local_3:Array = this.m_array.splice(_arg_1, _arg_2);
            var _local_4:Array = this.m_index2Key.splice(_arg_1, _arg_2);
            var _local_5:int = _local_4.length;
            var _local_6:int;
            while (_local_6 < _local_5) {
                _local_7 = _local_4[_local_6];
                delete this.m_hash[_local_7];
                delete this.m_key2Index[_local_7];
                _local_6++;
            };
            return (_local_3);
        }

        public function addItemAt(_arg_1:Object, _arg_2:int, _arg_3:Object=null):void
        {
            if (_arg_3 == null){
                _arg_3 = ("#key" + this.m_sum);
            };
            if (this.exist(_arg_3)){
                if (!this.m_allowSameKey){
                    throw (new Error("key 已存在。"));
                };
            };
            var _local_4 = this;
            var _local_5 = (_local_4.m_sum + 1);
            _local_4.m_sum = _local_5;
            this.m_array.splice(_arg_2, 0, _arg_1);
            this.m_index2Key.splice(_arg_2, 0, _arg_3);
            this.m_hash[_arg_3] = _arg_1;
        }

        public function deleteItemBy(_arg_1:Object):void
        {
            if (!this.m_hash[_arg_1]){
                return;
            };
            this.refreshKey2Index();
            var _local_2:int = this.m_key2Index[_arg_1];
            delete this.m_hash[_arg_1];
            delete this.m_key2Index[_arg_1];
            this.m_array.splice(_local_2, 1);
            this.m_index2Key.splice(_local_2, 1);
        }

        public function toString():String
        {
            return (this.m_array.toString());
        }

        public function getItemAt(_arg_1:int):Object
        {
            return (this.m_array[_arg_1]);
        }

        public function getItemBy(_arg_1:Object):Object
        {
            return (this.m_hash[_arg_1]);
        }

        public function removeAll():void
        {
            this.m_array = [];
            this.m_hash = new Dictionary();
            this.m_index2Key = [];
            this.m_key2Index = new Dictionary();
        }

        public /*  ©init. */ function _SafeStr_1367()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1367 = " ArrayHash" (String#14582)


