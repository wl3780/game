package com.tencent.ai.core.action
{
    import com.tencent.ai.core.action.hurt.BaseHurtAction;
    import com.tencent.ai.core.action.hurt.BeThrowFloatState;
    import com.tencent.ai.core.action.hurt.BeThrowNormalState;
    import com.tencent.ai.core.action.hurt.GetUpState;
    import com.tencent.ai.core.action.hurt.HurtState;
    import com.tencent.ai.core.action.hurt.LieState;
    import com.tencent.ai.core.actor.IElementController;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.enum.AttackType;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.VKeyDef;

    public class BethrownAction extends BaseHurtAction 
    {

        public function BethrownAction()
        {
            super(BaseActionIDDef.BETHROWN);
        }

        override protected function initThis():void
        {
            super.initThis();
            m_states[HurtState.NORMAL] = new BeThrowNormalState(this);
            m_states[HurtState.FLOAT] = new BeThrowFloatState(this);
            m_states[HurtState.LIE] = new LieState(this);
            m_states[HurtState.GETUP] = new GetUpState(this);
            m_state = m_states[HurtState.NORMAL];
        }

        override protected function activeAction(_arg_1:int, _arg_2:Object):void
        {
            super.activeAction(_arg_1, _arg_2);
            var _local_3:AttackInfo = (_arg_2 as AttackInfo);
            m_target.forceSetDirection(_local_3.dir);
            onNextState(m_state.accept(_local_3), _local_3);
        }

        override public function handleHurt(_arg_1:IElementController, _arg_2:AttackInfo):Boolean
        {
            var _local_3:int = _arg_2.attackType;
            if (_local_3 == AttackType.ATTACK_CATCH){
                _arg_1.actHurtAction(BaseActionIDDef.CAUGHT, VKeyDef.CAUGHT, _arg_2);
            } else {
                if (_local_3 == AttackType.ATTACK_CAPTIVE){
                    _arg_1.actHurtAction(BaseActionIDDef.CAPTIVE, VKeyDef.CAPTIVE, _arg_2);
                } else {
                    _arg_1.actHurtAction(BaseActionIDDef.BEHURT, VKeyDef.HURT, _arg_2);
                };
            };
            return (true);
        }

        public /*  ©init. */ function _SafeStr_17()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_17 = " BethrownAction" (String#17051)


