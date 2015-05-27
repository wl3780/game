// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.task.TaskFlow

package com.tencent.free.core.manager.task
{
    import com.tencent.free.core.manager.pool.Pool;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.utils.Schedule;
    import  ©init._SafeStr_26;

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
            this._arrTask = new Array();
            this._taskPool = new Array();
            this._resPool = new Pool(_arg_2, _arg_1, true);
            this._bActive = false;
            this._invokeState = false;
            this._taskFunc = new CFunction(this.doTask);
            this._simultaneousTask = _arg_1;
            this._res = _arg_2;
            this._resNumber = 0;
        }

        public function addTask(_arg_1:ITask):void
        {
            _arg_1.addEventListener(TaskEvent.TASK_END, this.onTaskEnd);
            this._arrTask.push(_arg_1);
            if (((this._bActive) && (!(this._invokeState)))){
                this._invokeState = true;
                Schedule.addInvoke(this._taskFunc, 1);
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
            while (_local_4 < this._arrTask.length) {
                _local_3 = this._arrTask[_local_4];
                if (((_local_3) && ((_local_3.key == _arg_1)))){
                    _local_2 = _local_3;
                    this._arrTask.splice(_local_4, 1);
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
            while (_local_4 < this._taskPool.length) {
                _local_3 = this._taskPool[_local_4];
                if (((_local_3) && ((_local_3.key == _arg_1)))){
                    _local_2 = _local_3;
                    this._taskPool.splice(_local_4, 1);
                    if (((this._bActive) && (!(this._invokeState)))){
                        this._invokeState = true;
                        Schedule.addInvoke(this._taskFunc, 1);
                    };
                    break;
                };
                _local_4++;
            };
            if (_local_2){
                _local_2.removeEventListener(TaskEvent.TASK_END, this.onTaskEnd);
                _local_5 = _local_2.end();
                if (_local_5 != null){
                    this._resPool.returnResource(_local_5);
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
            while (_local_3 < this._arrTask.length) {
                _local_4 = this._arrTask[_local_3];
                if (_local_4.key == _arg_1){
                    _local_2 = _local_4;
                    break;
                };
                _local_3++;
            };
            if (_local_2 == null){
                _local_3 = 0;
                while (_local_3 < this._taskPool.length) {
                    _local_4 = this._taskPool[_local_3];
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
            this._bActive = true;
            if (!this._invokeState){
                this._invokeState = true;
                Schedule.addInvoke(this._taskFunc, 1);
            };
        }

        public function stop():void
        {
            this._bActive = false;
            if (this._invokeState){
                this._invokeState = false;
                Schedule.removeInvoke(this._taskFunc);
            };
        }

        private function sortTask():void
        {
            this._arrTask.sortOn("priority", (Array.DESCENDING | Array.NUMERIC));
        }

        protected function doTask():void
        {
            var _local_1:ITask;
            var _local_2:*;
            this.sortTask();
            this._invokeState = false;
            while ((((this._arrTask.length > 0)) && ((this._taskPool.length < this._simultaneousTask)))) {
                _local_1 = this._arrTask.pop();
                if (this._res != null){
                    _local_2 = this._resPool.getResource();
                };
                if (_local_1){
                    this._taskPool.push(_local_1);
                    _local_1.start(_local_2);
                };
            };
        }

        protected function onTaskEnd(_arg_1:TaskEvent):void
        {
            this.removeTaskFormTaskPool(_arg_1.key);
        }

        public /*  ©init. */ function _SafeStr_26()
        {
        }


    }
}//package com.tencent.free.core.manager.task

// _SafeStr_26 = " TaskFlow" (String#1568)


