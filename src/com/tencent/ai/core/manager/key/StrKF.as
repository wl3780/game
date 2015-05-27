package com.tencent.ai.core.manager.key
{
    import com.tencent.free.utils.CFunction;
    
    import flash.utils.Dictionary;

    public class StrKF extends SimpleKeyFilter 
    {

        private static var __char_dict:Dictionary = new Dictionary();
        private static var __interval_char:String = "_";
        private static var __break_char:String = ";";

        protected var m_source:String = "";
        protected var m_processIndex:int = 0;
        protected var m_checkKeyDowns:Vector.<int>;

        public function StrKF(_arg_1:String, _arg_2:CFunction, _arg_3:int=0, _arg_4:int=3)
        {
            super(this.generate(_arg_1), _arg_2, _arg_3, _arg_4);
        }

        public static function addChar(char:String, code:int):void
        {
            __char_dict[char.toLowerCase()] = code;
        }

        public static function removeChar(char:String):void
        {
            delete __char_dict[char.toLowerCase()];
        }

        public static function getCode(char:String):int
        {
            return __char_dict[char.toLowerCase()];
        }


        protected function generateCheckKeyDowns(_arg_1:String):Boolean
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            if (_arg_1.indexOf("|") != -1){
                _local_2 = _arg_1.split("|");
                this.m_source = _local_2[0];
                _local_3 = _local_2[1].split(",");
                this.m_checkKeyDowns = new Vector.<int>();
                _local_4 = 0;
                while (_local_4 < _local_3.length) {
                    _local_5 = getCode(_local_3[_local_4]);
                    if (_local_5 != 0){
                        this.m_checkKeyDowns.push(_local_5);
                    };
                    _local_4++;
                };
                return (true);
            };
            return (false);
        }

        protected function generate(_arg_1:String):Array
        {
            if (!this.generateCheckKeyDowns(_arg_1)){
                this.m_source = _arg_1;
            };
            var _local_2:Array = [];
            var _local_3:KeyDef;
            this.m_processIndex = 0;
            while ((_local_3 = this.processOneKey()) != null) {
                _local_2.push(_local_3);
            };
            return (_local_2);
        }

        protected function processOneKey():KeyDef
        {
            if (this.m_processIndex >= this.m_source.length){
                return (null);
            };
            var _local_1:String = this.m_source.charAt(this.m_processIndex);
            this.m_processIndex++;
            var _local_2:int = getCode(_local_1);
            if (_local_2 == 0){
                return (this.processOneKey());
            };
            var _local_3:int = ((this.isKD(_local_1)) ? KeyDef.K_DOWN : KeyDef.K_UP);
            return (new KeyDef(_local_3, _local_2));
        }

        protected function isKD(_arg_1:String):Boolean
        {
            return ((_arg_1.toLowerCase() == _arg_1));
        }

        protected function checkKeysDown(_arg_1:IKeyboard):Boolean
        {
            if ((((this.m_checkKeyDowns == null)) || ((this.m_checkKeyDowns.length == 0)))){
                return (true);
            };
            var _local_2:int = (this.m_checkKeyDowns.length - 1);
            while (_local_2 >= 0) {
                if (!_arg_1.isKeyDown(this.m_checkKeyDowns[_local_2])){
                    return (false);
                };
                _local_2--;
            };
            return (true);
        }

        public function getSource():String
        {
            return (this.m_source);
        }

        override public function onKeyDown(_arg_1:IKeyArray, _arg_2:IKeyboard):Boolean
        {
            if (!this.checkKeysDown(_arg_2)){
                return (false);
            };
            return (super.onKeyDown(_arg_1, _arg_2));
        }

        override public function onKeyUp(_arg_1:IKeyArray, _arg_2:IKeyboard):Boolean
        {
            if (!this.checkKeysDown(_arg_2)){
                return (false);
            };
            return (super.onKeyUp(_arg_1, _arg_2));
        }

    }
}
