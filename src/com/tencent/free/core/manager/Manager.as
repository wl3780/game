package com.tencent.free.core.manager
{
    import com.tencent.free.core.manager.cache.CacheManager;
    import com.tencent.free.core.manager.cache.ICache;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.core.manager.task.ITask;
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.free.core.manager.task.TaskFlow;
    
    import flash.utils.Dictionary;

    public class Manager implements IManager 
    {

        protected var dicReference:Dictionary;
        protected var _cacheManager:CacheManager;
        protected var _taskFlow:TaskFlow;
        protected var _taskType:Class;

        public function Manager(taskType:Class, taskNum:int=1, loader:Class=null)
        {
            _taskFlow = new TaskFlow(taskNum, loader);
            _taskFlow.start();
            _cacheManager = new CacheManager();
            _taskType = taskType;
        }

        public function request(_arg_1:ILoader):Object
        {
            var _local_2:ITask;
            var _local_3:ICache;
            if (((_arg_1) && (_arg_1.key))){
                _local_3 = _cacheManager.getCache(_arg_1.key);
                _local_2 = _taskFlow.getTask(_arg_1.key);
                if (!_local_2){
                    if (_local_3){
                        _local_2 = (_local_3 as ITask);
                        if (_local_3.isLoaded()){
                            _local_2.start(null);
                        } else {
                            _taskFlow.addTask(_local_2);
                        }
                    } else {
                        _local_2 = new _taskType(_arg_1.key);
                        _taskFlow.addTask(_local_2);
                        _cacheManager.addCache(_arg_1.key, (_local_2 as ICache));
                    }
                }
                _cacheManager.addCacheReference(_arg_1.key, _arg_1);
                _local_2.addLoader(_arg_1);
            }
            return (_local_2);
        }

        public function getContent(_arg_1:ILoader):IContent
        {
            var _local_2:Task = (_cacheManager.getCache(_arg_1.key) as Task);
            if (!_local_2){
                _local_2 = new _taskType(_arg_1.key);
                _cacheManager.addCache(_arg_1.key, _local_2);
            }
            _local_2.addLoader(_arg_1);
            _cacheManager.addCacheReference(_arg_1.key, _arg_1);
            return (_local_2);
        }

        public function release(_arg_1:ILoader):void
        {
            var _local_2:ITask;
            if (((_arg_1) && (_arg_1.key))){
                _cacheManager.removeCacheReference(_arg_1.key, _arg_1);
                _local_2 = _taskFlow.getTask(_arg_1.key);
                if (_local_2){
                    _local_2.removeLoader(_arg_1);
                    if (_local_2.referenceLength() == 0){
                        _taskFlow.removeTask(_local_2.key);
                    }
                }
            }
        }

        public function clearAllCache():void
        {
            _cacheManager.clearRefuse();
        }

    }
}
