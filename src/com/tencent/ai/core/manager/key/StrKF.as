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

        public function StrKF(keyStr:String, handler:CFunction, group:int=0, checkType:int=3)
        {
            super(this.generate(keyStr), handler, group, checkType);
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


        protected function generateCheckKeyDowns(source:String):Boolean
        {
            if (source.indexOf("|") != -1) {
	            var arr:Array = source.split("|");
                this.m_source = arr[0];
	            var arr2:Array = arr[1].split(",");
                this.m_checkKeyDowns = new Vector.<int>();
	            var idx:int = 0;
                while (idx < arr2.length) {
		            var code:int = getCode(arr2[idx]);
                    if (code != 0) {
                        this.m_checkKeyDowns.push(code);
                    }
                    idx++;
                }
                return true;
            }
            return false;
        }

        protected function generate(keyStr:String):Array
        {
            if (!this.generateCheckKeyDowns(keyStr)) {
                this.m_source = keyStr;
            }
            var arr:Array = [];
            var ret:KeyDef;
            this.m_processIndex = 0;
            while ((ret = this.processOneKey()) != null) {
                arr.push(ret);
            }
            return arr;
        }

        protected function processOneKey():KeyDef
        {
            if (this.m_processIndex >= this.m_source.length){
                return null;
            }
            var char:String = this.m_source.charAt(this.m_processIndex);
            this.m_processIndex++;
            var code:int = getCode(char);
            if (code == 0) {
                return this.processOneKey();
            }
            var keyType:int = this.isKD(char) ? KeyDef.K_DOWN : KeyDef.K_UP;
            return new KeyDef(keyType, code);
        }

        protected function isKD(char:String):Boolean
        {
            return char.toLowerCase() == char;
        }

        protected function checkKeysDown(keyBoard:IKeyboard):Boolean
        {
            if (this.m_checkKeyDowns == null || this.m_checkKeyDowns.length == 0) {
                return true;
            }
            var idx:int = this.m_checkKeyDowns.length - 1;
            while (idx >= 0) {
                if (!keyBoard.isKeyDown(this.m_checkKeyDowns[idx])) {
                    return false;
                }
                idx--;
            }
            return true;
        }

        public function getSource():String
        {
            return (this.m_source);
        }

        override public function onKeyDown(keyArr:IKeyArray, keyBoard:IKeyboard):Boolean
        {
            if (!this.checkKeysDown(keyBoard)) {
                return false;
            }
            return super.onKeyDown(keyArr, keyBoard);
        }

        override public function onKeyUp(keyArr:IKeyArray, keyBoard:IKeyboard):Boolean
        {
            if (!this.checkKeysDown(keyBoard)) {
                return false;
            }
            return super.onKeyUp(keyArr, keyBoard);
        }

    }
}
