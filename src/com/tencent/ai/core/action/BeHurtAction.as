// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.BeHurtAction

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.action.hurt.BaseHurtAction;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.action.hurt.HurtState;
    import com.tencent.ai.core.action.hurt.NormalState;
    import com.tencent.ai.core.action.hurt.StiffState;
    import com.tencent.ai.core.action.hurt.FloatState;
    import com.tencent.ai.core.action.hurt.LieState;
    import com.tencent.ai.core.action.hurt.GetUpState;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_16;

    public class BeHurtAction extends BaseHurtAction 
    {

        protected var m_isDead:Boolean;

        public function BeHurtAction()
        {
            super(BaseActionIDDef.BEHURT);
        }

        override protected function initThis():void
        {
            super.initThis();
            m_states[HurtState.NORMAL] = new NormalState(this);
            m_states[HurtState.STIFF] = new StiffState(this);
            m_states[HurtState.FLOAT] = new FloatState(this);
            m_states[HurtState.LIE] = new LieState(this);
            m_states[HurtState.GETUP] = new GetUpState(this);
            m_state = m_states[HurtState.NORMAL];
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            var _local_3:AttackInfo;
            var _local_4:Boolean;
            super.exec(_arg_1, _arg_2);
            if ((_arg_2 is AttackInfo)){
                _local_3 = (_arg_2 as AttackInfo);
                _local_4 = m_target.acceptDmg(_local_3);
                if (m_model.beHurtChangeDir == 1){
                    m_target.forceSetDirection(_local_3.dir);
                };
                if (!_local_4){
                    onNextState(m_state.accept(_local_3), _local_3);
                } else {
                    m_target.stopMove();
                    m_target.clearNextFrameFuncs(true);
                    m_view.stop();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_16()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_16 = " BeHurtAction" (String#14741)


