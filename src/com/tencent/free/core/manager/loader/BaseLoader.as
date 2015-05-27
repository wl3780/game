// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.loader.BaseLoader

package com.tencent.free.core.manager.loader
{
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.manager.IManager;
    import com.tencent.free.core.manager.task.Priority;
    import com.tencent.free.utils.FileLenUtil;
    import  ©init._SafeStr_22;

    public class BaseLoader implements ILoader 
    {

        public static var defaultExpireTime:int = (1000 * 3);//3000

        private var _logHeader:String;
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

        public function BaseLoader(_arg_1:String, _arg_2:IManager)
        {
            this._manager = _arg_2;
            this._key = _arg_1;
            if (((!(this._url)) || ((this._url.length == 0)))){
                this._url = (this._key as String);
            };
            this._priority = Priority.PERIORITY_NORMAL;
            this._expireTime = defaultExpireTime;
            this._saveSO = false;
            this._retryTimes = 3;
            this._hash = "";
            this._checkHash = FileLenUtil.checkBytes;
            this._content = this._manager.getContent(this);
        }

        public function get loadInfo():Object
        {
            return (this._loadInfo);
        }

        public function load():void
        {
            this._manager.request(this);
        }

        public function unload():void
        {
            this._manager.release(this);
            this._loadInfo = null;
            this._key = null;
            this._content = null;
        }

        public function reset(_arg_1:String):void
        {
            this.unload();
            this._key = _arg_1;
            this._content = this._manager.getContent(this);
        }

        public function set key(_arg_1:Object):void
        {
            this._key = _arg_1;
        }

        public function get key():Object
        {
            return (this._key);
        }

        public function get content():IContent
        {
            return (this._content);
        }

        public function set priority(_arg_1:int):void
        {
            this._priority = _arg_1;
        }

        public function get priority():int
        {
            return (this._priority);
        }

        public function set hash(_arg_1:String):void
        {
            this._hash = _arg_1;
        }

        public function get hash():String
        {
            return (this._hash);
        }

        public function set checkHash(_arg_1:Function):void
        {
            this._checkHash = _arg_1;
        }

        public function get checkHash():Function
        {
            return (this._checkHash);
        }

        public function get url():String
        {
            return (this._url);
        }

        public function set url(_arg_1:String):void
        {
            this._url = _arg_1;
        }

        public function get expireTime():int
        {
            return (this._expireTime);
        }

        public function set expireTime(_arg_1:int):void
        {
            this._expireTime = _arg_1;
        }

        public function get saveSO():Boolean
        {
            return (this._saveSO);
        }

        public function set saveSO(_arg_1:Boolean):void
        {
            this._saveSO = _arg_1;
        }

        public function get retryTimes():int
        {
            return (this._retryTimes);
        }

        public function set retryTimes(_arg_1:int):void
        {
            this._retryTimes = this.retryTimes;
        }

        public /*  ©init. */ function _SafeStr_22()
        {
        }


    }
}//package com.tencent.free.core.manager.loader

// _SafeStr_22 = " BaseLoader" (String#1349)


