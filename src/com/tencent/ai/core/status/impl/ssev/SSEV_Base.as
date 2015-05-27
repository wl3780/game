// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssev.SSEV_Base

package com.tencent.ai.core.status.impl.ssev
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.status.IStatusEvent;
    import com.tencent.ai.core.data.StatusEventInfo;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.actor.BaseActor;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.IStatusEffect;
    import com.tencent.ai.core.data.StatusEffectInfo;
    import com.tencent.ai.core.data.ConditionInfo;
    import com.tencent.ai.core.status.SStatus;
    import com.tencent.free.logging.assert;
    import com.tencent.ai.core.condition.ConditionBuilder;
    import com.tencent.ai.core.events.SStatusEvent;
    import  ©init._SafeStr_1271;
    import __AS3__.vec.*;

    public class SSEV_Base extends EventDispatcher2 implements IStatusEvent 
    {

        protected var m_type:int;
        protected var m_maxTimes:int;
        protected var m_currentTimes:int;
        protected var m_info:StatusEventInfo;
        protected var m_status:ISpecialStatus;
        protected var m_target:BaseActor;
        protected var m_ssEffects:Vector.<IStatusEffect>;


        protected function executeSSEffects(... _args):void
        {
            var _local_2:Vector.<StatusEffectInfo>;
            var _local_3:int;
            var _local_4:StatusEffectInfo;
            var _local_5:IStatusEffect;
            var _local_6:Vector.<ConditionInfo>;
            var _local_7:int;
            var _local_8:int;
            if (this.m_ssEffects == null){
                this.m_ssEffects = new Vector.<IStatusEffect>();
                _local_2 = this.m_info.statusEffects;
                if (_local_2 != null){
                    _local_3 = 0;
                    while (_local_3 < _local_2.length) {
                        _local_4 = _local_2[_local_3];
                        _local_5 = SStatus.BUILD_SSEFFECT(_local_4.type);
                        assert((_local_5 == null), ("[SSEV_Base] 找不到作用效果 type = " + _local_4.type));
                        _local_5.setSStatus(this.m_status);
                        _local_5.initialize(_local_4);
                        this.m_ssEffects.push(_local_5);
                        _local_3++;
                    };
                };
            };
            if (this.m_currentTimes > 0){
                _local_6 = this.m_info.conditionInfos;
                _local_7 = this.m_info.cFlag;
                _local_8 = (((_local_6 == null)) ? 0 : _local_6.length);
                if (_local_7 == 0){
                    _local_3 = 0;
                    while (_local_3 < _local_8) {
                        if (!ConditionBuilder.STATIC_CHECK(_local_6[_local_3], this.m_target)){
                            return;
                        };
                        _local_3++;
                    };
                } else {
                    _local_3 = 0;
                    while (_local_3 < _local_8) {
                        if (ConditionBuilder.STATIC_CHECK(_local_6[_local_3], this.m_target)) break;
                        _local_3++;
                    };
                    if (_local_3 == _local_8){
                        return;
                    };
                };
                _local_3 = 0;
                while (_local_3 < this.m_ssEffects.length) {
                    this.m_ssEffects[_local_3].execute();
                    _local_3++;
                };
                this.m_currentTimes = (this.m_currentTimes - 1);
                if (this.m_currentTimes <= 0){
                    dispatchEvent(new SStatusEvent(SStatusEvent.ON_SSTATUS_EVENT_END, this));
                };
            };
        }

        public function setStatus(_arg_1:ISpecialStatus):void
        {
            this.m_status = _arg_1;
            this.m_target = (_arg_1.getTarget() as BaseActor);
        }

        public function getStatus():ISpecialStatus
        {
            return (this.m_status);
        }

        public function initialize(_arg_1:StatusEventInfo):void
        {
            this.m_info = _arg_1;
            this.m_type = _arg_1.statusEventType;
            this.m_maxTimes = _arg_1.eventTimes;
            this.m_currentTimes = (((this.m_maxTimes == 0)) ? int.MAX_VALUE : this.m_maxTimes);
        }

        public function finalize():void
        {
            var _local_1:int;
            if (this.m_ssEffects != null){
                _local_1 = 0;
                while (_local_1 < this.m_ssEffects.length) {
                    this.m_ssEffects[_local_1].finalize();
                    _local_1++;
                };
                this.m_ssEffects = null;
            };
            this.m_info = null;
            this.m_target = null;
        }

        public function getType():int
        {
            return (this.m_type);
        }

        public /*  ©init. */ function _SafeStr_1271()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssev

// _SafeStr_1271 = " SSEV_Base" (String#14624)


