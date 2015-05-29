package com.tencent.free.core.manager.task
{
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.manager.pool.Pool;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.utils.Schedule;

    public class TaskFlow 
    {

        protected var _arrTask:Array;
        protected var _taskPool:Array;
        protected var _resPool:Pool;
        protected var _bActive:Boolean;
        protected var _invokeState:Boolean;
        protected var _taskFunc:CFunction;
        protected var _simultaneousTask:int;
        protected var _resNumber:int;
        protected var _res:Class;

        public function TaskFlow(maxNum:int=10, resType:Class=null)
        {
            _arrTask = new Array();
            _taskPool = new Array();
            _resPool = new Pool(resType, maxNum, true);
            _bActive = false;
            _invokeState = false;
            _taskFunc = new CFunction(this.doTask);
            _simultaneousTask = maxNum;
            _res = resType;
            _resNumber = 0;
        }

        public function addTask(task:ITask):void
        {
            task.addEventListener(TaskEvent.TASK_END, this.onTaskEnd);
            _arrTask.push(task);
            if (_bActive && !_invokeState) {
                _invokeState = true;
                Schedule.addInvoke(_taskFunc, 1);
            }
        }

        public function removeTask(key:*):ITask
        {
            var task:ITask = this.removeTaskFormArr(key);
            if (!task) {
                task = this.removeTaskFormTaskPool(key);
            }
            return task;
        }

        protected function removeTaskFormArr(key:*):ITask
        {
            var ret:ITask;
            var idx:int = 0;
            while (idx < _arrTask.length) {
	            var task:ITask = _arrTask[idx];
                if (task && task.key == key) {
                    ret = task;
                    _arrTask.splice(idx, 1);
                    break;
                }
                idx++;
            }
            if (ret) {
                ret.removeEventListener(TaskEvent.TASK_END, this.onTaskEnd);
            }
            return ret;
        }

        protected function removeTaskFormTaskPool(key:*):ITask
        {
            var ret:ITask;
            var idx:int = 0;
            while (idx < _taskPool.length) {
	            var task:ITask = _taskPool[idx];
                if (task && task.key == key) {
                    ret = task;
                    _taskPool.splice(idx, 1);
                    if (_bActive && !_invokeState) {
                        _invokeState = true;
                        Schedule.addInvoke(_taskFunc, 1);
                    }
                    break;
                }
                idx++;
            }
            if (ret) {
                ret.removeEventListener(TaskEvent.TASK_END, this.onTaskEnd);
	            var res:* = ret.end();
                if (res != null) {
                    _resPool.returnResource(res);
                }
            }
            return ret;
        }

        public function getTask(key:*):ITask
        {
            var ret:ITask;
            var idx:int = 0;
            while (idx < _arrTask.length) {
	            var task:ITask = _arrTask[idx];
                if (task.key == key) {
                    ret = task;
                    break;
                }
                idx++;
            }
			
            if (ret == null) {
                idx = 0;
                while (idx < _taskPool.length) {
                    task = _taskPool[idx];
                    if (task.key == key) {
                        ret = task;
                        break;
                    }
                    idx++;
                }
            }
            return ret;
        }

        public function start():void
        {
            _bActive = true;
            if (!_invokeState) {
                _invokeState = true;
                Schedule.addInvoke(_taskFunc, 1);
            }
        }

        public function stop():void
        {
            _bActive = false;
            if (_invokeState) {
                _invokeState = false;
                Schedule.removeInvoke(_taskFunc);
            }
        }

        private function sortTask():void
        {
            _arrTask.sortOn("priority", (Array.DESCENDING | Array.NUMERIC));
        }

        protected function doTask():void
        {
            var res:*;
            this.sortTask();
            _invokeState = false;
            while (_arrTask.length > 0 && _taskPool.length < _simultaneousTask) {
	            var task:ITask = _arrTask.pop();
                if (_res != null) {
                    res = _resPool.getResource();
                }
                if (task) {
                    _taskPool.push(task);
                    task.start(res);
                }
            }
        }

        protected function onTaskEnd(evt:TaskEvent):void
        {
            this.removeTaskFormTaskPool(evt.key);
        }

    }
}
