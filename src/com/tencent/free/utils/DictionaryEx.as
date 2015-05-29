package com.tencent.free.utils
{
    import flash.utils.Dictionary;

    public dynamic class DictionaryEx extends Dictionary 
    {

        public function DictionaryEx(weakKeys:Boolean=false)
        {
            super(weakKeys);
        }

        public static function getKeyByValue(map:Object, value:*)
        {
            for (var key:* in map) {
                if (map[key] === value) {
                    return key;
                }
            }
            return null;
        }

        public static function getAllKeyByValue(map:Object, value:*):Array
        {
            var ret:Array = [];
            for (var key:* in map) {
                if (map[key] === value) {
                    ret.push(key);
                }
            }
            return ret;
        }

        public static function hasValue(map:Object, value:*):Boolean
        {
            return Boolean(DictionaryEx.getKeyByValue(map, value));
        }

        public static function getLength(map:Object):uint
        {
            var len:uint;
            for each (var key:* in map) {
                len++;
            }
            return len;
        }


        public function get length():uint
        {
            var len:uint;
            for each (var key:* in this) {
                len++;
            }
            return len;
        }

        public function getAllValues():Array
        {
            var ret:Array = [];
            for each (var value:* in this) {
                ret.push(value);
            }
            return ret;
        }

        public function getAllKeys():Array
        {
            var ret:Array = [];
            for (var key:* in this) {
                ret.push(key);
            }
            return key;
        }

        public function clear():void
        {
            for (var key:* in this) {
                delete this[key];
            }
        }

    }
}
