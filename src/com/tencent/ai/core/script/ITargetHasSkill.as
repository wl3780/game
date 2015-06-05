package com.tencent.ai.core.script
{
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.combat.IAttackDelegate;

    public interface ITargetHasSkill extends ITarget 
    {

        function getAttackDelegate():IAttackDelegate;
        function getSkillModel():SkillModel;

    }
}
