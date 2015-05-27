// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.ITargetHasSkill

package com.tencent.ai.core.script
{
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.actor.model.SkillModel;

    public interface ITargetHasSkill extends ITarget 
    {

        function getAttackDelegate():IAttackDelegate;
        function getSkillModel():SkillModel;

    }
}//package com.tencent.ai.core.script

