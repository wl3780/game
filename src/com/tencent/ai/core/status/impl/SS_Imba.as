// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_Imba

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.actor.model.OpSetValue;
    import com.tencent.ai.core.actor.model.OpMultiplyValue;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.enum.HoldFlagDef;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import  ©init._SafeStr_1282;

    public class SS_Imba extends SS_SimpleSpecialStatus 
    {

        private var _setHoldFlag:OpSetValue;
        private var _setCanBeCaught:OpMultiplyValue;

        public function SS_Imba()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function __unexecute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            _local_1.removeOpAttribItem(this._setHoldFlag);
            _local_1.removeOpAttribItem(this._setCanBeCaught);
        }

        protected function __execute():void
        {
            var _local_1:ActorModel = m_target.getModel();
            this._setHoldFlag = new OpSetValue(AN.H_FLAG, HoldFlagDef.HOLD_EVERYTHING, 0, OpAttribItem.PRIORITY_HIGHT);
            this._setCanBeCaught = new OpMultiplyValue(AN.CAN_BE_CAUGHT, 0, 0, OpAttribItem.PRIORITY_HIGHT);
            _local_1.addOpAttribItem(this._setHoldFlag);
            _local_1.addOpAttribItem(this._setCanBeCaught);
        }

        public /*  ©init. */ function _SafeStr_1282()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1282 = " SS_Imba" (String#14333)


