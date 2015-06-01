package com.tencent.free.core.manager.task
{
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.manager.content.Content;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.utils.DictionaryEx;

    public class Task extends Content implements ITask 
    {
        protected var _res;
        protected var _referenceList:DictionaryEx;

        private var _logHeader:String;

        public function Task(taskKey:*)
        {
			super();
            _key = taskKey;
            _referenceList = new DictionaryEx(true);
        }

        public function start(res:*):void
        {
            _res = res;
            this.updateTaskInfo();
        }

        public function end()
        {
            var tmp:* = _res;
            _res = null;
            return tmp;
        }

        public function addLoader(loader:ILoader):void
        {
            _referenceList[loader] = this;
            this.updateTaskInfo();
        }

        public function removeLoader(loader:ILoader):void
        {
            delete _referenceList[loader];
            this.updateTaskInfo();
        }

        public function referenceLength():int
        {
            return (_referenceList.length);
        }

        protected function updateTaskInfo():void
        {
            for (var loader:Object in _referenceList) {
                this.updateInfo(loader as ILoader);
            }
        }

        protected function updateInfo(loader:ILoader):void
        {
            if (_priority > loader.priority) {
                _priority = loader.priority;
            }
            _url = loader.url;
            _hash = loader.hash;
            _checkHash = loader.checkHash;
            if (_expireTime < loader.expireTime) {
                _expireTime = loader.expireTime;
            }
            if (!_saveSO) {
                _saveSO = loader.saveSO;
            }
            if (_retryTimes < loader.retryTimes) {
                _retryTimes = loader.retryTimes;
            }
            _remainingTime = _expireTime;
        }

        protected function onTaskEnd():void
        {
            var event:TaskEvent = new TaskEvent(TaskEvent.TASK_END);
            event.key = _key;
            this.dispatchEvent(event);
        }

        protected function retry():Boolean
        {
            if (_retryTimes > 0) {
                var tmpThis = this;
                var times:int = tmpThis._retryTimes - 1;
                tmpThis._retryTimes = times;
                return true;
            }
            return false;
        }

    }
}
