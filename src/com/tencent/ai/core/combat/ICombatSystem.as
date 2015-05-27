// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.ICombatSystem

package com.tencent.ai.core.combat
{
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.func.ISpecialFuncManager;

    public interface ICombatSystem 
    {

        function getDmgMeters():IDmgMetersManager;
        function getSpecialStatusManager():ISpecialStatusManager;
        function getSpecialFuncManager():ISpecialFuncManager;
        function newRound():void;
        function clearRound():void;

    }
}//package com.tencent.ai.core.combat

