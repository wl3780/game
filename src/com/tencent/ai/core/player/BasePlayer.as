// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.BasePlayer

package com.tencent.ai.core.player
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.protect.IProtectModule;
    import com.tencent.ai.core.render.AdjustColorStyle;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.TeamTagInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.player.view.AIPlayerView;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.utils.VipUtil;
    import com.tencent.ai.core.events.BaseEvent;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.ai.core.data.FamilyInfo;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.events.PlayerModelEvent;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.PayData;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.player.actions.PlayerIDELAction;
    import com.tencent.ai.core.player.actions.PlayerWalkAction;
    import com.tencent.ai.core.player.actions.PlayerRunAction;
    import com.tencent.ai.core.player.actions.PlayerJumpAction;
    import com.tencent.ai.core.player.actions.PlayerPickupAction;
    import com.tencent.ai.core.player.actions.PlayerRideAction;
    import com.tencent.ai.core.action.BeHurtAction;
    import com.tencent.ai.core.action.CaughtAction;
    import com.tencent.ai.core.action.BethrownAction;
    import com.tencent.ai.core.action.CaptiveAction;
    import com.tencent.ai.core.player.actions.PlayerDeadAction;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.VisibleValueDef;
    import  ©init._SafeStr_852;
    import __AS3__.vec.*;

    public class BasePlayer extends BaseActor implements IVKeyInterceptTarget 
    {

        private static var _PROTECT_M:IProtectModule;
        private static var _GHOST_COLOR:AdjustColorStyle;

        protected var m_vkeyIntercepts:Vector.<IVKeyIntercept>;
        protected var m_effectInfo:EffectInfo;
        protected var m_visibleValue:int = 0;
        protected var m_showCareerName:Boolean;
        protected var m_teamTagInfo:TeamTagInfo;
        private var _ghostFlag:Boolean;
        private var _ghostKeyFunc:Function;
        private var _preNextFrameFuncParams:Array;

        public function BasePlayer()
        {
            super(ElementType.ET_PLAYER, new PlayerModel());
        }

        private function createEffectInfo(_arg_1:int):void
        {
            if (this.m_effectInfo == null){
                this.m_effectInfo = new EffectInfo();
                this.m_effectInfo.location = new MapPosition();
            };
            this.m_effectInfo.eid = _arg_1;
            this.m_effectInfo.location.deepOffset = 0;
            m_actorView.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
        }

        private function reflashHeadName(_arg_1:BaseEvent=null, _arg_2:Boolean=true):void
        {
            var _local_5:String;
            var _local_6:uint;
            this.m_showCareerName = _arg_2;
            var _local_3:AIPlayerView = this.getPlayerView();
            var _local_4:PlayerInfo = (m_model.getBindInfo() as PlayerInfo);
            _local_3.height = actorHeight;
            if (_local_4.isMain){
                _local_6 = ((((_local_4.vipInfo) && (_local_4.vipInfo.isVip))) ? VipUtil.getVipColor(_local_4.vipInfo) : 15839097);
                _local_5 = (((((("<textformat leading='2'><font color='#" + _local_6.toString(16)) + "'>Lv.") + this.m_model.level) + "  ") + _local_4.name) + "</font></textformat>");
            } else {
                if (((((this.m_teamTagInfo) && (this.m_teamTagInfo.inTeam))) && (this.m_teamTagInfo.containsMainPlayer))){
                    _local_6 = ((((_local_4.vipInfo) && (_local_4.vipInfo.isVip))) ? VipUtil.getVipColor(_local_4.vipInfo) : 4325289);
                    _local_5 = (((((("<textformat leading='2'><font color='#" + _local_6.toString(16)) + "'>Lv.") + this.m_model.level) + "  ") + _local_4.name) + "</font></textformat>");
                } else {
                    _local_5 = ((("Lv." + this.m_model.level) + "  ") + _local_4.name);
                    if (((_local_4.vipInfo) && (_local_4.vipInfo.isVip))){
                        _local_5 = (((("<textformat leading='2'><font color='#" + VipUtil.getVipColor(_local_4.vipInfo).toString(16)) + "'>") + _local_5) + "</font></textformat>");
                    };
                };
            };
            if (_arg_2){
                _local_3.setHeadText(((("<textformat leading='2'><font color='#ff6600'> " + _local_4.getTitle()) + "</font>\n</textformat>") + _local_5), (_arg_1 == null));
            } else {
                _local_3.setHeadText(_local_5, (_arg_1 == null));
            };
        }

        public function refreshVipState(_arg_1:VipSimpleInfo):void
        {
            var _local_2:PlayerInfo = (m_model.getBindInfo() as PlayerInfo);
            ((_local_2) && ((_local_2.vipInfo = _arg_1)));
            ((_local_2.vipInfo) && (this.getPlayerView().showVipInfo(_local_2.vipInfo)));
            this.reflashHeadName(null, this.m_showCareerName);
        }

        public function refreshFamilyStatus(_arg_1:FamilyInfo):void
        {
            this.getPlayerView().showFamily(_arg_1);
        }

        public function setHeadNameColor(_arg_1:uint):void
        {
            var _local_2:AIPlayerView = this.getPlayerView();
            var _local_3:String = _local_2.getHeadPureText();
            _local_3 = (((("<textformat leading='2'><font color='#" + _arg_1.toString(16)) + "'>") + _local_3) + "</font></textformat>");
            _local_2.setHeadText(_local_3, false);
        }

        public function addEquipEffect():void
        {
            addEventListener(ElementEvent.ON_DIR_CHANGE, this.changeDirectionHandler);
            ((m_model) && (m_model.addEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.actionChangeHandler)));
            this.getPlayerView().addEquipEffect(m_actorView);
        }

        public function removeEquipEffect():void
        {
            removeEventListener(ElementEvent.ON_DIR_CHANGE, this.changeDirectionHandler);
            ((m_model) && (m_model.removeEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.actionChangeHandler)));
            this.getPlayerView().removeEquipEffect(m_actorView);
        }

        private function onPlayerAvatarUpdate(_arg_1:PlayerModelEvent):void
        {
            var _local_2:Object = _arg_1.data;
            var _local_3:int = int(_local_2.iPos);
            var _local_4:PlayerEquipsID = (_local_2.data as PlayerEquipsID);
            if (PlayerEquipsID.IS_SHOW_POS(_local_3)){
                this.getPlayerView().updateEquipsAsset(_local_4, m_actorView);
            } else {
                if (_local_3 == PlayerEquipsID.BADGE_I){
                    this.checkBadge(_local_4);
                };
            };
        }

        private function changeDirectionHandler(_arg_1:ElementEvent):void
        {
            this.getPlayerView().changeDirection(m_actorView);
        }

        private function actionChangeHandler(_arg_1:ActorModelEvent):void
        {
            var _local_2:ActionInfo = (_arg_1.data as ActionInfo);
            this.getPlayerView().changeAction(_local_2);
        }

        private function onTeamTagInfoChange(_arg_1:PlayerModelEvent):void
        {
            this.m_teamTagInfo = (_arg_1.data as TeamTagInfo);
            var _local_2:Boolean = ((this.m_teamTagInfo.inTeam) && (!(this.m_teamTagInfo.isFull)));
            if (_local_2){
                this.getPlayerView().showTeamTagInfo(this.m_teamTagInfo);
            } else {
                this.getPlayerView().hideTeamTagInfo();
            };
            this.reflashHeadName(null, !(_local_2));
        }

        private function onNameChange(_arg_1:PlayerModelEvent):void
        {
            this.reflashHeadName(null, this.m_showCareerName);
        }

        private function onPayDataUpdate(_arg_1:PlayerModelEvent):void
        {
            var _local_2:PayData = this.getPlayerInfo().payData;
            this.getPlayerView().showNameTitle(_local_2.nameTitleID);
        }

        private function onPlayerUpgrade(_arg_1:ActorModelEvent):void
        {
            this.reflashHeadName(null, this.m_showCareerName);
            this.createEffectInfo(7014);
        }

        private function checkBadge(_arg_1:PlayerEquipsID):void
        {
            var _local_2:int = _arg_1.getBadgeShowID();
            if (_local_2 > 1){
                this.getPlayerView().showBadge(_local_2);
                this.reflashHeadName(null, false);
            } else {
                this.getPlayerView().hideBadge();
                this.reflashHeadName(null);
            };
        }

        private function checkFamily(_arg_1:FamilyInfo):void
        {
            if (_arg_1.familyID > 0){
                this.getPlayerView().showFamily(_arg_1);
            } else {
                this.getPlayerView().hideFamily();
            };
        }

        private function onCareerChange(_arg_1:ActorModelEvent):void
        {
            this.reflashHeadName(null, this.m_showCareerName);
            this.getPlayerView().updateEquipsAsset(this.getPlayerInfo().equipsID, m_actorView);
        }

        private function onActionChange(_arg_1:int):void
        {
            this._preNextFrameFuncParams[2] = false;
            var _local_2:int = (this.m_vkeyIntercepts.length - 1);
            while (_local_2 >= 0) {
                this.m_vkeyIntercepts[_local_2].onTargetActionChange(_arg_1, this);
                _local_2--;
            };
        }

        private function onPlayerDead(_arg_1:ElementEvent):void
        {
            clearAllStatuses();
            m_actorInfo.groupID2 = m_actorInfo.groupID;
            changeGroup(ElementGroupDef.PVE_IGNORE);
        }

        private function setPlayerGhost(_arg_1:Boolean):void
        {
            var _local_2:AIPlayerView;
            if (this._ghostFlag != _arg_1){
                this._ghostFlag = _arg_1;
                _local_2 = this.getPlayerView();
                if (this._ghostFlag){
                    this._ghostKeyFunc = VKeyDef.IS_DIRECTION_KEY;
                    if (_GHOST_COLOR == null){
                        _GHOST_COLOR = new AdjustColorStyle(1000, 0, 0, -100, -100);
                    };
                    _local_2.setBodyAdjustColorStyle(_GHOST_COLOR);
                    _local_2.getBodyDisplay().alpha = 0.5;
                } else {
                    this._ghostKeyFunc = null;
                    _local_2.setBodyAdjustColorStyle(_GHOST_COLOR, false);
                    _local_2.getBodyDisplay().alpha = 1;
                };
            };
        }

        override protected function initThis():void
        {
            super.initThis();
            setActorView(new AIPlayerView());
            setMoveEnabled(true);
            setGravityEnabled(true);
            this.m_vkeyIntercepts = new Vector.<IVKeyIntercept>();
            m_action_change = this.onActionChange;
            needGroupChange = true;
            this._ghostFlag = false;
            this._preNextFrameFuncParams = [];
        }

        override public function inputActionID(_arg_1:int):void
        {
            m_controller.inputActionID(_arg_1);
        }

        public function buildActions():void
        {
            addAction(new PlayerIDELAction());
            addAction(new PlayerWalkAction());
            addAction(new PlayerRunAction());
            addAction(new PlayerJumpAction());
            addAction(new PlayerPickupAction());
            addAction(new PlayerRideAction());
            addAction(new BeHurtAction());
            addAction(new CaughtAction());
            addAction(new BethrownAction());
            addAction(new CaptiveAction());
            addAction(new PlayerDeadAction());
        }

        public function getPlayerView():AIPlayerView
        {
            return ((m_view as AIPlayerView));
        }

        public function getPlayerInfo():PlayerInfo
        {
            return ((m_actorInfo as PlayerInfo));
        }

        public function initialize(_arg_1:PlayerInfo):void
        {
            this.id = _arg_1.id;
            this.materialType = _arg_1.ethnicInfo.materialType;
            this.m_teamTagInfo = _arg_1.teamTag;
            this.actorHeight = _arg_1.ethnicInfo.viewSize.y;
            _arg_1.RTminComboTime = _arg_1.career.minComboTime;
            if (_arg_1.isMain){
                if (_PROTECT_M == null){
                    _PROTECT_M = AICore.protectModule;
                };
                _PROTECT_M.createObjectProtect(m_model);
            };
            m_model.copyValues(_arg_1);
            __initialize(_arg_1);
            setMapPosition(_arg_1.mapPosition);
            setDirection(_arg_1.diretion);
            this.inputVKey(VKeyDef.EMPTY);
            this.reflashHeadName(null);
            m_model.addEventListener(ActorModelEvent.ON_LEVEL_UPDATE, this.onPlayerUpgrade);
            m_model.addEventListener(ActorModelEvent.ON_CAREER_CHANGE, this.onCareerChange);
            m_model.addEventListener(PlayerModelEvent.ON_AVATAR_UPDATE, this.onPlayerAvatarUpdate);
            m_model.addEventListener(PlayerModelEvent.ON_TEAM_TAG_INFO_CHANGE, this.onTeamTagInfoChange);
            m_model.addEventListener(PlayerModelEvent.ON_NAME_UPDATE, this.onNameChange);
            m_model.addEventListener(PlayerModelEvent.ON_PAY_DATA_UPDATE, this.onPayDataUpdate);
            this.checkBadge(_arg_1.equipsID);
            if (((((_arg_1.teamTag) && (_arg_1.teamTag.inTeam))) && (!(_arg_1.teamTag.isFull)))){
                this.getPlayerView().showTeamTagInfo(_arg_1.teamTag);
            } else {
                this.getPlayerView().hideTeamTagInfo();
            };
            addEventListener(ElementEvent.ON_ELEMENT_DEAD, this.onPlayerDead);
            this.setPlayerGhost(_arg_1.RTghostFlag);
            if (((_arg_1.vipInfo) && (_arg_1.vipInfo.isVip))){
                this.getPlayerView().showVipInfo(_arg_1.vipInfo);
            };
            ((_arg_1.familyInfo) && (this.checkFamily(_arg_1.familyInfo)));
            if (_arg_1.payData != null){
                this.getPlayerView().showNameTitle(_arg_1.payData.nameTitleID);
            };
        }

        public function getPlayerModel():PlayerModel
        {
            return ((m_model as PlayerModel));
        }

        public function setVisibleValue(_arg_1:int):void
        {
            if (this.m_visibleValue != _arg_1){
                this.m_visibleValue = _arg_1;
                m_shadow.getDisplay().visible = !((_arg_1 == VisibleValueDef.NOTHING_VISIBLE));
                this.getPlayerView().setVisibleValue(_arg_1);
            };
        }

        public function getVisibleValue():int
        {
            return (this.m_visibleValue);
        }

        override public function isMain():Boolean
        {
            return (m_model.isMain);
        }

        override public function cancelNextFrameAct():void
        {
            if (m_nextFrameAct != null){
                this._preNextFrameFuncParams[0] = m_nextFrameFuncParams[0];
                this._preNextFrameFuncParams[1] = m_nextFrameFuncParams[1];
                this._preNextFrameFuncParams[2] = true;
            };
            super.cancelNextFrameAct();
        }

        public function execCancelFrameAct():void
        {
            if (this._preNextFrameFuncParams[2]){
                this._preNextFrameFuncParams[2] = false;
                vKeyAct(this._preNextFrameFuncParams[0], this._preNextFrameFuncParams[1]);
            };
        }

        override public function inputVKey(_arg_1:int):void
        {
            var _local_2:int;
            if ((((this._ghostKeyFunc == null)) || (this._ghostKeyFunc(_arg_1)))){
                _local_2 = (((m_currentAction)!=null) ? m_currentAction.getActionID() : -1);
                _arg_1 = this.inputCurrentIntercept(_arg_1, _local_2);
                super.inputVKey(_arg_1);
            };
        }

        override public function revive():Boolean
        {
            var _local_2:PlayerInfo;
            var _local_1:Boolean = super.revive();
            if (_local_1){
                _local_2 = PlayerInfo(m_actorInfo);
                this.ghostState(false);
                changeGroup(_local_2.groupID2);
                updateBornStatus(_local_2.bornSSmodels);
                this.createEffectInfo(7014);
            };
            return (_local_1);
        }

        public function ghostState(_arg_1:Boolean=true):void
        {
            var _local_2:PlayerInfo;
            if (this._ghostFlag != _arg_1){
                _local_2 = this.getPlayerInfo();
                _local_2.RTghostFlag = _arg_1;
                if (_arg_1){
                    vKeyAct(VKeyDef.EMPTY);
                };
                this.setPlayerGhost(_arg_1);
            };
        }

        public function getGhostFlag():Boolean
        {
            return (this._ghostFlag);
        }

        public function get hasPetFollow():Boolean
        {
            return (!((this.getPlayerInfo().followPetInfo == null)));
        }

        public function inputCurrentIntercept(_arg_1:int, _arg_2:int):int
        {
            var _local_3:int = (this.m_vkeyIntercepts.length - 1);
            var _local_4:int = _arg_1;
            while (_local_3 >= 0) {
                _local_4 = this.m_vkeyIntercepts[_local_3].interceptVKey(_arg_1, _arg_2, this);
                if (_local_4 != _arg_1) break;
                _local_3--;
            };
            return (_local_4);
        }

        public function addVKeyIntercept(_arg_1:IVKeyIntercept):void
        {
            var _local_2:int = this.m_vkeyIntercepts.indexOf(_arg_1);
            if (_local_2 == -1){
                this.m_vkeyIntercepts.push(_arg_1);
            };
        }

        public function removeVKeyIntercept(_arg_1:IVKeyIntercept):void
        {
            var _local_2:int = this.m_vkeyIntercepts.indexOf(_arg_1);
            if (_local_2 != -1){
                this.m_vkeyIntercepts.splice(_local_2, 1);
            };
        }

        public function isKeyDown(_arg_1:int):Boolean
        {
            if (m_controller){
                m_controller.isVKeyDown(_arg_1);
            };
            return (false);
        }

        public function hotKeyToVKey(_arg_1:int):int
        {
            var _local_2:ActionInfo;
            if (VKeyDef.IS_HOT_KEY(_arg_1)){
                _local_2 = PlayerModel(m_model).getActionInfoByVKey(_arg_1);
                if (((((!((_local_2 == null))) && (_local_2.vKeyInfos))) && ((_local_2.vKeyInfos.length > 0)))){
                    _arg_1 = _local_2.vKeyInfos[0].value;
                };
            };
            return (_arg_1);
        }

        override public function reset():void
        {
            if (((m_model.isMain) && (_PROTECT_M))){
                _PROTECT_M.returnObjectProtect(m_model);
            };
            this.setVisibleValue(0);
            if (m_model != null){
                m_model.removeEventListener(ActorModelEvent.ON_LEVEL_UPDATE, this.onPlayerUpgrade);
                m_model.removeEventListener(ActorModelEvent.ON_CAREER_CHANGE, this.onCareerChange);
                m_model.removeEventListener(PlayerModelEvent.ON_AVATAR_UPDATE, this.onPlayerAvatarUpdate);
                m_model.removeEventListener(PlayerModelEvent.ON_TEAM_TAG_INFO_CHANGE, this.onTeamTagInfoChange);
                m_model.removeEventListener(PlayerModelEvent.ON_PAY_DATA_UPDATE, this.onPayDataUpdate);
                removeEventListener(ElementEvent.ON_ELEMENT_DEAD, this.onPlayerDead);
                this.setPlayerGhost(false);
            };
            if (m_inited){
                this._preNextFrameFuncParams[2] = false;
            };
            if (this.m_vkeyIntercepts != null){
                this.m_vkeyIntercepts.length = 0;
            };
            this.m_teamTagInfo = null;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_852()
        {
        }


    }
}//package com.tencent.ai.core.player

// _SafeStr_852 = " BasePlayer" (String#17423)


