package com.tencent.ai.core.triggerEvent
{
    import com.tencent.ai.core.enum.TriggerEventType;
    import com.tencent.ai.core.triggerEvent.impl.global.AfterCmdCallTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.AlphaClickTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.AutoActTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.BeatHurtCountTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DialogCloseTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DupAgentActorChangeTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DupCountTipEndTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DupEndTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DupHaveGuildTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DupLeftMonsterNumTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.DupPetBeCatchTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.EnterCitySceneTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.EnterDupSceneTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.EnterPvpTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.EnterSelfPetFortressTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.GameCloseTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.GuideSystemTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.InervalTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.ItemInteractTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.KillMonsterCountTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.KillMonsterTypeTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.KillMonstersTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.LeaveDupSceneTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.LeavePvpTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.LeaveSceneTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.LevelPetFortressTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.MainPlayerDeadTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.MissionTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.MovieTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.NpcClickTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.SpawnEventTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.SpecialDupCountEndTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.global.SpecialMonstersDeadTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.BeClickTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.EnterRangeTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.ExitRangeTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.InRangeTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.InteractHPChangeTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.LandTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.MouseOverTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.MoveTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.PlayEndTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.TargetActionTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.TargetBeHurtTriggerEvent;
    import com.tencent.ai.core.triggerEvent.impl.target.TargetTickTriggerEvent;
    
    import flash.utils.Dictionary;

    public function initializeTriggerEvent():void
    {
        var eventMap:Dictionary = new Dictionary();
        TriggerEventBuilder.getInstance();
        TriggerEventBuilder.TIGGER_EVENT_TYPES = eventMap;
		
        eventMap[TriggerEventType.G_NPC_CLICK] = NpcClickTriggerEvent;
        eventMap[TriggerEventType.G_ENTER_CITY_SCENE] = EnterCitySceneTriggerEvent;
        eventMap[TriggerEventType.G_ENTER_DUP_SCENE] = EnterDupSceneTriggerEvent;
        eventMap[TriggerEventType.G_LEAVE_DUP_SCENE] = LeaveDupSceneTriggerEvent;
        eventMap[TriggerEventType.G_MOVIE_EVENT] = MovieTriggerEvent;
        eventMap[TriggerEventType.G_AUTO_ACT_EVENT] = AutoActTriggerEvent;
        eventMap[TriggerEventType.G_GUIDESYSTEM_EVENT] = GuideSystemTriggerEvent;
        eventMap[TriggerEventType.G_SPAWN_MONSTER] = SpawnEventTriggerEvent;
        eventMap[TriggerEventType.G_KILL_MONSTERS] = KillMonstersTriggerEvent;
        eventMap[TriggerEventType.G_MISSION_COMMIT] = MissionTriggerEvent;
        eventMap[TriggerEventType.G_LEAVE_SCENE] = LeaveSceneTriggerEvent;
        eventMap[TriggerEventType.G_ENTER_PVP] = EnterPvpTriggerEvent;
        eventMap[TriggerEventType.G_LEAVE_PVP] = LeavePvpTriggerEvent;
        eventMap[TriggerEventType.G_LEVEL_PET_FORTRESS] = LevelPetFortressTriggerEvent;
        eventMap[TriggerEventType.G_ON_GAMECLOSE] = GameCloseTriggerEvent;
        eventMap[TriggerEventType.G_ON_ITEMINTERACT] = ItemInteractTriggerEvent;
        eventMap[TriggerEventType.G_ON_DIALOG_CLOSE] = DialogCloseTriggerEvent;
        eventMap[TriggerEventType.G_ON_INTERVAL] = InervalTriggerEvent;
        eventMap[TriggerEventType.G_AFTER_CMD_CALL_EVENT] = AfterCmdCallTriggerEvent;
        eventMap[TriggerEventType.G_SPECIAL_MONSTER_DEAD_EVENT] = SpecialMonstersDeadTriggerEvent;
        eventMap[TriggerEventType.G_DUP_SPECIAL_COUNT_END_EVENT] = SpecialDupCountEndTriggerEvent;
        eventMap[TriggerEventType.G_BEAT_HURT_COUNT_EVENT] = BeatHurtCountTriggerEvent;
        eventMap[TriggerEventType.G_KILL_MONSTER_COUNT_EVENT] = KillMonsterCountTriggerEvent;
        eventMap[TriggerEventType.G_KILL_MONSTER_TYPE] = KillMonsterTypeTriggerEvent;
        eventMap[TriggerEventType.G_DUP_LEFT_MONSTER_NUM] = DupLeftMonsterNumTriggerEvent;
        eventMap[TriggerEventType.G_DUP_COUNT_TIP_END] = DupCountTipEndTriggerEvent;
        eventMap[TriggerEventType.G_DUP_HAVE_GUILD] = DupHaveGuildTriggerEvent;
        eventMap[TriggerEventType.G_AGENT_ACTOR_CHANGE] = DupAgentActorChangeTriggerEvent;
        eventMap[TriggerEventType.G_MAIN_PLAYER_DEAD] = MainPlayerDeadTriggerEvent;
        eventMap[TriggerEventType.G_DUP_END] = DupEndTriggerEvent;
        eventMap[TriggerEventType.G_ENTER_SELF_PET_FORTRESS] = EnterSelfPetFortressTriggerEvent;
        eventMap[TriggerEventType.G_PET_FORTRESS_ALPHA_CLICKED] = AlphaClickTriggerEvent;
        eventMap[TriggerEventType.G_PET_BE_CATCH_EVENT] = DupPetBeCatchTriggerEvent;
        eventMap[TriggerEventType.T_ON_TICK] = TargetTickTriggerEvent;
        eventMap[TriggerEventType.T_ACTION_EVENT] = TargetActionTriggerEvent;
        eventMap[TriggerEventType.T_BE_HURT] = TargetBeHurtTriggerEvent;
        eventMap[TriggerEventType.T_BE_ClICK] = BeClickTriggerEvent;
        eventMap[TriggerEventType.T_MOUSE_OVER] = MouseOverTriggerEvent;
        eventMap[TriggerEventType.T_ENTER_RANGE] = EnterRangeTriggerEvent;
        eventMap[TriggerEventType.T_EXIT_RANGE] = ExitRangeTriggerEvent;
        eventMap[TriggerEventType.T_IN_RANGE] = InRangeTriggerEvent;
        eventMap[TriggerEventType.T_INTERACTHP_CHANGE] = InteractHPChangeTriggerEvent;
        eventMap[TriggerEventType.T_ON_PLAYEND] = PlayEndTriggerEvent;
        eventMap[TriggerEventType.T_ON_LAND] = LandTriggerEvent;
        eventMap[TriggerEventType.T_ON_MOVE] = MoveTriggerEvent;
    }

}
