package com.tencent.ai.core.events
{
    import flash.events.Event;

    public class AIEvent extends BaseEvent 
    {

        public static const ON_LEVEL_UPDATE:String = "onLevelUpdate";
        public static const ON_AI_INIT:String = "onAIInit";
        public static const ON_AI_LOGINED:String = "onAILogin";
        public static const ON_AICONTEXT_CHANGE:String = "onAIContextChange";
        public static const ON_LOGIN_INTRODUCE:String = "onLoginIntroduce";
        public static const ON_ACTIVE_CITY:String = "onActiveCity";
        public static const ON_DEACTIVE_CITY:String = "onDeactiveCity";
        public static const ON_CITY_PLAYER_CHANGE:String = "onCityPlayerChange";
        public static const ON_ENTER_CITY_SCENE:String = "onEnterCityScene";
        public static const ON_LEAVE_CITY_SCENE:String = "onLeaveCityScene";
        public static const ON_ACTIVE_HOMESTEAD:String = "onActiveHomestead";
        public static const ON_DEACTIVE_HOMESTEAD:String = "onDeactiveHomestead";
        public static const ON_ACTIVE_PET_FORTRESS:String = "onActivePetFortress";
        public static const ON_DEACTIVE_PET_FORTRESS:String = "onDeactivePetFortress";
        public static const ON_ACTIVE_PVP:String = "onActivePvp";
        public static const ON_DEACTIVE_PVP:String = "onDeactivePvp";
        public static const ON_ENTER_PVP:String = "onEnterPvp";
        public static const ON_LEAVE_PVP:String = "onLeavePvp";
        public static const ON_ENTER_HOMESTEAD:String = "onEnterHomestead";
        public static const ON_LEAVE_HOMESTEAD:String = "onLeaveHomestead";
        public static const ON_ENTER_PET_FORTRESS:String = "onEnterPetFortress";
        public static const ON_LEAVE_PET_FORTRESS:String = "onLeavePetFortress";
        public static const ON_BEFORE_LEAVE_CITY_SCENE:String = "onBeforeLeaveCityScene";
        public static const ON_ENTER_DUP_SELECT:String = "onEnterDupSelect";
        public static const ON_LEAVE_DUP_SELECT:String = "onLeaveDupSelect";
        public static const ON_DUP_PREPARE_RESOURCE:String = "onDupPrepareResource";
        public static const ON_ACTIVE_DUP:String = "onActiveDup";
        public static const ON_DEACTIVE_DUP:String = "onDeactiveDup";
        public static const ON_ENTER_DUP_SCENE:String = "onEnterDupScene";
        public static const ON_LEAVE_DUP_SCENE:String = "onLeaveDupScene";
        public static const ON_QUIT_DUP:String = "onQuitDup";
        public static const ON_DUP_LOADING_STATE:String = "onDupLoadingState";
        public static const ON_DUP_TIMELINE_END:String = "onDupTimelineEnd";
        public static const ON_DUP_COMPLETE:String = "onDupComplete";
        public static const ON_ACTIVE_COLOSSEUM:String = "onActiveColosseum";
        public static const ON_ACTIVE_EXTDUP:String = "onActiveExtDup";
        public static const ON_DEACTIVE_EXTDUP:String = "onDeactiveExtDup";
        public static const ON_ENTER_EXTDUP_SCENE:String = "onEnterExtDupScene";
        public static const ON_LEAVE_EXTDUP_SCENE:String = "onLeaveExtDupScene";
        public static const ON_SYSTEM_MSG:String = "onSystemMsg";
        public static const ON_TIME_UPDATE:String = "onTimeUpdate";
        public static const ON_DOOR_ACTIVE_DUP:String = "onDoorActiveDup";
        public static const ON_SHOW_MONSTER_TIP:String = "onShowMonsterTip";
        public static const ON_NPC_CLICK:String = "onNpcClick";
        public static const ON_CLIENT_MSG:String = "onClientMsg";
        public static const ON_DIALOG_OPEN:String = "onDialogOpen";
        public static const ON_DIALOG_CLOSE:String = "onDialogClose";
        public static const CASUAL_GAME_CLOSE:String = "casualGameClose";
        public static const ITEM_INTERACT:String = "itemInteract";
        public static const AUTORUN_END:String = "autorunEnd";
        public static const PLAYER_DEAD_LAY_DOWN:String = "playerDeadLayDown";
        public static const SPECIAL_MONSTERS_DEAD:String = "specialMonstersDead";
        public static const VIP_OPEN:String = "vipOpen";
        public static const VIP_CLOSE:String = "vipClose";
        public static const DUP_OTHER_PLAYER_QUIT:String = "dupOtherPlayerQuit";
        public static const ON_GAMEKEYBOARD_CHANGE:String = "onGameKeyBoardChange";
        public static const ON_CATCH_PET:String = "onCatchPet";
        public static const ON_SUPER_SHADOW_WIN:String = "onSuperShadowWin";
        public static const ON_PET_FORTRESS_ALPHA_CLICKED:String = "onPetFortressAlphaClicked";
        public static const ON_PET_STORAGE_ITEM_CLICK:String = "onPetStorageItemClick";
        public static const ON_PET_SELECT_BROADCAST:String = "onPetSelectClick";
        public static const ON_PET_BATTLE_REASULT:String = "onPetBattleReasult";
        public static const ON_PET_GOOD_BYE:String = "onPetGoodBye";

        public var arg:Object;

        public function AIEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

        override public function clone():Event
        {
            var event:AIEvent = new AIEvent(type);
            event.arg = this.arg;
            event.data = data;
            event.setTarget(m_target);
            return event;
        }

    }
}
