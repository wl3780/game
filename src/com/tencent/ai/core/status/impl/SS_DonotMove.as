// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_DonotMove

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.status.IStatusEffect;
    import com.tencent.ai.core.actor.model.OpMultiplyValue;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import com.tencent.ai.core.status.SStatus;
    import com.tencent.ai.core.enum.SStatusEffectType;
    import  ©init._SafeStr_1280;

    public class SS_DonotMove extends SS_SimpleSpecialStatus 
    {

        private var _ssEffect:IStatusEffect;
        private var _setMoveRateX:OpMultiplyValue;
        private var _setMoveRateY:OpMultiplyValue;

        public function SS_DonotMove()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function __unexecute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            _local_1.removeOpAttribItem(this._setMoveRateX);
            _local_1.removeOpAttribItem(this._setMoveRateY);
            this._ssEffect.finalize();
        }

        protected function __execute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            this._setMoveRateX = new OpMultiplyValue(AN.M_X_RATE, 0, 0, OpAttribItem.PRIORITY_MIDDLE);
            this._setMoveRateY = new OpMultiplyValue(AN.M_Y_RATE, 0, 0, OpAttribItem.PRIORITY_MIDDLE);
            _local_1.addOpAttribItem(this._setMoveRateX);
            _local_1.addOpAttribItem(this._setMoveRateY);
            this._ssEffect = SStatus.BUILD_SSEFFECT(SStatusEffectType.ADD_MV_EFFECT);
            this._ssEffect.setSStatus(this);
            this._ssEffect.initialize(null);
            this._ssEffect.execute();
        }

        public /*  ©init. */ function _SafeStr_1280()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1280 = " SS_DonotMove" (String#14135)


