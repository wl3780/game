// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_KeepAddHMP

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.StatusEffectInfo;
    import  ©init._SafeStr_1265;

    public class SSEF_KeepAddHMP extends SSEF_Base 
    {

        private static var _DMGMETERS:IDmgMetersManager;

        protected var m_hp_value:Number;
        protected var m_hp_rate:Number;
        protected var m_mp_value:Number;
        protected var m_mp_rate:Number;
        protected var m_change_flag:int;
        protected var m_model:ActorModel;


        override public function finalize():void
        {
            this.m_model = null;
            super.finalize();
        }

        override public function initialize(_arg_1:StatusEffectInfo):void
        {
            super.initialize(_arg_1);
            if (_DMGMETERS == null){
                _DMGMETERS = AICore.combatSystem.getDmgMeters();
            };
            this.m_hp_value = m_info.data_1;
            this.m_hp_rate = DEFINE.CAST_FLOAT(m_info.data_2);
            this.m_mp_value = m_info.data_3;
            this.m_mp_rate = DEFINE.CAST_FLOAT(m_info.data_4);
            this.m_change_flag = m_info.data_5;
            this.m_model = m_target.getModel();
        }

        override public function execute():void
        {
            var _local_1:int;
            var _local_2:int;
            if (((!((this.m_hp_rate == 0))) || (!((this.m_hp_value == 0))))){
                _local_1 = ((((((this.m_change_flag & 1) == 1)) ? this.m_model.maxhp : this.m_model.hp) * this.m_hp_rate) + this.m_hp_value);
                _DMGMETERS.inputActorHPUpdate(m_target, _local_1);
            };
            if (((!((this.m_mp_rate == 0))) || (!((this.m_mp_value == 0))))){
                _local_2 = ((((((this.m_change_flag & 2) == 2)) ? this.m_model.maxmp : this.m_model.mp) * this.m_mp_rate) + this.m_mp_value);
                _DMGMETERS.inputActorMPUpdate(m_target, _local_2);
            };
        }

        public /*  ©init. */ function _SafeStr_1265()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1265 = " SSEF_KeepAddHMP" (String#17096)


