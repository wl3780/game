// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_BornRecover

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1277;

    public class SS_BornRecover extends SS_SimpleSpecialStatus 
    {

        private static var _DMGMETERS:IDmgMetersManager;

        protected var m_model:ActorModel;
        protected var m_leftTime:int;
        protected var m_currentRecoverHP:Number;
        protected var m_currentRecoverMP:Number;
        protected var m_Q:Number;

        public function SS_BornRecover()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function onRecoverTick(_arg_1:ElementEvent):void
        {
            var _local_2:int;
            var _local_3:int;
            this.m_leftTime--;
            if (this.m_leftTime <= 0){
                this.m_leftTime = 10;
                this.m_currentRecoverHP = (this.m_currentRecoverHP + (this.m_model.hp_recovery * this.m_Q));
                _local_2 = int(this.m_currentRecoverHP);
                if (_local_2 != 0){
                    this.m_currentRecoverHP = (this.m_currentRecoverHP - _local_2);
                    if (!this.m_model.isHPFull()){
                        _DMGMETERS.inputActorHPUpdate(m_target, _local_2, false);
                    };
                };
                this.m_currentRecoverMP = (this.m_currentRecoverMP + (this.m_model.mp_recovery * this.m_Q));
                _local_3 = int(this.m_currentRecoverMP);
                if (_local_3 != 0){
                    this.m_currentRecoverMP = (this.m_currentRecoverMP - _local_3);
                    if (!this.m_model.isMPFull()){
                        _DMGMETERS.inputActorMPUpdate(m_target, _local_3, false);
                    };
                };
            };
        }

        protected function __unexecute():void
        {
            m_target.removeEventListener(ElementEvent.ON_TICK, this.onRecoverTick);
            this.m_model = null;
            this.m_currentRecoverHP = 0;
            this.m_currentRecoverMP = 0;
            this.m_leftTime = 0;
            this.m_Q = 0;
        }

        protected function __execute():void
        {
            if (_DMGMETERS == null){
                _DMGMETERS = AICore.combatSystem.getDmgMeters();
            };
            this.m_currentRecoverHP = 0;
            this.m_currentRecoverMP = 0;
            this.m_leftTime = 10;
            this.m_Q = 0.017;
            this.m_model = m_target.getModel();
            m_target.addEventListener(ElementEvent.ON_TICK, this.onRecoverTick);
        }

        public /*  ©init. */ function _SafeStr_1277()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1277 = " SS_BornRecover" (String#16556)


