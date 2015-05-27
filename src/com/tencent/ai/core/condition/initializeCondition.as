package com.tencent.ai.core.condition
{
    import com.tencent.ai.core.condition.impl.CareerCondition;
    import com.tencent.ai.core.condition.impl.GoldenCoinCondition;
    import com.tencent.ai.core.condition.impl.HavePropCondition;
    import com.tencent.ai.core.condition.impl.KeyBoardTypeCondition;
    import com.tencent.ai.core.condition.impl.LevelCondition;
    import com.tencent.ai.core.condition.impl.MissionAcceptableCondition;
    import com.tencent.ai.core.condition.impl.MissionCommitCondition;
    import com.tencent.ai.core.condition.impl.ProcedureActiveCondition;
    import com.tencent.ai.core.condition.impl.SpecialStatusCondition;
    import com.tencent.ai.core.condition.impl.WearAvatarCondition;
    import com.tencent.ai.core.enum.ConditionType;
    
    import flash.utils.Dictionary;

    public function initializeCondition():void
    {
        var typeMap:Dictionary = new Dictionary();
        ConditionBuilder.getInstance();
        ConditionBuilder.CONDITION_TYPES = typeMap;
		
        typeMap[ConditionType.MAINPLAYER_LEVEL] = LevelCondition;
        typeMap[ConditionType.MAINPLAYER_HAVEPROP] = HavePropCondition;
        typeMap[ConditionType.MAINPLAYER_GOLDENCOIN] = GoldenCoinCondition;
        typeMap[ConditionType.MAINPLAYER_WEARAVATAR] = WearAvatarCondition;
        typeMap[ConditionType.MAINPLAYER_KEYBOARD_TYPE] = KeyBoardTypeCondition;
        typeMap[ConditionType.MISSION_COMMIT] = MissionCommitCondition;
        typeMap[ConditionType.MISSION_ACCEPT] = MissionAcceptableCondition;
        typeMap[ConditionType.MAINPLAYER_CAREER] = CareerCondition;
        typeMap[ConditionType.PROCEDURE_ACTIVE] = ProcedureActiveCondition;
        typeMap[ConditionType.TARGET_SPECIAL_STATUS] = SpecialStatusCondition;
    }

}
