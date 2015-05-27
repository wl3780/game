package com.tencent.ai.core.manager.key
{

    public class KeyDef 
    {

        public static const WHATEVER:int = 0;
        public static const K_DOWN:int = 1;
        public static const K_UP:int = 2;
        public static const KEY_UP_CODE_OFFSET:int = 10000;

        public var keyType:int = 1;
        public var keyCode:int = 0;
        public var label:String = "说明此键值的作用";
        public var keyCodes:Array = null;

        public function KeyDef(keyType:int=1, keyCode:int=0, keyCodes:Array=null)
        {
            this.keyType = keyType;
            this.keyCode = keyCode + (keyType == K_UP ? KEY_UP_CODE_OFFSET : 0);
            this.keyCodes = keyCodes;
        }

        public function matchKey(keyType:int, keyCode:int):Boolean
        {
            if (this.keyType == WHATEVER) {
                return this.keyCode == keyCode || (this.keyCode + KEY_UP_CODE_OFFSET) == keyCode;
            }
            return this.keyType == keyType && this.keyCode == keyCode;
        }

    }
}
