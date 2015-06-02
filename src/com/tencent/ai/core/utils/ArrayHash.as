package com.tencent.ai.core.utils
{
    import flash.utils.Dictionary;

    public class ArrayHash 
    {

        protected var m_sum:int;
        protected var m_array:Array;
        protected var m_hash:Dictionary;
        protected var m_index2Key:Array;
        protected var m_key2Index:Dictionary;
        protected var m_allowSameKey:Boolean;

        public function ArrayHash(weakKeys:Boolean=false)
        {
            this.m_allowSameKey = weakKeys;
            this.m_array = [];
            this.m_hash = new Dictionary();
            this.m_index2Key = [];
            this.m_key2Index = new Dictionary();
        }

        public function get length():uint
        {
            return this.m_array.length;
        }

        public function get hash():Dictionary
        {
            return this.m_hash;
        }

        public function get array():Array
        {
            return this.m_array;
        }

        public function exist(key:Object):Boolean
        {
            return Boolean(this.m_hash[key]);
        }

        public function push(value:Object, key:Object=null):uint
        {
            if (key == null) {
                key = "#key" + this.m_sum;
            }
            if (this.exist(key)) {
                if (!this.m_allowSameKey) {
                    throw new Error("key 已存在。");
                }
            }
            var tmpThis:* = this;
            var tmpSum:int = tmpThis.m_sum + 1;
            tmpThis.m_sum = tmpSum;
            var len:uint = this.m_array.push(value);
            this.m_index2Key.push(key);
            this.m_hash[key] = value;
            return len;
        }

        public function pop():Object
        {
            var value:Object = this.m_array.pop();
            var key:Object = this.m_index2Key.pop();
            delete this.m_hash[key];
            delete this.m_key2Index[key];
            return value;
        }

        public function unshift(value:Object, key:Object=null):uint
        {
            if (key == null) {
                key = "#key" + this.m_sum;
            }
            if (this.exist(key)) {
                if (!this.m_allowSameKey) {
                    throw new Error("key 已存在。");
                }
            }
            var tmpThis:* = this;
            var tmpSum:int = tmpThis.m_sum + 1;
            tmpThis.m_sum = tmpSum;
            this.m_array.unshift(value);
            this.m_index2Key.unshift(key);
            this.m_hash[key] = value;
            return this.m_array.length;
        }

        public function shift():Object
        {
            var value:Object = this.m_array.shift();
            var key:Object = this.m_index2Key.shift();
            delete this.m_hash[key];
            delete this.m_key2Index[key];
            return value;
        }

        private function refreshKey2Index():void
        {
            var len:int = this.m_index2Key.length;
            var idx:int;
            while (idx < len) {
	            var key:Object = this.m_index2Key[idx];
                this.m_key2Index[key] = idx;
                idx++;
            }
        }

        public function splice(startIndex:int, deleteCount:uint):Array
        {
            var values:Array = this.m_array.splice(startIndex, deleteCount);
            var keys:Array = this.m_index2Key.splice(startIndex, deleteCount);
            var len:int = keys.length;
            var idx:int;
            while (idx < len) {
	            var key:Object = keys[idx];
                delete this.m_hash[key];
                delete this.m_key2Index[key];
                idx++;
            }
            return values;
        }

        public function addItemAt(value:Object, startIndex:int, key:Object=null):void
        {
            if (key == null) {
                key = "#key" + this.m_sum;
            }
            if (this.exist(key)) {
                if (!this.m_allowSameKey) {
                    throw new Error("key 已存在。");
                }
            }
            var tmpThis:* = this;
            var tmpSum:int = tmpThis.m_sum + 1;
            tmpThis.m_sum = tmpSum;
            this.m_array.splice(startIndex, 0, value);
            this.m_index2Key.splice(startIndex, 0, key);
            this.m_hash[key] = value;
        }

        public function deleteItemBy(key:Object):void
        {
            if (!this.m_hash[key]) {
                return;
            }
            this.refreshKey2Index();
            var idx:int = this.m_key2Index[key];
            delete this.m_hash[key];
            delete this.m_key2Index[key];
            this.m_array.splice(idx, 1);
            this.m_index2Key.splice(idx, 1);
        }

        public function toString():String
        {
            return this.m_array.toString();
        }

        public function getItemAt(idx:int):Object
        {
            return this.m_array[idx];
        }

        public function getItemBy(key:Object):Object
        {
            return this.m_hash[key];
        }

        public function removeAll():void
        {
            this.m_array = [];
            this.m_hash = new Dictionary();
            this.m_index2Key = [];
            this.m_key2Index = new Dictionary();
        }

    }
}
