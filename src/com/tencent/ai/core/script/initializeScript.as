package com.tencent.ai.core.script
{
    import com.tencent.ai.core.data.arg.plugin.initializePluginArg;
    import com.tencent.ai.core.data.arg.script.AcceptMissionArg;
    import com.tencent.ai.core.data.arg.script.AcceptVKeyArg;
    import com.tencent.ai.core.data.arg.script.AutoAIActArg;
    import com.tencent.ai.core.data.arg.script.BindPlotScriptArg;
    import com.tencent.ai.core.data.arg.script.BreakShadowScriptArg;
    import com.tencent.ai.core.data.arg.script.BubbleArg;
    import com.tencent.ai.core.data.arg.script.CBlurScriptArg;
    import com.tencent.ai.core.data.arg.script.CColorScriptArg;
    import com.tencent.ai.core.data.arg.script.CallPluginArg;
    import com.tencent.ai.core.data.arg.script.CancelActionArg;
    import com.tencent.ai.core.data.arg.script.ChangeCameraScriptArg;
    import com.tencent.ai.core.data.arg.script.ChangeStateArg;
    import com.tencent.ai.core.data.arg.script.ChangeTargetArg;
    import com.tencent.ai.core.data.arg.script.ClientCreateMonsterArg;
    import com.tencent.ai.core.data.arg.script.CommitMissionArg;
    import com.tencent.ai.core.data.arg.script.ControlScriptArg;
    import com.tencent.ai.core.data.arg.script.CopyShadowScriptArg;
    import com.tencent.ai.core.data.arg.script.CreateEffectArg;
    import com.tencent.ai.core.data.arg.script.CreateInteractArg;
    import com.tencent.ai.core.data.arg.script.CreateNpcScriptArg;
    import com.tencent.ai.core.data.arg.script.CreateParticleScriptArg;
    import com.tencent.ai.core.data.arg.script.FollowShadowArg;
    import com.tencent.ai.core.data.arg.script.InvokeIPicArg;
    import com.tencent.ai.core.data.arg.script.KillSpecialMonsterArg;
    import com.tencent.ai.core.data.arg.script.MoveActorScriptArg;
    import com.tencent.ai.core.data.arg.script.MoveScriptArg;
    import com.tencent.ai.core.data.arg.script.OffendScriptArg;
    import com.tencent.ai.core.data.arg.script.OffendUVScriptArg;
    import com.tencent.ai.core.data.arg.script.OpenDialogArg;
    import com.tencent.ai.core.data.arg.script.OssReportScriptArg;
    import com.tencent.ai.core.data.arg.script.PlaySoundScriptArg;
    import com.tencent.ai.core.data.arg.script.PrepareResourceArg;
    import com.tencent.ai.core.data.arg.script.QTEScriptArg;
    import com.tencent.ai.core.data.arg.script.RandomScriptArg;
    import com.tencent.ai.core.data.arg.script.RegistVariableScriptArg;
    import com.tencent.ai.core.data.arg.script.RemoveNpcScriptArg;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.data.arg.script.SearchElementScriptArg;
    import com.tencent.ai.core.data.arg.script.SearchMaxYArg;
    import com.tencent.ai.core.data.arg.script.SendProtocolArg;
    import com.tencent.ai.core.data.arg.script.ServerSpawnArg;
    import com.tencent.ai.core.data.arg.script.SetActorAttribArg;
    import com.tencent.ai.core.data.arg.script.SetConditionFlagArg;
    import com.tencent.ai.core.data.arg.script.SetGlobalValueArg;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.data.arg.script.SkillHurtArg;
    import com.tencent.ai.core.data.arg.script.SystemActivityArrowArg;
    import com.tencent.ai.core.data.arg.script.SystemAlertArg;
    import com.tencent.ai.core.data.arg.script.SystemArrowArg;
    import com.tencent.ai.core.data.arg.script.SystemDarkScreenScriptArg;
    import com.tencent.ai.core.data.arg.script.SystemDialogArg;
    import com.tencent.ai.core.data.arg.script.SystemGoArrowArg;
    import com.tencent.ai.core.data.arg.script.SystemKeyShowArg;
    import com.tencent.ai.core.data.arg.script.SystemMaskArg;
    import com.tencent.ai.core.data.arg.script.SystemNpcArrowArg;
    import com.tencent.ai.core.data.arg.script.SystemSceneArrowArg;
    import com.tencent.ai.core.data.arg.script.TargetAOEScriptArg;
    import com.tencent.ai.core.data.arg.script.TargetBeRidedArg;
    import com.tencent.ai.core.data.arg.script.TargetSkillArg;
    import com.tencent.ai.core.data.arg.script.ThrowArg;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;
    import com.tencent.ai.core.data.arg.script.TqosScriptArg;
    import com.tencent.ai.core.data.arg.script.VariableScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.script.impl.global.AcceptMissionScript;
    import com.tencent.ai.core.script.impl.global.ActivatePlotScript;
    import com.tencent.ai.core.script.impl.global.ActivateProcedure;
    import com.tencent.ai.core.script.impl.global.BindPlotScript;
    import com.tencent.ai.core.script.impl.global.BubbleScript;
    import com.tencent.ai.core.script.impl.global.CallCasualGameScript;
    import com.tencent.ai.core.script.impl.global.CloseDialogScript;
    import com.tencent.ai.core.script.impl.global.CommitMissionScript;
    import com.tencent.ai.core.script.impl.global.DeactivateProcedure;
    import com.tencent.ai.core.script.impl.global.DupCountDownScript;
    import com.tencent.ai.core.script.impl.global.DupCountTipScript;
    import com.tencent.ai.core.script.impl.global.DupMsgTipScript;
    import com.tencent.ai.core.script.impl.global.GotoDiffcultyDupScript;
    import com.tencent.ai.core.script.impl.global.HandlePlotScript;
    import com.tencent.ai.core.script.impl.global.KillSpecialMonstersScript;
    import com.tencent.ai.core.script.impl.global.MainBubbleScirpt;
    import com.tencent.ai.core.script.impl.global.OpenDialogScript;
    import com.tencent.ai.core.script.impl.global.OpenNpcDialogScript;
    import com.tencent.ai.core.script.impl.global.OpenSuperShadowScript;
    import com.tencent.ai.core.script.impl.global.OssReportScript;
    import com.tencent.ai.core.script.impl.global.PrepareResourceScript;
    import com.tencent.ai.core.script.impl.global.SendTqosScript;
    import com.tencent.ai.core.script.impl.global.SetConditionFlagScript;
    import com.tencent.ai.core.script.impl.global.actor.MakeActorActScript;
    import com.tencent.ai.core.script.impl.global.actor.SetActorAttribScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemActivityArrowScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemAlertScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemArrowScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemDarkScreenScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemDialogScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemGoArrowScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemKeyShowBarScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemMaskScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemNpcArrowScript;
    import com.tencent.ai.core.script.impl.global.guideSystemScript.SystemSceneArrowScript;
    import com.tencent.ai.core.script.impl.global.sys.CallPluginScript;
    import com.tencent.ai.core.script.impl.global.sys.ChangeCameraScript;
    import com.tencent.ai.core.script.impl.global.sys.ChangeDupSceneScript;
    import com.tencent.ai.core.script.impl.global.sys.ClientCDMonsterScript;
    import com.tencent.ai.core.script.impl.global.sys.CreateNpcScript;
    import com.tencent.ai.core.script.impl.global.sys.CreateSceneEffectScript;
    import com.tencent.ai.core.script.impl.global.sys.CreateSceneInteractScript;
    import com.tencent.ai.core.script.impl.global.sys.EnterCitySceneScript;
    import com.tencent.ai.core.script.impl.global.sys.EnterDuplicateScript;
    import com.tencent.ai.core.script.impl.global.sys.EnterPetFortressScript;
    import com.tencent.ai.core.script.impl.global.sys.FireClientMsgScript;
    import com.tencent.ai.core.script.impl.global.sys.LoginDuplicateScript;
    import com.tencent.ai.core.script.impl.global.sys.LogoutDuplicateScript;
    import com.tencent.ai.core.script.impl.global.sys.PlayMovieScript;
    import com.tencent.ai.core.script.impl.global.sys.PlaySoundScript;
    import com.tencent.ai.core.script.impl.global.sys.PvpScript;
    import com.tencent.ai.core.script.impl.global.sys.RemoveNpcScript;
    import com.tencent.ai.core.script.impl.global.sys.RemoveSceneInteractScript;
    import com.tencent.ai.core.script.impl.global.sys.ScreenShakeScript;
    import com.tencent.ai.core.script.impl.global.sys.SendProtocolScript;
    import com.tencent.ai.core.script.impl.global.sys.ServerSpawnMonsterScript;
    import com.tencent.ai.core.script.impl.global.sys.ServerSpawnMonsterScript2;
    import com.tencent.ai.core.script.impl.global.sys.SetGlobalValueScript;
    import com.tencent.ai.core.script.impl.target.AcceptVKeyScript;
    import com.tencent.ai.core.script.impl.target.ApplyFunctionScript;
    import com.tencent.ai.core.script.impl.target.BreakShadowScript;
    import com.tencent.ai.core.script.impl.target.CatchTargetScript;
    import com.tencent.ai.core.script.impl.target.ChangeStateScript;
    import com.tencent.ai.core.script.impl.target.ChangeTargetScript;
    import com.tencent.ai.core.script.impl.target.CityItemInteractScript;
    import com.tencent.ai.core.script.impl.target.ControlScript;
    import com.tencent.ai.core.script.impl.target.CopyShadowScript;
    import com.tencent.ai.core.script.impl.target.CreateEffectScript;
    import com.tencent.ai.core.script.impl.target.CreateInteractScript;
    import com.tencent.ai.core.script.impl.target.DupItemInteractScript;
    import com.tencent.ai.core.script.impl.target.FoundFlashScript;
    import com.tencent.ai.core.script.impl.target.HitScript;
    import com.tencent.ai.core.script.impl.target.JumpScript;
    import com.tencent.ai.core.script.impl.target.LandScript;
    import com.tencent.ai.core.script.impl.target.MoveActorScript;
    import com.tencent.ai.core.script.impl.target.MoveScript;
    import com.tencent.ai.core.script.impl.target.MultiScript;
    import com.tencent.ai.core.script.impl.target.ParticleEffectScript;
    import com.tencent.ai.core.script.impl.target.RandomScript;
    import com.tencent.ai.core.script.impl.target.SkillHurtScript;
    import com.tencent.ai.core.script.impl.target.TargetAOEScript;
    import com.tencent.ai.core.script.impl.target.TargetBeRidedScript;
    import com.tencent.ai.core.script.impl.target.TargetCBlurScript;
    import com.tencent.ai.core.script.impl.target.TargetCColorScript;
    import com.tencent.ai.core.script.impl.target.TargetCameraScript;
    import com.tencent.ai.core.script.impl.target.TargetClearAimsScript;
    import com.tencent.ai.core.script.impl.target.TargetFollowShadowScript;
    import com.tencent.ai.core.script.impl.target.TargetHideViewScript;
    import com.tencent.ai.core.script.impl.target.TargetInvokeIPicScript;
    import com.tencent.ai.core.script.impl.target.TargetMakkiScript;
    import com.tencent.ai.core.script.impl.target.TargetOffendScript;
    import com.tencent.ai.core.script.impl.target.TargetQTEScript;
    import com.tencent.ai.core.script.impl.target.TargetRegistVariableScript;
    import com.tencent.ai.core.script.impl.target.TargetSearchMaxYScript;
    import com.tencent.ai.core.script.impl.target.TargetShakeScript;
    import com.tencent.ai.core.script.impl.target.TargetSkillScript;
    import com.tencent.ai.core.script.impl.target.TargetSuicideScript;
    import com.tencent.ai.core.script.impl.target.TargetTimeChaseScript;
    import com.tencent.ai.core.script.impl.target.TargetUVOffendScript;
    import com.tencent.ai.core.script.impl.target.ThrowTargetScript;
    import com.tencent.ai.core.script.impl.target.VariableScript;
    
    import flash.utils.Dictionary;

    public function initializeScript():void
    {
        var argMap:Dictionary = ScriptArg.ARG_CLS_MAP;
        argMap[ScriptCmdDef.SC_ACCEPT_VKEY] = AcceptVKeyArg;
        argMap[ScriptCmdDef.SC_CANCEL_ACTION] = CancelActionArg;
        argMap[ScriptCmdDef.SC_CHANGE_TARGET] = ChangeTargetArg;
        argMap[ScriptCmdDef.SC_CREATE_EFFECT] = CreateEffectArg;
        argMap[ScriptCmdDef.SC_PARTICLE_EFFECT] = CreateParticleScriptArg;
        argMap[ScriptCmdDef.SC_CREATE_INTERACT] = CreateInteractArg;
        argMap[ScriptCmdDef.SC_MOVE] = MoveScriptArg;
        argMap[ScriptCmdDef.SC_MOVE_ACTOR] = MoveActorScriptArg;
        argMap[ScriptCmdDef.SC_THROW_TARGET] = ThrowArg;
        argMap[ScriptCmdDef.SC_CONTROL] = ControlScriptArg;
        argMap[ScriptCmdDef.SC_COPY_SHADOW] = CopyShadowScriptArg;
        argMap[ScriptCmdDef.SC_VARIABLE] = VariableScriptArg;
        argMap[ScriptCmdDef.SC_RANDOM] = RandomScriptArg;
        argMap[ScriptCmdDef.SC_SKILL_HURT] = SkillHurtArg;
        argMap[ScriptCmdDef.SC_BREAK_SHADOW] = BreakShadowScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_SHAKE] = ShakeScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_CCOLOR] = CColorScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_CBLUR] = CBlurScriptArg;
        argMap[ScriptCmdDef.SC_FOUND_FLASH] = SearchElementScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_AOE] = TargetAOEScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_SEARCH_MAX_Y] = SearchMaxYArg;
        argMap[ScriptCmdDef.SC_TARGET_OFFEND_SCRIPT] = OffendScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_TIME_CHASE_SCRIPT] = TimeChaseScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_FOLLOW_SHADOW] = FollowShadowArg;
        argMap[ScriptCmdDef.SC_TARGET_UV_OFFEND_SCRIPT] = OffendUVScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_REGIST_VAR] = RegistVariableScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_CAMERA] = ChangeCameraScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_QTE] = QTEScriptArg;
        argMap[ScriptCmdDef.SC_TARGET_INVOKE_IPIC] = InvokeIPicArg;
        argMap[ScriptCmdDef.SC_TARGET_SKILL] = TargetSkillArg;
        argMap[ScriptCmdDef.SC_TARGET_BERIDED] = TargetBeRidedArg;
        argMap[ScriptCmdDef.SC_CHANGE_INTERACTSTATE] = ChangeStateArg;
        argMap[ScriptCmdDef.SC_SCREEN_SHAKE] = ShakeScriptArg;
        argMap[ScriptCmdDef.SC_PLAY_SOUND] = PlaySoundScriptArg;
        argMap[ScriptCmdDef.SC_SEND_PROTOCOL] = SendProtocolArg;
        argMap[ScriptCmdDef.SC_OPEN_NPC_DIALOG] = OpenDialogArg;
        argMap[ScriptCmdDef.SC_CALL_PLUGIN] = CallPluginArg;
        argMap[ScriptCmdDef.SC_ACCEPT_MISSION] = AcceptMissionArg;
        argMap[ScriptCmdDef.SC_COMMIT_MISSION] = CommitMissionArg;
        argMap[ScriptCmdDef.SC_SET_CONDITION_FLAG] = SetConditionFlagArg;
        argMap[ScriptCmdDef.SC_SYSTEM_ALERT] = SystemAlertArg;
        argMap[ScriptCmdDef.SC_SYSTEM_ARROW] = SystemArrowArg;
        argMap[ScriptCmdDef.SC_SYSTEM_NPC_ARROW] = SystemNpcArrowArg;
        argMap[ScriptCmdDef.SC_SYSTEM_GO_ARROW] = SystemGoArrowArg;
        argMap[ScriptCmdDef.SC_SYSTEM_DIALOG] = SystemDialogArg;
        argMap[ScriptCmdDef.SC_SYSTEM_KEY_BAR] = SystemKeyShowArg;
        argMap[ScriptCmdDef.SC_SYSTEM_MASK] = SystemMaskArg;
        argMap[ScriptCmdDef.SC_SYSTEM_SCENE_ARROW] = SystemSceneArrowArg;
        argMap[ScriptCmdDef.SC_DARK_SCREEN] = SystemDarkScreenScriptArg;
        argMap[ScriptCmdDef.SC_KILL_SPECIAL_MONSTERS] = KillSpecialMonsterArg;
        argMap[ScriptCmdDef.SC_MAKE_ACTOR_ACT] = AutoAIActArg;
        argMap[ScriptCmdDef.SC_CREATE_MONSTER] = ClientCreateMonsterArg;
        argMap[ScriptCmdDef.SC_SET_ACTOR_ATTRIB] = SetActorAttribArg;
        argMap[ScriptCmdDef.SC_SET_GLOBAL_VALUE] = SetGlobalValueArg;
        argMap[ScriptCmdDef.SC_CREATE_SCENE_EFFECT] = CreateEffectArg;
        argMap[ScriptCmdDef.SC_CREATE_SCENE_INTERACT] = CreateInteractArg;
        argMap[ScriptCmdDef.SC_CREATE_NPC] = CreateNpcScriptArg;
        argMap[ScriptCmdDef.SC_REMOVE_NPC] = RemoveNpcScriptArg;
        argMap[ScriptCmdDef.SC_CHANGE_CAMERA] = ChangeCameraScriptArg;
        argMap[ScriptCmdDef.SC_SERVER_SPAWN_MONSTER] = ServerSpawnArg;
        argMap[ScriptCmdDef.SC_PREPARE_RESOURCE] = PrepareResourceArg;
        argMap[ScriptCmdDef.SC_BIND_PLOT] = BindPlotScriptArg;
        argMap[ScriptCmdDef.SC_SEND_TQOS] = TqosScriptArg;
        argMap[ScriptCmdDef.SC_SEND_OSS] = OssReportScriptArg;
        argMap[ScriptCmdDef.SC_BUBBLE] = BubbleArg;
        argMap[ScriptCmdDef.SC_SYSTEM_ACTIVITY_ARROW] = SystemActivityArrowArg;
        
		var scriptMap:Dictionary = new Dictionary();
        ScriptManager.SCRIPT_CLS_MAP = scriptMap;
        scriptMap[ScriptCmdDef.SC_MULTI] = MultiScript;
        scriptMap[ScriptCmdDef.SC_JUMP] = JumpScript;
        scriptMap[ScriptCmdDef.SC_LAND] = LandScript;
        scriptMap[ScriptCmdDef.SC_ACCEPT_VKEY] = AcceptVKeyScript;
        scriptMap[ScriptCmdDef.SC_MOVE] = MoveScript;
        scriptMap[ScriptCmdDef.SC_MOVE_ACTOR] = MoveActorScript;
        scriptMap[ScriptCmdDef.SC_CREATE_EFFECT] = CreateEffectScript;
        scriptMap[ScriptCmdDef.SC_PARTICLE_EFFECT] = ParticleEffectScript;
        scriptMap[ScriptCmdDef.SC_CONTROL] = ControlScript;
        scriptMap[ScriptCmdDef.SC_COPY_SHADOW] = CopyShadowScript;
        scriptMap[ScriptCmdDef.SC_VARIABLE] = VariableScript;
        scriptMap[ScriptCmdDef.SC_RANDOM] = RandomScript;
        scriptMap[ScriptCmdDef.SC_APPLY_FUNCTION] = ApplyFunctionScript;
        scriptMap[ScriptCmdDef.SC_CATCH_TARGET] = CatchTargetScript;
        scriptMap[ScriptCmdDef.SC_HIT_SCRIPT] = HitScript;
        scriptMap[ScriptCmdDef.SC_CHANGE_TARGET] = ChangeTargetScript;
        scriptMap[ScriptCmdDef.SC_THROW_TARGET] = ThrowTargetScript;
        scriptMap[ScriptCmdDef.SC_CREATE_INTERACT] = CreateInteractScript;
        scriptMap[ScriptCmdDef.SC_SKILL_HURT] = SkillHurtScript;
        scriptMap[ScriptCmdDef.SC_BREAK_SHADOW] = BreakShadowScript;
        scriptMap[ScriptCmdDef.SC_TARGET_SHAKE] = TargetShakeScript;
        scriptMap[ScriptCmdDef.SC_TARGET_CCOLOR] = TargetCColorScript;
        scriptMap[ScriptCmdDef.SC_TARGET_CBLUR] = TargetCBlurScript;
        scriptMap[ScriptCmdDef.SC_TARGET_MAKKI] = TargetMakkiScript;
        scriptMap[ScriptCmdDef.SC_FOUND_FLASH] = FoundFlashScript;
        scriptMap[ScriptCmdDef.SC_TARGET_AOE] = TargetAOEScript;
        scriptMap[ScriptCmdDef.SC_TARGET_SEARCH_MAX_Y] = TargetSearchMaxYScript;
        scriptMap[ScriptCmdDef.SC_TARGET_OFFEND_SCRIPT] = TargetOffendScript;
        scriptMap[ScriptCmdDef.SC_TARGET_TIME_CHASE_SCRIPT] = TargetTimeChaseScript;
        scriptMap[ScriptCmdDef.SC_TARGET_SUICIDE] = TargetSuicideScript;
        scriptMap[ScriptCmdDef.SC_TARGET_FOLLOW_SHADOW] = TargetFollowShadowScript;
        scriptMap[ScriptCmdDef.SC_TARGET_UV_OFFEND_SCRIPT] = TargetUVOffendScript;
        scriptMap[ScriptCmdDef.SC_TARGET_CLEAR_AIMS] = TargetClearAimsScript;
        scriptMap[ScriptCmdDef.SC_TARGET_HIDE_VIEW] = TargetHideViewScript;
        scriptMap[ScriptCmdDef.SC_TARGET_REGIST_VAR] = TargetRegistVariableScript;
        scriptMap[ScriptCmdDef.SC_TARGET_CAMERA] = TargetCameraScript;
        scriptMap[ScriptCmdDef.SC_TARGET_QTE] = TargetQTEScript;
        scriptMap[ScriptCmdDef.SC_TARGET_INVOKE_IPIC] = TargetInvokeIPicScript;
        scriptMap[ScriptCmdDef.SC_TARGET_SKILL] = TargetSkillScript;
        scriptMap[ScriptCmdDef.SC_TARGET_BERIDED] = TargetBeRidedScript;
        scriptMap[ScriptCmdDef.SC_CHANGE_INTERACTSTATE] = ChangeStateScript;
        scriptMap[ScriptCmdDef.SC_KILL_SPECIAL_MONSTERS] = KillSpecialMonstersScript;
        scriptMap[ScriptCmdDef.SC_DUP_MSG_TIP] = DupMsgTipScript;
        scriptMap[ScriptCmdDef.SC_DUP_COUNT_DOWN] = DupCountDownScript;
        scriptMap[ScriptCmdDef.SC_DUP_COUNT_TIP] = DupCountTipScript;
        scriptMap[ScriptCmdDef.SC_SCREEN_SHAKE] = ScreenShakeScript;
        scriptMap[ScriptCmdDef.SC_PLAY_SOUND] = PlaySoundScript;
        scriptMap[ScriptCmdDef.SC_PLAY_MOVIE] = PlayMovieScript;
        scriptMap[ScriptCmdDef.SC_SET_GLOBAL_VALUE] = SetGlobalValueScript;
        scriptMap[ScriptCmdDef.SC_FIRE_CLIENT_MSG] = FireClientMsgScript;
        scriptMap[ScriptCmdDef.SC_SEND_PROTOCOL] = SendProtocolScript;
        scriptMap[ScriptCmdDef.SC_ENTER_CITY_SCENE] = EnterCitySceneScript;
        scriptMap[ScriptCmdDef.SC_CHANGE_DUP_SCENE] = ChangeDupSceneScript;
        scriptMap[ScriptCmdDef.SC_LOGIN_DUPLICATE] = LoginDuplicateScript;
        scriptMap[ScriptCmdDef.SC_LOGOUT_DUPLICATE] = LogoutDuplicateScript;
        scriptMap[ScriptCmdDef.SC_ENTER_DUPLICATE] = EnterDuplicateScript;
        scriptMap[ScriptCmdDef.SC_ENTER_PETFORTRESS] = EnterPetFortressScript;
        scriptMap[ScriptCmdDef.SC_CALL_PLUGIN] = CallPluginScript;
        scriptMap[ScriptCmdDef.SC_CREATE_MONSTER] = ClientCDMonsterScript;
        scriptMap[ScriptCmdDef.SC_DELETE_MONSTER] = ClientCDMonsterScript;
        scriptMap[ScriptCmdDef.SC_OPEN_NPC_DIALOG] = OpenNpcDialogScript;
        scriptMap[ScriptCmdDef.SC_OPEN_DIALOG] = OpenDialogScript;
        scriptMap[ScriptCmdDef.SC_CLOSE_DIALOG] = CloseDialogScript;
        scriptMap[ScriptCmdDef.SC_CALL_CASUAL_GAME] = CallCasualGameScript;
        scriptMap[ScriptCmdDef.SC_CALL_BUBBLE] = MainBubbleScirpt;
        scriptMap[ScriptCmdDef.SC_CALL_GOTO_DUP_DIFFCULTY] = GotoDiffcultyDupScript;
        scriptMap[ScriptCmdDef.SC_ACCEPT_MISSION] = AcceptMissionScript;
        scriptMap[ScriptCmdDef.SC_COMMIT_MISSION] = CommitMissionScript;
        scriptMap[ScriptCmdDef.SC_SET_CONDITION_FLAG] = SetConditionFlagScript;
        scriptMap[ScriptCmdDef.SC_ACTIVATE_PLOT] = ActivatePlotScript;
        scriptMap[ScriptCmdDef.SC_DEACTIVATE_PLOT] = HandlePlotScript;
        scriptMap[ScriptCmdDef.SC_DELETE_PLOT] = HandlePlotScript;
        scriptMap[ScriptCmdDef.SC_ACTIVATE_PROCEDURE] = ActivateProcedure;
        scriptMap[ScriptCmdDef.SC_DEACTIVATE_PROCEDURE] = DeactivateProcedure;
        scriptMap[ScriptCmdDef.SC_CITYITEM_INTERACT] = CityItemInteractScript;
        scriptMap[ScriptCmdDef.SC_DUPITEM_INTERACT] = DupItemInteractScript;
        scriptMap[ScriptCmdDef.SC_PVP_CMD] = PvpScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_ALERT] = SystemAlertScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_ARROW] = SystemArrowScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_NPC_ARROW] = SystemNpcArrowScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_GO_ARROW] = SystemGoArrowScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_DIALOG] = SystemDialogScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_KEY_BAR] = SystemKeyShowBarScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_MASK] = SystemMaskScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_SCENE_ARROW] = SystemSceneArrowScript;
        scriptMap[ScriptCmdDef.SC_SYSTEM_ACTIVITY_ARROW] = SystemActivityArrowScript;
        scriptMap[ScriptCmdDef.SC_DARK_SCREEN] = SystemDarkScreenScript;
        scriptMap[ScriptCmdDef.SC_CREATE_NPC] = CreateNpcScript;
        scriptMap[ScriptCmdDef.SC_REMOVE_NPC] = RemoveNpcScript;
        scriptMap[ScriptCmdDef.SC_CHANGE_CAMERA] = ChangeCameraScript;
        scriptMap[ScriptCmdDef.SC_SERVER_SPAWN_MONSTER] = ServerSpawnMonsterScript;
        scriptMap[ScriptCmdDef.SC_SERVER_SPAWN_MONSTER2] = ServerSpawnMonsterScript2;
        scriptMap[ScriptCmdDef.SC_CREATE_SCENE_EFFECT] = CreateSceneEffectScript;
        scriptMap[ScriptCmdDef.SC_CREATE_SCENE_INTERACT] = CreateSceneInteractScript;
        scriptMap[ScriptCmdDef.SC_REMOVE_SCENE_INTERACT] = RemoveSceneInteractScript;
        scriptMap[ScriptCmdDef.SC_PREPARE_RESOURCE] = PrepareResourceScript;
        scriptMap[ScriptCmdDef.SC_BIND_PLOT] = BindPlotScript;
        scriptMap[ScriptCmdDef.SC_OPEN_SUPERSHADOW] = OpenSuperShadowScript;
        scriptMap[ScriptCmdDef.SC_SEND_TQOS] = SendTqosScript;
        scriptMap[ScriptCmdDef.SC_SEND_OSS] = OssReportScript;
        scriptMap[ScriptCmdDef.SC_BUBBLE] = BubbleScript;
        scriptMap[ScriptCmdDef.SC_MAKE_ACTOR_ACT] = MakeActorActScript;
        scriptMap[ScriptCmdDef.SC_SET_ACTOR_ATTRIB] = SetActorAttribScript;
        
		ScriptManager.M_TARGET_TYPES = [
			[
				ScriptCmdDef.SC_MULTI,
				ScriptCmdDef.SC_JUMP,
				ScriptCmdDef.SC_LAND,
				ScriptCmdDef.SC_ACCEPT_VKEY,
				ScriptCmdDef.SC_MOVE,
				ScriptCmdDef.SC_CREATE_EFFECT,
				ScriptCmdDef.SC_PARTICLE_EFFECT,
				ScriptCmdDef.SC_CREATE_INTERACT,
				ScriptCmdDef.SC_CONTROL,
				ScriptCmdDef.SC_COPY_SHADOW,
				ScriptCmdDef.SC_VARIABLE,
				ScriptCmdDef.SC_RANDOM,
				ScriptCmdDef.SC_TARGET_SHAKE,
				ScriptCmdDef.SC_TARGET_CCOLOR,
				ScriptCmdDef.SC_TARGET_CBLUR,
				ScriptCmdDef.SC_TARGET_BERIDED
			],
			[
				ScriptCmdDef.SC_APPLY_FUNCTION,
				ScriptCmdDef.SC_CATCH_TARGET,
				ScriptCmdDef.SC_HIT_SCRIPT,
				ScriptCmdDef.SC_CHANGE_TARGET,
				ScriptCmdDef.SC_THROW_TARGET,
				ScriptCmdDef.SC_MOVE_ACTOR,
				ScriptCmdDef.SC_SKILL_HURT,
				ScriptCmdDef.SC_BREAK_SHADOW,
				ScriptCmdDef.SC_TARGET_MAKKI,
				ScriptCmdDef.SC_FOUND_FLASH,
				ScriptCmdDef.SC_TARGET_AOE,
				ScriptCmdDef.SC_TARGET_SEARCH_MAX_Y,
				ScriptCmdDef.SC_TARGET_OFFEND_SCRIPT,
				ScriptCmdDef.SC_TARGET_UV_OFFEND_SCRIPT,
				ScriptCmdDef.SC_TARGET_TIME_CHASE_SCRIPT,
				ScriptCmdDef.SC_TARGET_SUICIDE,
				ScriptCmdDef.SC_TARGET_FOLLOW_SHADOW,
				ScriptCmdDef.SC_TARGET_CLEAR_AIMS,
				ScriptCmdDef.SC_TARGET_HIDE_VIEW,
				ScriptCmdDef.SC_TARGET_REGIST_VAR,
				ScriptCmdDef.SC_TARGET_CAMERA,
				ScriptCmdDef.SC_TARGET_QTE,
				ScriptCmdDef.SC_TARGET_INVOKE_IPIC,
				ScriptCmdDef.SC_TARGET_SKILL
			]
		];
		
        var instanceMap:Dictionary = new Dictionary();
        ScriptManager.G_SCRIPT_INSTANCE = instanceMap;
        var cmdList:Array = [
			ScriptCmdDef.SC_SCREEN_SHAKE,
			ScriptCmdDef.SC_PLAY_SOUND,
			ScriptCmdDef.SC_PLAY_MOVIE,
			ScriptCmdDef.SC_SET_GLOBAL_VALUE,
			ScriptCmdDef.SC_FIRE_CLIENT_MSG,
			ScriptCmdDef.SC_MAKE_ACTOR_ACT,
			ScriptCmdDef.SC_CREATE_MONSTER,
			ScriptCmdDef.SC_DELETE_MONSTER,
			ScriptCmdDef.SC_ACTIVATE_PLOT,
			ScriptCmdDef.SC_DELETE_PLOT,
			ScriptCmdDef.SC_DEACTIVATE_PLOT,
			ScriptCmdDef.SC_CALL_PLUGIN,
			ScriptCmdDef.SC_CALL_CASUAL_GAME,
			ScriptCmdDef.SC_CALL_GOTO_DUP_DIFFCULTY,
			ScriptCmdDef.SC_CALL_INDULGE,
			ScriptCmdDef.SC_ACCEPT_MISSION,
			ScriptCmdDef.SC_COMMIT_MISSION,
			ScriptCmdDef.SC_ENTER_CITY_SCENE
		];
		
        var manager:IScriptManager = ScriptManager.getInstance();
        var index:int = 0;
        while (index < cmdList.length) {
			var cmd:String = cmdList[index];
			var script:IScript = manager.newScript(cmd);
            instanceMap[cmd] = script;
            index++;
        }
        initializePluginArg();
    }

}
