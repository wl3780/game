// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_Invincible

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.status.IStatusEffect;
    import com.tencent.ai.core.actor.model.OpSetValue;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import com.tencent.ai.core.status.SStatus;
    import com.tencent.ai.core.enum.SStatusEffectType;
    import  ©init._SafeStr_1283;

    public class SS_Invincible extends SS_SimpleSpecialStatus 
    {

        private var _ssEffect:IStatusEffect;
        private var _setInvincibleValue:OpSetValue;

        public function SS_Invincible()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function __unexecute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            _local_1.removeOpAttribItem(this._setInvincibleValue);
            if (this._ssEffect != null){
                this._ssEffect.finalize();
                this._ssEffect = null;
            };
        }

        protected function __execute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            this._setInvincibleValue = new OpSetValue(AN.INVINCIBLE, 1, 0, OpAttribItem.PRIORITY_MIDDLE);
            var _local_2:ActorModel = m_target.getModel();
            _local_2.addOpAttribItem(this._setInvincibleValue);
            if (m_typeInfo.effectID != 0){
                this._ssEffect = SStatus.BUILD_SSEFFECT(SStatusEffectType.ADD_MV_EFFECT);
                this._ssEffect.setSStatus(this);
                this._ssEffect.initialize(null);
                this._ssEffect.execute();
            };
        }

        public /*  ©init. */ function _SafeStr_1283()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1283 = " SS_Invincible" (String#13889)


