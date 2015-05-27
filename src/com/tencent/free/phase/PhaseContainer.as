// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.phase.PhaseContainer

package com.tencent.free.phase
{
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.utils.asynInvoke;
    import  ©init._SafeStr_50;
    import __AS3__.vec.*;

    public class PhaseContainer implements IPhaseListener 
    {

        public var progressHander:Function = null;
        public var errorHandler:Function = null;
        public var nextHandler:Function = null;
        public var completeHandler:Function = null;
        protected var errorIntermit:Boolean = true;
        protected var total:int = 0;
        protected var completed:int = 0;
        protected var currentPhase:IPhase;
        protected var phases:Vector.<IPhase>;
        protected var running:Boolean = false;
        protected var doNextFunc:CFunction;

        public function PhaseContainer(_arg_1:Boolean=true)
        {
            this.doNextFunc = new CFunction(this.doNext, this);
            super();
            this.errorIntermit = _arg_1;
            this.phases = new Vector.<IPhase>();
        }

        protected function isAllComplete():Boolean
        {
            if (this.phases.length == 0){
                this.clear();
                if (this.completeHandler != null){
                    this.completeHandler();
                };
                return (true);
            };
            return (false);
        }

        protected function doNext():void
        {
            if (this.currentPhase != null){
                if (!this.currentPhase.isCompleted()){
                    return;
                };
                this.currentPhase.unload();
                this.currentPhase = null;
            };
            if (this.isAllComplete()){
                return;
            };
            this.currentPhase = this.phases.shift();
            this.currentPhase.setListener(this);
            this.currentPhase.start();
            if (this.nextHandler != null){
                this.nextHandler();
            };
        }

        public function progress(_arg_1:int, _arg_2:int=0, _arg_3:int=0, _arg_4:String=""):void
        {
            if (this.progressHander != null){
                this.progressHander(_arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        public function error(_arg_1:String):void
        {
            if (this.errorHandler != null){
                this.errorHandler(_arg_1);
            };
            this.currentPhase.unload();
            this.currentPhase = null;
            if (!this.errorIntermit){
                this.next();
            };
        }

        public function next():void
        {
            asynInvoke(this.doNextFunc);
        }

        public function getCurrent():IPhase
        {
            return (this.currentPhase);
        }

        public function getTotal():int
        {
            return (this.total);
        }

        public function getCompleted():int
        {
            return (this.completed);
        }

        public function addPhase(_arg_1:IPhase):void
        {
            if ((((_arg_1 == null)) || (this.running))){
                return;
            };
            if (this.phases.indexOf(_arg_1) == -1){
                this.phases.push(_arg_1);
            };
        }

        public function start():void
        {
            if (this.running){
                return;
            };
            this.running = true;
            this.total = this.phases.length;
            this.completed = 0;
            this.next();
        }

        public function clear():void
        {
            var _local_1:int = (this.phases.length - 1);
            while (_local_1 >= 0) {
                this.phases[_local_1].unload();
                _local_1--;
            };
            this.phases = new Vector.<IPhase>();
            this.total = 0;
            this.completed = 0;
            this.running = false;
        }

        public /*  ©init. */ function _SafeStr_50()
        {
        }


    }
}//package com.tencent.free.phase

// _SafeStr_50 = " PhaseContainer" (String#1580)


