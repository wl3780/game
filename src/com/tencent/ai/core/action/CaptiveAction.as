package com.tencent.ai.core.action
{
    import com.tencent.ai.core.action.hurt.BaseHurtAction;
    import com.tencent.ai.core.action.hurt.CaptiveNormalState;
    import com.tencent.ai.core.action.hurt.FloatState;
    import com.tencent.ai.core.action.hurt.GetUpState;
    import com.tencent.ai.core.action.hurt.HurtState;
    import com.tencent.ai.core.action.hurt.LieState;
    import com.tencent.ai.core.actor.IElementController;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import com.tencent.ai.core.actor.model.OpSetValue;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.enum.AttackType;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.CaptiveAttackIDDef;
    import com.tencent.ai.core.enum.VKeyDef;

    public class CaptiveAction extends BaseHurtAction 
    {

        private var _setCanBeCauht:OpSetValue;
        private var _isCaptive:Boolean;
        private var _nomalState:CaptiveNormalState;

        public function CaptiveAction()
        {
            super(BaseActionIDDef.CAPTIVE);
        }

        private function inCaptive():void
        {
            this._isCaptive = true;
            if (this._setCanBeCauht == null){
                this._setCanBeCauht = new OpSetValue(AN.CAN_BE_CAUGHT, 0, 0, OpAttribItem.PRIORITY_HIGHT);
            };
            m_model.addOpAttribItem(this._setCanBeCauht);
        }

        private function outCaptive():void
        {
            m_model.removeOpAttribItem(this._setCanBeCauht);
            this._isCaptive = false;
        }

        override protected function initThis():void
        {
            super.initThis();
            this._nomalState = new CaptiveNormalState(this);
            m_states[HurtState.NORMAL] = this._nomalState;
            m_states[HurtState.LIE] = new LieState(this);
            m_states[HurtState.FLOAT] = new FloatState(this);
            m_states[HurtState.GETUP] = new GetUpState(this);
            m_state = m_states[HurtState.NORMAL];
        }

        override protected function activeAction(_arg_1:int, _arg_2:Object):void
        {
            super.activeAction(_arg_1, _arg_2);
            m_target.stopMove();
            m_target.stopJump();
            m_state.accept((_arg_2 as AttackInfo));
            this.inCaptive();
        }

        override protected function inactvieAction():void
        {
            if (this._isCaptive){
                this.outCaptive();
            };
            super.inactvieAction();
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            super.exec(_arg_1, _arg_2);
            var _local_3:AttackInfo = (_arg_2 as AttackInfo);
            if (_local_3 != null){
                if (_local_3.attackType == AttackType.ATTACK_CAPTIVE){
                    if (_local_3.attackID == CaptiveAttackIDDef.OUT_CAPTIVE_ID){
                        if (this._isCaptive){
                            this.outCaptive();
                            if (this._nomalState.canFloatState()){
                                onNextState(HurtState.FLOAT, _local_3);
                            };
                        };
                    } else {
                        if (!this._isCaptive){
                            onNextState(HurtState.NORMAL, _local_3);
                            this.inCaptive();
                        };
                    };
                } else {
                    m_target.acceptDmg(_local_3);
                };
            };
        }

        override public function handleHurt(_arg_1:IElementController, _arg_2:AttackInfo):Boolean
        {
            if (this._isCaptive){
                _arg_1.actHurtAction(BaseActionIDDef.CAPTIVE, VKeyDef.CAPTIVE, _arg_2);
                return (true);
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_18()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_18 = " CaptiveAction" (String#14069)


