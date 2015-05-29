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

        public function Manager(taskType:Class, taskNum:int=1, resType:Class=null)
        {
            _taskFlow = new TaskFlow(taskNum, resType);
            _taskFlow.start();
            _cacheManager = new CacheManager();
            _taskType = taskType;
        }

        public function request(loader:ILoader):Object
        {
            if (loader && loader.key) {
	            var cache:ICache = _cacheManager.getCache(loader.key);
	            var task:ITask = _taskFlow.getTask(loader.key);
                if (!task) {
                    if (cache) {
                        task = cache as ITask;
                        if (cache.isLoaded()) {
                            task.start(null);
                        } else {
                            _taskFlow.addTask(task);
                        }
                    } else {
                        task = new _taskType(loader.key);
                        _taskFlow.addTask(task);
                        _cacheManager.addCache(loader.key, task as ICache);
                    }
                }
                _cacheManager.addCacheReference(loader.key, loader);
                task.addLoader(loader);
            }
            return task;
        }

        public function getContent(loader:ILoader):IContent
        {
            var task:Task = _cacheManager.getCache(loader.key) as Task;
            if (!task) {
                task = new _taskType(loader.key);
                _cacheManager.addCache(loader.key, task);
            }
            task.addLoader(loader);
            _cacheManager.addCacheReference(loader.key, loader);
            return task;
        }

        public function release(loader:ILoader):void
        {
            if (loader && loader.key) {
                _cacheManager.removeCacheReference(loader.key, loader);
	            var task:ITask = _taskFlow.getTask(loader.key);
                if (task) {
                    task.removeLoader(loader);
                    if (task.referenceLength() == 0) {
                        _taskFlow.removeTask(task.key);
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
