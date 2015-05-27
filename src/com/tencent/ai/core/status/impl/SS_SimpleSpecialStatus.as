// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_SimpleSpecialStatus

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.SSTypeInfo;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.free.utils.CFunction;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.IStatusEvent;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.events.SStatusEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.SpecialStatusInfo;
    import com.tencent.ai.core.data.StatusEventInfo;
    import com.tencent.ai.core.status.SStatus;
    import com.tencent.free.logging.assert;
    import  ©init._SafeStr_1286;
    import __AS3__.vec.*;

    public class SS_SimpleSpecialStatus extends EventDispatcher2 implements ISpecialStatus 
    {

        protected var m_compareTypeStr:String;
        protected var m_target:BaseActor;
        protected var m_isExecuted:Boolean;
        protected var m_typeInfo:SSTypeInfo;
        protected var m_isBorn:Boolean;
        protected var m_ssModel:SSModel;
        protected var m_removeStatus:CFunction;
        protected var m_hasCountDown:Boolean;
        protected var m_hasActoinChange:Boolean;
        protected var m_events:Vector.<IStatusEvent>;
        protected var m_unexecute:Function;
        protected var m_execute:Function;
        protected var m_rtParams:Object;

        public function SS_SimpleSpecialStatus()
        {
            this.m_isExecuted = false;
            this.m_hasCountDown = false;
            this.m_hasActoinChange = false;
        }

        protected function unexecute():void
        {
            var _local_1:int;
            var _local_2:IStatusEvent;
            if (this.m_isExecuted){
                this.m_isExecuted = false;
                if (this.m_unexecute != null){
                    this.m_unexecute.call(this);
                };
                if (this.m_hasCountDown){
                    this.m_target.removeEventListener(ElementEvent.ON_TICK, this.onTimeTick);
                    this.m_hasCountDown = false;
                };
                if (this.m_hasActoinChange){
                    this.m_target.getModel().removeEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onActionChange);
                    this.m_hasActoinChange = false;
                };
                if (this.m_events != null){
                    _local_1 = 0;
                    while (_local_1 < this.m_events.length) {
                        _local_2 = this.m_events[_local_1];
                        _local_2.removeEventListener(SStatusEvent.ON_SSTATUS_EVENT_END, this.onSStatusEventEnd);
                        _local_2.finalize();
                        _local_1++;
                    };
                };
                this.m_events = null;
                this.m_removeStatus = null;
                if (this.m_typeInfo.soundOut != 0){
                    AICore.sound.play(this.m_typeInfo.soundOut, -1, 0, 100, 0, this.m_target);
                };
            };
        }

        private function onActionChange(_arg_1:ActorModelEvent):void
        {
            this.onSStatusEventEnd(null);
            dispatchEvent(new SStatusEvent(SStatusEvent.ON_SSTATUS_END, this));
        }

        protected function onTimeTick(_arg_1:ElementEvent):void
        {
            this.m_ssModel.updateCurrentDuration((this.m_ssModel.currDuration - 1));
            if (this.m_ssModel.currDuration <= 0){
                this.onSStatusEventEnd(null);
                dispatchEvent(new SStatusEvent(SStatusEvent.ON_SSTATUS_END, this));
            };
        }

        protected function onSStatusEventEnd(_arg_1:SStatusEvent):void
        {
            if (this.m_hasCountDown){
                this.m_hasCountDown = false;
                this.m_target.removeEventListener(ElementEvent.ON_TICK, this.onTimeTick);
            };
            if (this.m_hasActoinChange){
                this.m_hasActoinChange = false;
                this.m_target.getModel().removeEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onActionChange);
            };
            var _local_2:Array = [this];
            _local_2.exclude = true;
            this.m_removeStatus = new CFunction(this.m_target.removeStatus, this.m_target, _local_2);
            this.m_target.execNextFrame(this.m_removeStatus);
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = (_arg_1 as BaseActor);
        }

        public function setModel(_arg_1:SSModel):void
        {
            this.m_ssModel = _arg_1;
            if (this.m_ssModel != null){
                this.m_isBorn = this.m_ssModel.isBorn;
            };
        }

        public function getModel():SSModel
        {
            return (this.m_ssModel);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function execute():void
        {
            var _local_1:SpecialStatusInfo;
            var _local_2:Vector.<StatusEventInfo>;
            var _local_3:int;
            var _local_4:int;
            var _local_5:StatusEventInfo;
            var _local_6:IStatusEvent;
            if (!this.m_isExecuted){
                this.m_isExecuted = true;
                _local_1 = this.m_ssModel.statusInfo;
                this.m_typeInfo = _local_1.typeInfo;
                _local_2 = _local_1.statusEventInfos;
                if (((!((_local_2 == null))) && ((_local_2.length > 0)))){
                    this.m_events = new Vector.<IStatusEvent>();
                    _local_4 = 0;
                    while (_local_4 < _local_2.length) {
                        _local_5 = _local_2[_local_4];
                        _local_6 = SStatus.BUILD_SSEVENT(_local_5.statusEventType);
                        assert((_local_6 == null), (("[SS_SimpleSpecialStatus] 找不到 statusEventType = " + _local_5.statusEventType) + " 的事件"));
                        _local_6.setStatus(this);
                        _local_6.addEventListener(SStatusEvent.ON_SSTATUS_EVENT_END, this.onSStatusEventEnd);
                        _local_6.initialize(_local_5);
                        this.m_events.push(_local_6);
                        _local_4++;
                    };
                };
                if (this.m_typeInfo.soundIn != 0){
                    AICore.sound.play(this.m_typeInfo.soundIn, -1, 0, 100, 0, this.m_target);
                };
                _local_3 = this.m_ssModel.duration;
                if (_local_3 == 9999){
                    this.m_hasActoinChange = true;
                    this.m_target.getModel().addEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onActionChange);
                } else {
                    if (_local_3 > 0){
                        this.m_hasCountDown = true;
                        this.m_target.addEventListener(ElementEvent.ON_TICK, this.onTimeTick);
                    };
                };
                if (this.m_execute != null){
                    this.m_execute.call(this);
                };
            };
        }

        public function compare(_arg_1:ISpecialStatus):int
        {
            if (this.m_compareTypeStr == null){
                this.m_compareTypeStr = (("," + this.m_ssModel.statusInfo.type) + ",");
            };
            var _local_2:SSTypeInfo = _arg_1.getTypeInfo();
            if (_local_2.yesTypes.indexOf(this.m_compareTypeStr) != -1){
                return (SSTypeInfo.COMPARE_CODE_YES);
            };
            if (_local_2.noTypes.indexOf(this.m_compareTypeStr) != -1){
                return (SSTypeInfo.COMPARE_CODE_NO);
            };
            return (SSTypeInfo.COMPARE_CODE_EXIST);
        }

        public function getTypeInfo():SSTypeInfo
        {
            return (this.m_typeInfo);
        }

        public function isBorn():Boolean
        {
            return (this.m_isBorn);
        }

        public function setRTParams(_arg_1:Object):void
        {
            this.m_rtParams = _arg_1;
        }

        public function getRTParams():Object
        {
            return (this.m_rtParams);
        }

        public function dispose():void
        {
            if (this.m_isExecuted){
                this.unexecute();
            };
            this.m_target = null;
            this.m_typeInfo = null;
            this.m_ssModel = null;
            this.m_rtParams = null;
        }

        public /*  ©init. */ function _SafeStr_1286()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1286 = " SS_SimpleSpecialStatus" (String#13886)


