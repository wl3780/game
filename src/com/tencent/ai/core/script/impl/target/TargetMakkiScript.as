// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetMakkiScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.model.OpMultiplyValue;
    import com.tencent.ai.core.actor.model.OpSetValue;
    import com.tencent.ai.core.actor.model.OpNumerical;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import com.tencent.ai.core.enum.HoldFlagDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1239;

    public class TargetMakkiScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;
        protected var m_isMakki:Boolean;
        protected var m_model:ActorModel;
        protected var m_opXMove:OpMultiplyValue;
        protected var m_opHoldFlag:OpSetValue;
        protected var m_opFinalReduce:OpNumerical;

        public function TargetMakkiScript()
        {
            this.m_isMakki = false;
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (!this.m_isMakki){
                if (this.m_opXMove == null){
                    this.m_opXMove = new OpMultiplyValue(AN.H_X_RATE, 0.3, 0, OpAttribItem.PRIORITY_MIDDLE);
                    this.m_opHoldFlag = new OpSetValue(AN.H_FLAG, HoldFlagDef.HOLD_SUPERARMOR, 0, OpAttribItem.PRIORITY_MIDDLE);
                    this.m_opFinalReduce = new OpNumerical(AN.FINAL_REDUCE_RATE, false, 0, 0, 1, OpAttribItem.PRIORITY_MIDDLE);
                };
                this.m_opFinalReduce.value = this.m_target.getAttackDelegate().skillInfo.dmg_rate;
                this.m_model = this.m_target.model;
                this.m_model.addOpAttribItem(this.m_opXMove);
                this.m_model.addOpAttribItem(this.m_opHoldFlag);
                this.m_model.addOpAttribItem(this.m_opFinalReduce);
                this.m_target.addLastRS(this);
                this.m_isMakki = true;
            };
        }

        public function stop():void
        {
            this.m_model.removeOpAttribItem(this.m_opXMove);
            this.m_model.removeOpAttribItem(this.m_opHoldFlag);
            this.m_model.removeOpAttribItem(this.m_opFinalReduce);
            this.m_isMakki = false;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_MAKKI);
        }

        public /*  ©init. */ function _SafeStr_1239()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1239 = " TargetMakkiScript" (String#14837)


