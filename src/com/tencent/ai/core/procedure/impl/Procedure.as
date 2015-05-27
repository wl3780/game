// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.procedure.impl.Procedure

package com.tencent.ai.core.procedure.impl
{
    import com.tencent.ai.core.procedure.IProcedure;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.triggerEvent.ITriggerEvent;
    import com.tencent.ai.core.condition.ICondition;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.data.ConditionInfo;
    import com.tencent.ai.core.triggerEvent.TriggerEventBuilder;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.condition.ConditionBuilder;
    import com.tencent.ai.core.data.ProcedureInfo;
    import com.tencent.ai.core.global_script;
    import com.tencent.ai.core.events.TriggerEvent;
    import  ©init._SafeStr_855;
    import __AS3__.vec.*;

    public class Procedure implements IProcedure 
    {

        protected var m_id:uint;
        protected var m_owner:Object;
        protected var m_initialScripts:Vector.<ScriptInfo>;
        protected var m_events:Vector.<ITriggerEvent>;
        protected var m_conditions:Vector.<ICondition>;
        protected var m_exeScripts:Vector.<ScriptInfo>;
        protected var m_bActive:Boolean;


        public function get id():uint
        {
            return (this.m_id);
        }

        public function get owner():Object
        {
            return (this.m_owner);
        }

        public function initialize(_arg_1:ProcedureInfo, _arg_2:Object=null):Boolean
        {
            var _local_3:ScriptInfo;
            var _local_4:TriggerEventInfo;
            var _local_5:ConditionInfo;
            var _local_6:ITriggerEvent;
            var _local_7:ICondition;
            this.m_id = _arg_1.id;
            this.m_owner = _arg_2;
            this.m_initialScripts = new Vector.<ScriptInfo>();
            for each (_local_3 in _arg_1.initialScripts) {
                this.m_initialScripts.push(_local_3);
            };
            this.m_events = new Vector.<ITriggerEvent>();
            for each (_local_4 in _arg_1.events) {
                _local_6 = TriggerEventBuilder.getInstance().buildTriggerEvent(_local_4, {"target":this.m_owner});
                if (_local_6){
                    this.m_events.push(_local_6);
                } else {
                    error(("[timmmmmmy]:创建TriggerEvent失败" + _local_4));
                };
            };
            this.m_conditions = new Vector.<ICondition>();
            for each (_local_5 in _arg_1.conditions) {
                _local_7 = ConditionBuilder.getInstance().buildCondition(_local_5, {"owner":this});
                if (_local_7){
                    this.m_conditions.push(_local_7);
                };
            };
            this.m_exeScripts = new Vector.<ScriptInfo>();
            for each (_local_3 in _arg_1.scripts) {
                this.m_exeScripts.push(_local_3);
            };
            return (true);
        }

        public function finalize():void
        {
            this.deactivate();
        }

        public function activate():Boolean
        {
            var _local_1:ScriptInfo;
            var _local_2:ITriggerEvent;
            for each (_local_1 in this.m_initialScripts) {
                global_script(_local_1.cmd, _local_1.arg, this);
            };
            for each (_local_2 in this.m_events) {
                _local_2.addEventListener(TriggerEvent.ON_TRIGGER, this.onEventTrigger);
                _local_2.activate();
            };
            this.m_bActive = true;
            return (this.m_bActive);
        }

        public function deactivate():Boolean
        {
            var _local_1:ITriggerEvent;
            for each (_local_1 in this.m_events) {
                _local_1.removeEventListener(TriggerEvent.ON_TRIGGER, this.onEventTrigger);
                _local_1.inactivate();
            };
            this.m_bActive = false;
            return (this.m_bActive);
        }

        public function bActive():Boolean
        {
            return (this.m_bActive);
        }

        protected function onEventTrigger(_arg_1:TriggerEvent):void
        {
            this.checkCondition();
        }

        public function checkCondition():void
        {
            var _local_2:ICondition;
            var _local_1:Boolean = true;
            for each (_local_2 in this.m_conditions) {
                _local_1 = ((_local_1) && (_local_2.check()));
                if (!_local_1) break;
            };
            if (_local_1){
                this.ExecScript();
            };
        }

        public function ExecScript():void
        {
            var _local_1:ScriptInfo;
            for each (_local_1 in this.m_exeScripts) {
                global_script(_local_1.cmd, _local_1.arg, this);
            };
        }

        public /*  ©init. */ function _SafeStr_855()
        {
        }


    }
}//package com.tencent.ai.core.procedure.impl

// _SafeStr_855 = " Procedure" (String#14903)


