package com.tencent.free.core.manager.loader
{
    import com.tencent.free.core.manager.IManager;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.manager.task.Priority;
    import com.tencent.free.utils.FileLenUtil;

    public class BaseLoader implements ILoader 
    {

        public static var defaultExpireTime:int = (1000 * 3);//3000

        protected var _key:Object;
        protected var _content:IContent;
        protected var _manager:IManager;
        protected var _priority:int;
        protected var _hash:String;
        protected var _checkHash:Function;
        protected var _url:String;
        protected var _expireTime:int;
        protected var _saveSO:Boolean = false;
        protected var _retryTimes:int;
        protected var _loadInfo:Object;

        private var _logHeader:String;
		
        public function BaseLoader(loadKey:String, manager:IManager)
        {
            _key = loadKey;
            _manager = manager;
            if (!_url || _url.length == 0) {
                _url = _key as String;
            }
            _priority = Priority.PERIORITY_NORMAL;
            _expireTime = defaultExpireTime;
            _saveSO = false;
            _retryTimes = 3;
            _hash = "";
            _checkHash = FileLenUtil.checkBytes;
            _content = _manager.getContent(this);
        }

        public function get loadInfo():Object
        {
            return _loadInfo;
        }

        public function load():void
        {
            _manager.request(this);
        }

        public function unload():void
        {
            _manager.release(this);
            _loadInfo = null;
            _key = null;
            _content = null;
        }

        public function reset(newKey:String):void
        {
            this.unload();
            _key = newKey;
            _content = _manager.getContent(this);
        }

        public function set key(value:Object):void
        {
            _key = value;
        }
        public function get key():Object
        {
            return _key;
        }

        public function get content():IContent
        {
            return _content;
        }

        public function set priority(value:int):void
        {
            _priority = value;
        }
        public function get priority():int
        {
            return _priority;
        }

        public function set hash(value:String):void
        {
            _hash = value;
        }
        public function get hash():String
        {
            return _hash;
        }

        public function set checkHash(func:Function):void
        {
            _checkHash = func;
        }
        public function get checkHash():Function
        {
            return _checkHash;
        }

        public function get url():String
        {
            return _url;
        }
        public function set url(value:String):void
        {
            _url = value;
        }

        public function get expireTime():int
        {
            return _expireTime;
        }
        public function set expireTime(value:int):void
        {
            _expireTime = value;
        }

        public function get saveSO():Boolean
        {
            return _saveSO;
        }
        public function set saveSO(value:Boolean):void
        {
            _saveSO = value;
        }

        public function get retryTimes():int
        {
            return _retryTimes;
        }
        public function set retryTimes(value:int):void
        {
            _retryTimes = value;
        }

    }
}
