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

        public function TaskFlow(_arg_1:int=10, _arg_2:Class=null)
        {
            _arrTask = new Array();
            _taskPool = new Array();
            _resPool = new Pool(_arg_2, _arg_1, true);
            _bActive = false;
            _invokeState = false;
            _taskFunc = new CFunction(this.doTask);
            _simultaneousTask = _arg_1;
            _res = _arg_2;
            _resNumber = 0;
        }

        public function addTask(_arg_1:ITask):void
        {
            _arg_1.addEventListener(TaskEvent.TASK_END, this.onTaskEnd);
            _arrTask.push(_arg_1);
            if (((_bActive) && (!(_invokeState)))){
                _invokeState = true;
                Schedule.addInvoke(_taskFunc, 1);
            };
        }

        public function removeTask(_arg_1:*):ITask
        {
            var _local_2:ITask = this.removeTaskFormArr(_arg_1);
            if (!_local_2){
                _local_2 = this.removeTaskFormTaskPool(_arg_1);
            };
            return (_local_2);
        }

        protected function removeTaskFormArr(_arg_1:*):ITask
        {
            var _local_3:ITask;
            var _local_4:int;
            var _local_2:ITask;
            _local_4 = 0;
            while (_local_4 < _arrTask.length) {
                _local_3 = _arrTask[_local_4];
                if (((_local_3) && ((_local_3.key == _arg_1)))){
                    _local_2 = _local_3;
                    _arrTask.splice(_local_4, 1);
                    break;
                };
                _local_4++;
            };
            if (_local_2){
                _local_2.removeEventListener(TaskEvent.TASK_END, this.onTaskEnd);
            };
            return (_local_2);
        }

        protected function removeTaskFormTaskPool(_arg_1:*):ITask
        {
            var _local_3:ITask;
            var _local_4:int;
            var _local_5:*;
            var _local_2:ITask;
            _local_4 = 0;
            while (_local_4 < _taskPool.length) {
                _local_3 = _taskPool[_local_4];
                if (((_local_3) && ((_local_3.key == _arg_1)))){
                    _local_2 = _local_3;
                    _taskPool.splice(_local_4, 1);
                    if (((_bActive) && (!(_invokeState)))){
                        _invokeState = true;
                        Schedule.addInvoke(_taskFunc, 1);
                    };
                    break;
                };
                _local_4++;
            };
            if (_local_2){
                _local_2.removeEventListener(TaskEvent.TASK_END, this.onTaskEnd);
                _local_5 = _local_2.end();
                if (_local_5 != null){
                    _resPool.returnResource(_local_5);
                };
            };
            return (_local_2);
        }

        public function getTask(_arg_1:*):ITask
        {
            var _local_2:ITask;
            var _local_3:int;
            var _local_4:ITask;
            _local_3 = 0;
            while (_local_3 < _arrTask.length) {
                _local_4 = _arrTask[_local_3];
                if (_local_4.key == _arg_1){
                    _local_2 = _local_4;
                    break;
                };
                _local_3++;
            };
            if (_local_2 == null){
                _local_3 = 0;
                while (_local_3 < _taskPool.length) {
                    _local_4 = _taskPool[_local_3];
                    if (_local_4.key == _arg_1){
                        _local_2 = _local_4;
                        break;
                    };
                    _local_3++;
                };
            };
            return (_local_2);
        }

        public function start():void
        {
            _bActive = true;
            if (!_invokeState){
                _invokeState = true;
                Schedule.addInvoke(_taskFunc, 1);
            };
        }

        public function stop():void
        {
            _bActive = false;
            if (_invokeState){
                _invokeState = false;
                Schedule.removeInvoke(_taskFunc);
            };
        }

        private function sortTask():void
        {
            _arrTask.sortOn("priority", (Array.DESCENDING | Array.NUMERIC));
        }

        protected function doTask():void
        {
            var _local_1:ITask;
            var _local_2:*;
            this.sortTask();
            _invokeState = false;
            while ((((_arrTask.length > 0)) && ((_taskPool.length < _simultaneousTask)))) {
                _local_1 = _arrTask.pop();
                if (_res != null){
                    _local_2 = _resPool.getResource();
                };
                if (_local_1){
                    _taskPool.push(_local_1);
                    _local_1.start(_local_2);
                };
            };
        }

        protected function onTaskEnd(_arg_1:TaskEvent):void
        {
            this.removeTaskFormTaskPool(_arg_1.key);
        }

    }
}
