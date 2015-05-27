// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_Adsorb

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.actor.model.OpMultiplyValue;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.enum.CaptiveAttackIDDef;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import com.tencent.ai.core.enum.AttackType;
    import  ©init._SafeStr_1276;

    public class SS_Adsorb extends SS_SimpleSpecialStatus 
    {

        protected static var M_ATTACK_INFO:AttackInfo;

        protected var m_setMoveRateX:OpMultiplyValue;
        protected var m_setMoveRateY:OpMultiplyValue;

        public function SS_Adsorb()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function __unexecute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            _local_1.removeOpAttribItem(this.m_setMoveRateX);
            _local_1.removeOpAttribItem(this.m_setMoveRateY);
            M_ATTACK_INFO.attackID = CaptiveAttackIDDef.OUT_CAPTIVE_ID;
            m_target.beHurt(M_ATTACK_INFO);
        }

        protected function __execute():void
        {
            var _local_2:SkillInfo;
            var _local_1:ActorModel = m_target.getModel();
            this.m_setMoveRateX = new OpMultiplyValue(AN.M_X_RATE, 0, 0, OpAttribItem.PRIORITY_MIDDLE);
            this.m_setMoveRateY = new OpMultiplyValue(AN.M_Y_RATE, 0, 0, OpAttribItem.PRIORITY_MIDDLE);
            _local_1.addOpAttribItem(this.m_setMoveRateX);
            _local_1.addOpAttribItem(this.m_setMoveRateY);
            if (M_ATTACK_INFO == null){
                M_ATTACK_INFO = AttackInfo.newInstance();
                M_ATTACK_INFO.attackType = AttackType.ATTACK_CAPTIVE;
                _local_2 = new SkillInfo();
                _local_2.powerY = 800;
                M_ATTACK_INFO.skillInfo = _local_2;
            };
            M_ATTACK_INFO.attackID = CaptiveAttackIDDef.IN_ADSORB_ID;
            M_ATTACK_INFO.dir = m_target.getDirection();
            m_target.beHurt(M_ATTACK_INFO);
        }

        public /*  ©init. */ function _SafeStr_1276()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1276 = " SS_Adsorb" (String#14999)


