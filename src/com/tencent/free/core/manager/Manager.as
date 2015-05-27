// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.Manager

package com.tencent.free.core.manager
{
    import com.tencent.free.core.manager.cache.CacheManager;
    import com.tencent.free.core.manager.task.TaskFlow;
    import flash.utils.Dictionary;
    import com.tencent.free.core.manager.task.ITask;
    import com.tencent.free.core.manager.cache.ICache;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.core.manager.task.Task;
    import com.tencent.free.core.manager.content.IContent;
    import  ©init._SafeStr_27;

    public class Manager implements IManager 
    {

        protected var _cacheManager:CacheManager;
        protected var _taskFlow:TaskFlow;
        protected var _taskType:Class;
        protected var dicReference:Dictionary;

        public function Manager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            this._taskFlow = new TaskFlow(_arg_2, _arg_3);
            this._taskFlow.start();
            this._cacheManager = new CacheManager();
            this._taskType = _arg_1;
        }

        public function request(_arg_1:ILoader):Object
        {
            var _local_2:ITask;
            var _local_3:ICache;
            if (((_arg_1) && (_arg_1.key))){
                _local_3 = this._cacheManager.getCache(_arg_1.key);
                _local_2 = this._taskFlow.getTask(_arg_1.key);
                if (!_local_2){
                    if (_local_3){
                        _local_2 = (_local_3 as ITask);
                        if (_local_3.isLoaded()){
                            _local_2.start(null);
                        } else {
                            this._taskFlow.addTask(_local_2);
                        };
                    } else {
                        _local_2 = new this._taskType(_arg_1.key);
                        this._taskFlow.addTask(_local_2);
                        this._cacheManager.addCache(_arg_1.key, (_local_2 as ICache));
                    };
                };
                this._cacheManager.addCacheReference(_arg_1.key, _arg_1);
                _local_2.addLoader(_arg_1);
            };
            return (_local_2);
        }

        public function getContent(_arg_1:ILoader):IContent
        {
            var _local_2:Task = (this._cacheManager.getCache(_arg_1.key) as Task);
            if (!_local_2){
                _local_2 = new this._taskType(_arg_1.key);
                this._cacheManager.addCache(_arg_1.key, _local_2);
            };
            _local_2.addLoader(_arg_1);
            this._cacheManager.addCacheReference(_arg_1.key, _arg_1);
            return (_local_2);
        }

        public function release(_arg_1:ILoader):void
        {
            var _local_2:ITask;
            if (((_arg_1) && (_arg_1.key))){
                this._cacheManager.removeCacheReference(_arg_1.key, _arg_1);
                _local_2 = this._taskFlow.getTask(_arg_1.key);
                if (_local_2){
                    _local_2.removeLoader(_arg_1);
                    if (_local_2.referenceLength() == 0){
                        this._taskFlow.removeTask(_local_2.key);
                    };
                };
            };
        }

        public function clearAllCache():void
        {
            this._cacheManager.clearRefuse();
        }

        public /*  ©init. */ function _SafeStr_27()
        {
        }


    }
}//package com.tencent.free.core.manager

// _SafeStr_27 = " Manager" (String#1418)


