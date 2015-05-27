// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.DictionaryEx

package com.tencent.free.utils
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_70;

    public dynamic class DictionaryEx extends Dictionary 
    {

        public function DictionaryEx(_arg_1:Boolean=false)
        {
            super(_arg_1);
        }

        public static function getKeyByValue(_arg_1:Object, _arg_2:*)
        {
            var _local_3:*;
            for (_local_3 in _arg_1) {
                if (_arg_1[_local_3] === _arg_2){
                    return (_local_3);
                };
            };
            return (null);
        }

        public static function getAllKeyByValue(_arg_1:Object, _arg_2:*):Array
        {
            var _local_4:*;
            var _local_3:Array = [];
            for (_local_4 in _arg_1) {
                if (_arg_1[_local_4] === _arg_2){
                    _local_3.push(_local_4);
                };
            };
            return (_local_3);
        }

        public static function hasValue(_arg_1:Object, _arg_2:*):Boolean
        {
            return (Boolean(DictionaryEx.getKeyByValue(_arg_1, _arg_2)));
        }

        public static function getLength(_arg_1:Object):uint
        {
            var _local_3:*;
            var _local_2:uint;
            for each (_local_3 in _arg_1) {
                _local_2++;
            };
            return (_local_2);
        }


        public function get length():uint
        {
            var _local_2:*;
            var _local_1:uint;
            for each (_local_2 in this) {
                _local_1++;
            };
            return (_local_1);
        }

        public function getAllValues():Array
        {
            var _local_2:*;
            var _local_1:Array = [];
            for each (_local_2 in this) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        public function getAllKeys():Array
        {
            var _local_2:*;
            var _local_1:Array = [];
            for (_local_2 in this) {
                _local_1.push(_local_2);
            };
            return (_local_2);
        }

        public function clear():void
        {
            var _local_1:*;
            for (_local_1 in this) {
                delete this[_local_1];
            };
        }

        public /*  ©init. */ function _SafeStr_70()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_70 = " DictionaryEx" (String#1454)


