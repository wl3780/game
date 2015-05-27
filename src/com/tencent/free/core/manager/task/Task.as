// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.task.Task

package com.tencent.free.core.manager.task
{
    import com.tencent.free.core.manager.content.Content;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.core.events.TaskEvent;
    import  ©init._SafeStr_25;

    public class Task extends Content implements ITask 
    {

        private var _logHeader:String;
        protected var _res;
        protected var _referenceList:DictionaryEx;

        public function Task(_arg_1:*)
        {
            this._key = _arg_1;
            this._referenceList = new DictionaryEx(true);
        }

        public function start(_arg_1:*):void
        {
            this._res = _arg_1;
            this.updateTaskInfo();
        }

        public function end()
        {
            var _local_1:* = this._res;
            this._res = null;
            return (_local_1);
        }

        public function addLoader(_arg_1:ILoader):void
        {
            this._referenceList[_arg_1] = this;
            this.updateTaskInfo();
        }

        public function removeLoader(_arg_1:ILoader):void
        {
            delete this._referenceList[_arg_1];
            this.updateTaskInfo();
        }

        public function referenceLength():int
        {
            return (this._referenceList.length);
        }

        protected function updateTaskInfo():void
        {
            var _local_1:Object;
            var _local_2:ILoader;
            for (_local_1 in this._referenceList) {
                _local_2 = (_local_1 as ILoader);
                this.updateInfo(_local_2);
            };
        }

        protected function updateInfo(_arg_1:ILoader):void
        {
            if (this._priority > _arg_1.priority){
                this._priority = _arg_1.priority;
            };
            this._url = _arg_1.url;
            this._hash = _arg_1.hash;
            this._checkHash = _arg_1.checkHash;
            if (this._expireTime < _arg_1.expireTime){
                this._expireTime = _arg_1.expireTime;
            };
            if (!this._saveSO){
                this._saveSO = _arg_1.saveSO;
            };
            if (this._retryTimes < _arg_1.retryTimes){
                this._retryTimes = _arg_1.retryTimes;
            };
            this._remainingTime = this._expireTime;
        }

        protected function onTaskEnd():void
        {
            var _local_1:TaskEvent = new TaskEvent(TaskEvent.TASK_END);
            _local_1.key = this._key;
            this.dispatchEvent(_local_1);
        }

        protected function retry():Boolean
        {
            if (_retryTimes > 0){
                var _local_1 = this;
                var _local_2 = (_local_1._retryTimes - 1);
                _local_1._retryTimes = _local_2;
                return (true);
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_25()
        {
        }


    }
}//package com.tencent.free.core.manager.task

// _SafeStr_25 = " Task" (String#1361)


