package com.tencent.ai.core.manager.key
{

    public class KeyGroup implements IKeyArray 
    {

        public var groupID:int;
		
        protected var filters:Vector.<IKeyFilter>;
        protected var downKeys:KeyCache;
        protected var upKeys:KeyCache;
        protected var allKeys:KeyCache;
		
        protected var currentKey:int;
        protected var idle:int;

        public function KeyGroup(groupID:int=0, idle:int=200)
        {
            this.groupID = groupID;
            this.filters = new Vector.<IKeyFilter>();
            this.downKeys = new KeyCache(idle);
            this.upKeys = new KeyCache(idle);
            this.allKeys = new KeyCache(idle);
            this.currentKey = 0;
            this.idle = idle;
        }

        public function addKeyFilter(filter:IKeyFilter):void
        {
            if (this.filters.indexOf(filter) != -1) {
                return;
            }
            var checkType:int = filter.getCheckType();
            var matchLen:int = filter.getMatchLen();
            var isFind:Boolean;
            var index:int = this.filters.length - 1;
            while (index >= 0) {
                if (this.filters[index].getMatchLen() <= matchLen) {
                    this.filters.splice(index+1, 0, filter);
                    isFind = true;
                    break;
                }
                index--;
            }
            if (!isFind) {
                this.filters.push(filter);
            }
            if (checkType == KeyDef.K_DOWN) {
                if (this.downKeys.maxLen < matchLen) {
                    this.downKeys.maxLen = matchLen;
                }
            } else if (checkType == KeyDef.K_UP) {
                if (this.upKeys.maxLen < matchLen){
                    this.upKeys.maxLen = matchLen;
                }
            } else {
                if (this.allKeys.maxLen < matchLen){
                    this.allKeys.maxLen = matchLen;
                }
            }
        }

        public function removeKeyFilter(filter:IKeyFilter):void
        {
            var index:int = this.filters.indexOf(filter);
            if (index != -1) {
                this.filters.splice(index, 1);
            }
        }

        public function onKeyDown(keyCode:int, time:int, keyBoard:IKeyboard):void
        {
            this.downKeys.put(keyCode, time);
            this.allKeys.put(keyCode, time);
            this.currentKey = keyCode;
            var index:int = this.filters.length - 1;
            while (index >= 0) {
                if (this.filters[index].onKeyDown(this, keyBoard)) {
					break;
				}
                index--;
            }
        }

        public function onKeyUp(keyCode:int, time:int, keyBoard:IKeyboard):void
        {
            keyCode = keyCode + KeyDef.KEY_UP_CODE_OFFSET;
            this.upKeys.put(keyCode, time);
            this.allKeys.put(keyCode, time);
            this.currentKey = keyCode;
            var index:int = this.filters.length - 1;
            while (index >= 0) {
                if (this.filters[index].onKeyUp(this, keyBoard)) {
					break;
				}
                index--;
            }
        }

        public function getKeyfilters():Vector.<IKeyFilter>
        {
            return this.filters;
        }

        public function getCurrentKey():int
        {
            return this.currentKey;
        }

        public function getUpKeys():Vector.<int>
        {
            return this.upKeys.keys;
        }

        public function getDownKeys():Vector.<int>
        {
            return this.downKeys.keys;
        }

        public function getAllKeys():Vector.<int>
        {
            return this.allKeys.keys;
        }

        public function reset(isClear:Boolean=false):void
        {
            this.upKeys.reset(isClear);
            this.downKeys.reset(isClear);
            this.allKeys.reset(isClear);
            this.currentKey = 0;
            if (isClear) {
                this.filters.length = 0;
            }
        }

    }
}

class KeyCache 
{

    public var maxLen:int;
    public var idle:int;
    public var lastTime:int;
    public var keys:Vector.<int>;

    public function KeyCache(idle:int=200, maxLen:int=5)
    {
        this.lastTime = 0;
        this.idle = idle;
        this.maxLen = maxLen;
        this.keys = new Vector.<int>();
    }

    public function put(currentKey:int, time:int):void
    {
        if ((time - this.lastTime) <= this.idle) {
            this.keys.push(currentKey);
            if (this.keys.length > this.maxLen){
                this.keys.shift();
            }
        } else {
            this.keys.length = 0;
            this.keys.push(currentKey);
        }
        this.lastTime = time;
    }

    public function reset(isClear:Boolean=false):void
    {
        this.lastTime = 0;
        this.keys.length = 0;
        if (isClear) {
            this.maxLen = 0;
        }
    }

}
