// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.DeadAction

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.action.hurt.BaseHurtAction;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.action.hurt.HurtState;
    import com.tencent.ai.core.action.hurt.DeadNormalState;
    import com.tencent.ai.core.action.hurt.FloatState;
    import com.tencent.ai.core.action.hurt.DeadLieState;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.actor.IElementController;
    import com.tencent.ai.core.data.SkillInfo;
    import  ©init._SafeStr_20;

    public class DeadAction extends BaseHurtAction 
    {

        protected var m_attackInfo:AttackInfo;

        public function DeadAction()
        {
            super(BaseActionIDDef.DEAD);
        }

        override protected function initThis():void
        {
            super.initThis();
            m_states[HurtState.NORMAL] = new DeadNormalState(this);
            m_states[HurtState.FLOAT] = new FloatState(this);
            m_states[HurtState.LIE] = new DeadLieState(this, new CFunction(this.gotoHell, this));
            m_state = m_states[HurtState.NORMAL];
        }

        override public function handleHurt(_arg_1:IElementController, _arg_2:AttackInfo):Boolean
        {
            _arg_1.actHurtAction(BaseActionIDDef.DEAD, VKeyDef.DEAD, _arg_2);
            return (true);
        }

        protected function gotoHell():void
        {
        }

        override public function beHurt(_arg_1:AttackInfo):Boolean
        {
            return (!((m_state is DeadLieState)));
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            var _local_4:SkillInfo;
            super.exec(_arg_1, _arg_2);
            var _local_3:AttackInfo = (_arg_2 as AttackInfo);
            if (_local_3 != null){
                m_target.acceptDmg(_local_3);
                m_target.setDirection(_local_3.dir);
            };
            if (_local_3 == null){
                if (this.m_attackInfo == null){
                    this.m_attackInfo = AttackInfo.newInstance();
                    _local_4 = new SkillInfo();
                    this.m_attackInfo.skillInfo = _local_4;
                    _local_4.powerX = 800;
                    _local_4.powerY = 1500;
                    _local_4.powerX2 = 800;
                    _local_4.powerY2 = 1500;
                    _local_4.randomDY = 600;
                };
                this.m_attackInfo.dir = m_target.getDirection();
                _local_3 = this.m_attackInfo;
            };
            onNextState(m_state.accept(_local_3), _local_3);
        }

        public /*  ©init. */ function _SafeStr_20()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_20 = " DeadAction" (String#14027)


