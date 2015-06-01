package com.tencent.free.core.manager.content
{
    import com.tencent.free.core.manager.cache.ICache;
    
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;

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

        public function Content(target:IEventDispatcher=null)
        {
            super(target);
            _isLoaded = false;
        }

        public function get key():Object
        {
            return _key;
        }

        public function get url():String
        {
            return _url;
        }

        public function get hash()
        {
            return _hash;
        }

        public function set priority(value:int):void
        {
            _priority = value;
        }
        public function get priority():int
        {
            return _priority;
        }

        public function check(func:Function, params:*):Boolean
        {
            if (null != func) {
                return func(this, params);
            }
            return true;
        }

        public function release():void
        {
        }

        public function get remainingTime():int
        {
            return _remainingTime;
        }
        public function set remainingTime(value:int):void
        {
            _remainingTime = value;
        }

        public function isLoaded():Boolean
        {
            return _isLoaded;
        }

    }
}
