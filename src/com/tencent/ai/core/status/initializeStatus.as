package com.tencent.ai.core.status
{
    import com.tencent.ai.core.enum.SStatusEffectType;
    import com.tencent.ai.core.enum.SStatusEventType;
    import com.tencent.ai.core.enum.SpecialStatusType;
    import com.tencent.ai.core.enum.TriggerEventType;
    import com.tencent.ai.core.status.impl.SS_Adsorb;
    import com.tencent.ai.core.status.impl.SS_BornRecover;
    import com.tencent.ai.core.status.impl.SS_Captive;
    import com.tencent.ai.core.status.impl.SS_DonotMA;
    import com.tencent.ai.core.status.impl.SS_DonotMove;
    import com.tencent.ai.core.status.impl.SS_Frozen;
    import com.tencent.ai.core.status.impl.SS_Imba;
    import com.tencent.ai.core.status.impl.SS_Invincible;
    import com.tencent.ai.core.status.impl.SS_Petrifaction;
    import com.tencent.ai.core.status.impl.SS_Rampage;
    import com.tencent.ai.core.status.impl.SS_SimpleSpecialStatus;
    import com.tencent.ai.core.status.impl.SS_SuperArmor;
    import com.tencent.ai.core.status.impl.ssef.SSEF_AddAOS;
    import com.tencent.ai.core.status.impl.ssef.SSEF_AddMVEffect;
    import com.tencent.ai.core.status.impl.ssef.SSEF_AddStatus;
    import com.tencent.ai.core.status.impl.ssef.SSEF_KeepAddHMP;
    import com.tencent.ai.core.status.impl.ssef.SSEF_LetMeMove;
    import com.tencent.ai.core.status.impl.ssef.SSEF_ModifyModelValue;
    import com.tencent.ai.core.status.impl.ssef.SSEF_SetBodyAlpha;
    import com.tencent.ai.core.status.impl.ssef.SSEF_SpawnMonster;
    import com.tencent.ai.core.status.impl.ssev.SSEV_AttackEvent;
    import com.tencent.ai.core.status.impl.ssev.SSEV_BehurtEvent;
    import com.tencent.ai.core.status.impl.ssev.SSEV_StatusBegin;
    import com.tencent.ai.core.status.impl.ssev.SSEV_TriggerEvent;
    
    import flash.utils.Dictionary;

    public function initializeStatus():void
    {
        var statusMap:Dictionary = new Dictionary();
        SpecialStatusManager.STATUS_CLS_MAP = statusMap;
        statusMap[SpecialStatusType.CLASSID_SIMPLE] = SS_SimpleSpecialStatus;
        statusMap[SpecialStatusType.CLASSID_SUPERARMOR] = SS_SuperArmor;
        statusMap[SpecialStatusType.CLASSID_DONOT_MOVE] = SS_DonotMove;
        statusMap[SpecialStatusType.CLASSID_DONOT_MA] = SS_DonotMA;
        statusMap[SpecialStatusType.CLASSID_RAMPAGE] = SS_Rampage;
        statusMap[SpecialStatusType.CLASSID_CAPTIVE] = SS_Captive;
        statusMap[SpecialStatusType.CLASSID_PETRIFACTION] = SS_Petrifaction;
        statusMap[SpecialStatusType.CLASSID_FROZEN] = SS_Frozen;
        statusMap[SpecialStatusType.CLASSID_INVINCIBLE] = SS_Invincible;
        statusMap[SpecialStatusType.CLASSID_BORN_RECOVER] = SS_BornRecover;
        statusMap[SpecialStatusType.CLASSID_ADSORB] = SS_Adsorb;
        statusMap[SpecialStatusType.CLASSID_IMBA] = SS_Imba;
		
        var typeMap:Dictionary = new Dictionary();
        SStatus.SSEVENT_TYPES = typeMap;
        typeMap[SStatusEventType.STATUS_BEGIN] = SSEV_StatusBegin;
        typeMap[SStatusEventType.TRIGGER_EVENT] = SSEV_TriggerEvent;
        typeMap[SStatusEventType.BEHURT_EVENT] = SSEV_BehurtEvent;
        typeMap[SStatusEventType.ATTACK_EVENT] = SSEV_AttackEvent;
		
        var eventMap:Dictionary = new Dictionary();
        SStatus.TRIGGER_EVENT_MAP = eventMap;
        eventMap[4] = TriggerEventType.T_ON_TICK;
		
        var effectMap:Dictionary = new Dictionary();
        SStatus.SSEFFECT_TYPES = effectMap;
        effectMap[SStatusEffectType.MODIFY_MODEL_VALUE] = SSEF_ModifyModelValue;
        effectMap[SStatusEffectType.KEEP_ADD_HMP] = SSEF_KeepAddHMP;
        effectMap[SStatusEffectType.SPAWN_MONSTER] = SSEF_SpawnMonster;
        effectMap[SStatusEffectType.ADD_STATUS] = SSEF_AddStatus;
        effectMap[SStatusEffectType.ADD_MV_EFFECT] = SSEF_AddMVEffect;
        effectMap[SStatusEffectType.SET_BODY_ALPHA] = SSEF_SetBodyAlpha;
        effectMap[SStatusEffectType.LET_ME_MOVE] = SSEF_LetMeMove;
        effectMap[SStatusEffectType.ADD_AOS] = SSEF_AddAOS;
    }

}
