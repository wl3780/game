// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.content.Content

package com.tencent.free.core.manager.content
{
    import flash.events.EventDispatcher;
    import com.tencent.free.core.manager.cache.ICache;
    import flash.events.IEventDispatcher;
    import  ©init._SafeStr_21;

    public class Content extends EventDispatcher implements IContent, ICache 
    {

        protected var _url:String;
        protected var _hash;
        protected var _checkHash:Function;
        protected var _key;
        protected var _priority:int = 9999;
        protected var _remainingTime:int;
        protected var _isLoaded:Boolean;
        protected var _expireTime:int;
        protected var _saveSO:Boolean = false;
        protected var _retryTimes:int;

        public function Content(_arg_1:IEventDispatcher=null)
        {
            super(_arg_1);
            this._isLoaded = false;
        }

        public function get key():Object
        {
            return (this._key);
        }

        public function get url():String
        {
            return (this._url);
        }

        public function get hash()
        {
            return (this._hash);
        }

        public function set priority(_arg_1:int):void
        {
            this._priority = _arg_1;
        }

        public function get priority():int
        {
            return (this._priority);
        }

        public function check(_arg_1:Function, _arg_2:*):Boolean
        {
            if (null != _arg_1){
                return (_arg_1(this, _arg_2));
            };
            return (true);
        }

        public function release():void
        {
        }

        public function get remainingTime():int
        {
            return (this._remainingTime);
        }

        public function set remainingTime(_arg_1:int):void
        {
            this._remainingTime = _arg_1;
        }

        public function isLoaded():Boolean
        {
            return (this._isLoaded);
        }

        public /*  ©init. */ function _SafeStr_21()
        {
        }


    }
}//package com.tencent.free.core.manager.content

// _SafeStr_21 = " Content" (String#1358)


