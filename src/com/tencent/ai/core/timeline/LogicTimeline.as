// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.LogicTimeline

package com.tencent.ai.core.timeline
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.combat.Battle;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.events.LogicTimelineEvent;
    import flash.events.Event;
    import com.tencent.ai.core.timeline.frame.LFFactory;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_1313;
    import __AS3__.vec.*;

    public class LogicTimeline extends EventDispatcher2 implements ILogicTimeline 
    {

        private static var _Current:LogicTimeline;

        private var _currentScene:IScene;
        private var _battle:Battle;
        private var m_currentLogicFrame:ILogicFrame;
        private var _logicFrames:Vector.<ILogicFrame>;
        private var _currentFrameIndex:int;
        private var _runing:Boolean;
        private var _timeLineObj:Object;
        private var _enabledTick:Boolean;
        private var _tickTimes:int;
        private var _tickEvent:LogicTimelineEvent;

        public function LogicTimeline()
        {
            this._runing = true;
            this._currentFrameIndex = -1;
        }

        public static function get Current():LogicTimeline
        {
            return (_Current);
        }

        public static function setCurrent(_arg_1:LogicTimeline):void
        {
            if (_arg_1 != null){
                _Current = _arg_1;
            };
        }

        public static function setNullCurrent(_arg_1:LogicTimeline):void
        {
            if (_Current == _arg_1){
                _Current = null;
            };
        }


        private function nextLogicFrame(... _args):void
        {
            if (this.m_currentLogicFrame != null){
                this.m_currentLogicFrame.removeEventListener(Event.COMPLETE, this.nextLogicFrame);
                this.m_currentLogicFrame.exit();
                this.m_currentLogicFrame = null;
            };
            if (this._logicFrames.length == 0){
                dispatchEvent(new LogicTimelineEvent(LogicTimelineEvent.TIMELINE_END));
            } else {
                this.m_currentLogicFrame = this._logicFrames.shift();
                this.m_currentLogicFrame.addEventListener(Event.COMPLETE, this.nextLogicFrame);
                this.m_currentLogicFrame.enter(this._currentScene);
            };
        }

        public function addLogicFrame(_arg_1:ILogicFrame):void
        {
            this._logicFrames.push(_arg_1);
            if (this.m_currentLogicFrame == null){
                this.nextLogicFrame();
            };
        }

        public function startLogicFrames(_arg_1:Array):void
        {
            this._logicFrames = new Vector.<ILogicFrame>();
            var _local_2:int = _arg_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                this._logicFrames.push(LFFactory.createLF(_arg_1[_local_3]));
                _local_3++;
            };
            this.nextLogicFrame();
        }

        public function bindScene(_arg_1:IScene):void
        {
            this._timeLineObj = {};
            this._tickTimes = DEFINE.FPS;
            this._enabledTick = false;
            this._currentScene = _arg_1;
            this._battle = Battle.Current;
            this._battle.bindScene(_arg_1);
        }

        public function unbind():void
        {
            if (this._currentScene){
                if (this.m_currentLogicFrame != null){
                    this.m_currentLogicFrame.removeEventListener(Event.COMPLETE, this.nextLogicFrame);
                    this.m_currentLogicFrame.exit();
                    this.m_currentLogicFrame = null;
                };
                this._timeLineObj = null;
                this._logicFrames = null;
                this._currentScene = null;
            };
            if (this._battle){
                this._battle.unbind();
                this._battle = null;
            };
        }

        public function getScene():IScene
        {
            return (this._currentScene);
        }

        public function enterframe():void
        {
            if (this._runing){
                this._battle.enterframe(this._currentFrameIndex);
                this._currentFrameIndex++;
                if (this._enabledTick){
                    var _local_1 = this;
                    var _local_2 = (_local_1._tickTimes - 1);
                    _local_1._tickTimes = _local_2;
                    if (this._tickTimes <= 0){
                        this._tickTimes = DEFINE.FPS;
                        if (this._tickEvent == null){
                            this._tickEvent = new LogicTimelineEvent(LogicTimelineEvent.ON_SECOND_TICK);
                            this._tickEvent.setTarget(this);
                        };
                        dispatchEvent(this._tickEvent);
                    };
                };
            };
        }

        public function slow_motion():void
        {
            if (this._battle){
                this._battle.smSlowMotion();
            };
        }

        public function dispose():void
        {
        }

        public function getLogicFrames():Vector.<ILogicFrame>
        {
            return (this._logicFrames);
        }

        public function getCurrentLogicFrame():ILogicFrame
        {
            return (this.m_currentLogicFrame);
        }

        public function pause():void
        {
            this._runing = false;
        }

        public function resume():void
        {
            this._runing = true;
        }

        public function isRuning():Boolean
        {
            return (this._runing);
        }

        public function getCurrentFrameIndex():int
        {
            return (this._currentFrameIndex);
        }

        public function get enableTick():Boolean
        {
            return (this._enabledTick);
        }

        public function set enableTick(_arg_1:Boolean):void
        {
            this._enabledTick = _arg_1;
        }

        public function get timeLineObj():Object
        {
            return (this._timeLineObj);
        }

        public function set timeLineObj(_arg_1:Object):void
        {
            this._timeLineObj = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_1313()
        {
        }


    }
}//package com.tencent.ai.core.timeline

// _SafeStr_1313 = " LogicTimeline" (String#15191)


