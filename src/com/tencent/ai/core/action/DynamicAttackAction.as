// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.DynamicAttackAction

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.impl.AttackDelegate;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.enum.ActionType;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.script.build_scripts;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.data.SkillInfo;
    import  ©init._SafeStr_22;

    public class DynamicAttackAction extends DynamicAction implements ITargetHasSkill 
    {

        protected var m_attackDelegate:AttackDelegate;
        protected var m_skillModel:SkillModel;
        private var _skillVars:Array;

        public function DynamicAttackAction(_arg_1:int)
        {
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            this._skillVars = [];
            m_actionType = ActionType.ATTACK;
            this.m_attackDelegate = new AttackDelegate();
            m_events[MotionDef.L_HIT] = new CFunction(this.m_attackDelegate.collisionNow, this.m_attackDelegate);
            build_scripts(1, this);
        }

        protected function getSkillVar(_arg_1:int):Variable
        {
            var _local_2:Variable = this._skillVars[_arg_1];
            if (_local_2 == null){
                _local_2 = new Variable(_arg_1);
                this._skillVars[_arg_1] = _local_2;
            };
            return (_local_2);
        }

        override protected function activeAction():void
        {
            super.activeAction();
            m_model.isAttacking = true;
            var _local_1:int = m_model.attack_v;
            if (_local_1 < DEFINE.ATTACK_V_MIN){
                _local_1 = DEFINE.ATTACK_V_MIN;
            } else {
                if (_local_1 > DEFINE.ATTACK_V_MAX){
                    _local_1 = DEFINE.ATTACK_V_MAX;
                };
            };
            m_view.setPlayParam((DEFINE.ATTACK_V_X0 / _local_1), DEFINE.ATTACK_V_B);
            m_view.addFrameListener(MotionDef.L_HIT, this);
        }

        override protected function inactiveAction():void
        {
            var _local_1:SkillModel = this.m_skillModel;
            this.m_skillModel = null;
            m_model.isAttacking = false;
            m_view.removeFrameListener(MotionDef.L_HIT, this);
            m_model.onSkillUsed(_local_1);
            this.m_attackDelegate.inactive();
            super.inactiveAction();
        }

        override public function setScene(_arg_1:IScene):void
        {
            super.setScene(_arg_1);
            this.m_attackDelegate.bindScene(_arg_1);
        }

        override public function setCurrentState(_arg_1:int):void
        {
            this.m_attackDelegate.hitScriptFunc = null;
            this.m_attackDelegate.clearAims();
            super.setCurrentState(_arg_1);
            this.m_skillModel = m_model.getSkillModel(m_actionID);
            this.m_skillModel.useIndex(_arg_1);
            this.m_attackDelegate.setSkillInfo(this.m_skillModel.info);
        }

        override public function attach(_arg_1:Object):void
        {
            super.attach(_arg_1);
            this.m_attackDelegate.bindTarget((_arg_1 as InteractElement), m_model);
        }

        public function getSkillModel():SkillModel
        {
            return (this.m_skillModel);
        }

        public function getAttackDelegate():IAttackDelegate
        {
            return (this.m_attackDelegate);
        }

        override public function getVariable(_arg_1:int, _arg_2:Boolean=false):Variable
        {
            var _local_4:Variable;
            var _local_3:SkillInfo = this.m_attackDelegate.skillInfo;
            if (_arg_1 == 2){
                _local_4 = this.getSkillVar(0);
                _local_4.value = (((_local_3 == null)) ? 0 : _local_3.variable0);
            } else {
                if (_arg_1 == 3){
                    _local_4 = this.getSkillVar(1);
                    _local_4.value = (((_local_3 == null)) ? 0 : _local_3.variable1);
                } else {
                    _local_4 = super.getVariable(_arg_1, _arg_2);
                };
            };
            return (_local_4);
        }

        override public function clearVirgations():void
        {
            super.clearVirgations();
            this.m_attackDelegate.hitScriptFunc = null;
        }

        public /*  ©init. */ function _SafeStr_22()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_22 = " DynamicAttackAction" (String#15587)


