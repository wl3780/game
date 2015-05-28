package com.tencent.ai.core.manager.key
{
    import com.tencent.free.utils.CFunction;

    public class SimpleKeyFilter implements IKeyFilter 
    {

        protected var m_matchLen:int = 0;
        protected var m_handler:CFunction;
		/** KeyDef列表 */
        protected var m_keys:Array;
        protected var m_group:int;
        protected var m_checkType:int = 3;
        protected var m_isOrder:Boolean;

        public function SimpleKeyFilter(keys:Array, handler:CFunction, group:int=0, checkType:int=3, isOrder:Boolean=true)
        {
            this.m_keys = keys;
            this.m_handler = handler;
            this.m_group = group;
            this.m_checkType = checkType;
            this.m_isOrder = isOrder;
            this.m_matchLen = this.m_keys.length;
        }

        protected function checkKey(checkKeys:Vector.<int>):Boolean
        {
            var matchLen:int = this.m_matchLen - 1;
            var checkLen:int = checkKeys.length - 1;
            if (this.m_isOrder) {
                while (matchLen >= 0) {
                    if (this.m_keys[matchLen].keyCode != checkKeys[checkLen]) {
                        return false;
                    }
                    matchLen--;
                    checkLen--;
                }
            } else {
                while (matchLen >= 0) {
		            var subCode:int = this.m_keys[matchLen].keyCode;
                    if (checkKeys.indexOf(subCode) == -1) {
                        return false;
                    }
                    matchLen--;
                }
            }
            if (this.m_handler != null) {
                this.m_handler.invoke();
            }
            return true;
        }

        public function onKeyDown(keyArr:IKeyArray, keyBoard:IKeyboard):Boolean
        {
            if ((this.m_checkType & 1) != 0) {
	            var tmpKeys:Vector.<int> = this.m_checkType == KeyDef.K_DOWN ? keyArr.getDownKeys() : keyArr.getAllKeys();
                if (tmpKeys.length >= this.m_matchLen) {
                    return this.checkKey(tmpKeys);
                }
            }
            return false;
        }

        public function onKeyUp(keyArr:IKeyArray, keyBoard:IKeyboard):Boolean
        {
            if ((this.m_checkType & 2) != 0) {
	            var tmpKeys:Vector.<int> = this.m_checkType == KeyDef.K_UP ? keyArr.getUpKeys() : keyArr.getAllKeys();
                if (tmpKeys.length >= this.m_matchLen) {
                    return this.checkKey(tmpKeys);
                }
            }
            return false;
        }

        public function getGroupID():int
        {
            return this.m_group;
        }
        public function setGroupID(value:int):void
        {
            this.m_group = value;
        }

        public function getMatchLen():int
        {
            return this.m_matchLen;
        }

        public function getCheckType():int
        {
            return this.m_checkType;
        }

        public function newHandler(handler:Function, target:Object):void
        {
            if (this.m_handler == null) {
                return;
            }
            this.m_handler.handler = handler;
            this.m_handler.target = target;
        }

        public function clearHandler(target:Object=null):void
        {
            if (this.m_handler == null) {
                return;
            }
            if (target == null || this.m_handler.target == target) {
                this.m_handler.target = null;
                this.m_handler.handler = null;
            }
        }

        public function getHandler():CFunction
        {
            return this.m_handler;
        }

        public function invokeHandler():void
        {
            if (this.m_handler == null) {
                return;
            }
            this.m_handler.invoke();
        }

    }
}
