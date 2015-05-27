// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.actions.PetDeadAction

package com.tencent.ai.core.pet.actions
{
    import com.tencent.ai.core.action.DeadAction;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.monster.actions.MonsterDeadAction;
    import com.tencent.ai.core.pet.BasePet;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_820;

    public class PetDeadAction extends DeadAction 
    {

        protected var m_lieTimes:int;


        override protected function gotoHell():void
        {
            this.m_lieTimes = 9;
            m_target.onScript(ScriptCmdDef.SC_TARGET_CCOLOR, MonsterDeadAction._WHITEArg);
            var _local_1:BasePlayer = ((m_target as BasePet).getPetInfo().masterElement as BasePlayer);
            if (((_local_1) && (_local_1.isMain()))){
                AICore.data.mainModel.petDataManager.followPet(0, 1);
            };
        }

        public /*  ©init. */ function _SafeStr_820()
        {
        }


    }
}//package com.tencent.ai.core.pet.actions

// _SafeStr_820 = " PetDeadAction" (String#15440)


