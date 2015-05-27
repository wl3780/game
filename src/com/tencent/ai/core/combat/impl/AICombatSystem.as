// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.impl.AICombatSystem

package com.tencent.ai.core.combat.impl
{
    import com.tencent.ai.core.combat.ICombatSystem;
    import com.tencent.ai.core.func.SpecialFuncManager;
    import com.tencent.ai.core.status.SpecialStatusManager;
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.func.ISpecialFuncManager;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_72;

    public class AICombatSystem implements ICombatSystem 
    {

        protected var m_dmgMeters:DMGMetersManager;
        protected var m_sfm:SpecialFuncManager;
        protected var m_ssm:SpecialStatusManager;


        public function initialize():void
        {
            this.m_dmgMeters = new DMGMetersManager();
            this.m_dmgMeters.initialize(this);
            this.m_sfm = SpecialFuncManager.getInstance();
            this.m_sfm.initialize(this);
            this.m_ssm = SpecialStatusManager.getInstance();
            this.m_ssm.initialize(this);
        }

        public function getDmgMeters():IDmgMetersManager
        {
            return (this.m_dmgMeters);
        }

        public function getSpecialStatusManager():ISpecialStatusManager
        {
            return (this.m_ssm);
        }

        public function getSpecialFuncManager():ISpecialFuncManager
        {
            return (this.m_sfm);
        }

        public function newRound():void
        {
            this.m_dmgMeters.newRound();
            AICore.data.mainModel.newRound();
        }

        public function clearRound():void
        {
            this.m_dmgMeters.clearRound();
            AICore.data.mainModel.clearRound();
        }

        public /*  ©init. */ function _SafeStr_72()
        {
        }


    }
}//package com.tencent.ai.core.combat.impl

// _SafeStr_72 = " AICombatSystem" (String#17540)


