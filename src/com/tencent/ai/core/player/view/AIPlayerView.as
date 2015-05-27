// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.view.AIPlayerView

package com.tencent.ai.core.player.view
{
    import com.tencent.ai.core.actor.BaseActorView;
    import com.tencent.ai.core.player.res.PlayerAsset;
    import flash.display.MovieClip;
    import com.tencent.ai.core.data.PayData;
    import com.tencent.ai.core.data.TeamTagInfo;
    import com.tencent.ai.core.enum.PlayerBodyLayer;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.context.AIContext;
    import com.tencent.ai.core.enum.AIContextType;
    import com.tencent.ai.core.data.ActionInfo;
    import flash.display.Sprite;
    import com.tencent.ai.core.player.commonEffect.BadgeManager;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.data.FamilyInfo;
    import com.tencent.ai.core.enum.VisibleValueDef;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.ai.core.data.arg.CallTeamPluginArg;
    import com.tencent.ai.core.enum.AICommandType;
    import com.tencent.ai.core.player.commonEffect.NameTitleManager;
    import  ©init._SafeStr_850;

    public class AIPlayerView extends BaseActorView 
    {

        protected var m_playerAsset:PlayerAsset;
        protected var m_visibleValue:int;
        protected var m_badge:MovieClip;
        protected var m_badgeAssetID:int;
        protected var m_payData:PayData;
        protected var m_nameTitle:MovieClip;
        protected var m_teamTagView:MovieClip;
        protected var m_teamTagVisible:Boolean;
        protected var m_teamTagInfo:TeamTagInfo;
        protected var m_vipIconView:MovieClip;
        protected var m_familyAsset:MovieClip;

        public function AIPlayerView()
        {
            super(new BasePlayerBody());
            this.m_badgeAssetID = -1;
            this.m_visibleValue = 0;
            m_stiffViewType = 1;
            this.m_payData = new PayData();
        }

        protected function onAssetReadLoad(_arg_1:AssetLoadEvent):void
        {
            if (this.m_playerAsset.playerLayerAssets[PlayerBodyLayer.L_AVATAR] != null){
                this.onAssetLoadComplete(null);
            };
        }

        protected function onAssetLoadComplete(_arg_1:AssetLoadEvent):void
        {
            m_body.update(this.m_playerAsset.playerLayerAssets);
            setHeadText(null);
        }

        override protected function update():void
        {
            var _local_1:int;
            super.update();
            if (this.m_badge){
                this.m_badge.x = 0;
                this.m_badge.y = this.m_nameTxt.y;
            };
            if (this.m_teamTagVisible){
                this.m_teamTagView.x = 0;
                this.m_teamTagView.y = (((this.m_badge) ? (this.m_badge.y - this.m_badge.height) : this.m_nameTxt.y) - 2);
            };
            if (this.m_vipIconView){
                this.m_vipIconView.x = ((m_nameTxt.x - this.m_vipIconView.width) - 2);
                this.m_vipIconView.y = ((m_nameTxt.y + m_nameTxt.height) - this.m_vipIconView.height);
            };
            if (this.m_nameTitle){
                this.m_nameTitle.x = (this.m_nameTxt.x + this.m_nameTxt.textWidth);
                this.m_nameTitle.y = ((m_nameTxt.y + m_nameTxt.textHeight) - this.m_nameTitle.height);
            };
            if (((this.m_familyAsset) && (this.m_familyAsset.parent))){
                this.m_familyAsset.x = ((m_nameTxt.x + (m_nameTxt.width * 0.5)) - (this.m_familyAsset.width * 0.5));
                if (this.m_teamTagVisible){
                    _local_1 = (this.m_teamTagView.y - this.m_teamTagView.height);
                } else {
                    if (this.m_badge){
                        _local_1 = (this.m_badge.y - this.m_badge.height);
                    } else {
                        _local_1 = m_nameTxt.y;
                    };
                };
                this.m_familyAsset.y = (_local_1 - this.m_familyAsset.height);
            };
        }

        public function addAsset(_arg_1:PlayerAsset):void
        {
            if (this.m_playerAsset != null){
                error("[AIPlayerView] 已经存在一个playerAsset的实例请先用removeAsset 删除实例");
            };
            this.m_playerAsset = _arg_1;
            if (this.m_playerAsset != null){
                m_body.setLayerAssets(_arg_1.playerLayerAssets);
                this.m_playerAsset.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                this.m_playerAsset.addEventListener(AssetLoadEvent.READY_LOAD, this.onAssetReadLoad);
                setHeadText(null);
            };
        }

        public function removeAsset():PlayerAsset
        {
            var _local_1:PlayerAsset = this.m_playerAsset;
            if (this.m_playerAsset != null){
                this.m_playerAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                this.m_playerAsset.removeEventListener(AssetLoadEvent.READY_LOAD, this.onAssetReadLoad);
                this.m_playerAsset = null;
            };
            return (_local_1);
        }

        public function getAsset():PlayerAsset
        {
            return (this.m_playerAsset);
        }

        public function updateEquipsAsset(_arg_1:PlayerEquipsID, _arg_2:IActorView):void
        {
            if (this.m_playerAsset != null){
                this.m_playerAsset.updateEquipsAsset(_arg_1);
                this.addEquipEffect(_arg_2);
            };
        }

        public function addEquipEffect(_arg_1:IActorView):void
        {
            var _local_2:AIContext = AICore.Runtime.currentContext;
            if (((_local_2) && (((!((_local_2.getType() == AIContextType.CT_CITY))) && (!((_local_2.getType() == AIContextType.CT_HOMESTEAD))))))){
                return;
            };
            if (this.m_playerAsset){
                (this.m_body as BasePlayerBody).addEquipsView(this.m_playerAsset.equipsID, _arg_1);
            };
        }

        public function removeEquipEffect(_arg_1:IActorView):void
        {
            (this.m_body as BasePlayerBody).removeEquipsView(_arg_1);
        }

        public function changeDirection(_arg_1:IActorView):void
        {
            (this.m_body as BasePlayerBody).changeDirection(_arg_1);
        }

        public function changeAction(_arg_1:ActionInfo):void
        {
            (this.m_body as BasePlayerBody).changeAction(_arg_1);
        }

        public function showBadge(_arg_1:int):void
        {
            var _local_2:Sprite;
            if ((((this.m_badgeAssetID == _arg_1)) && (this.m_badge))){
                return;
            };
            this.hideBadge();
            this.m_badgeAssetID = _arg_1;
            this.m_badge = BadgeManager.instance.create(_arg_1);
            if (this.m_badge){
                _local_2 = (this.m_viewDisplay as Sprite);
                _local_2.addChild(this.m_badge);
                this.update();
            };
        }

        public function hideBadge():void
        {
            var _local_1:Sprite;
            if (this.m_badge){
                _local_1 = (this.m_viewDisplay as Sprite);
                if (_local_1.contains(this.m_badge)){
                    _local_1.removeChild(this.m_badge);
                };
                BadgeManager.instance.collect(this.m_badge);
                this.m_badge = null;
            };
        }

        public function showFamily(_arg_1:FamilyInfo):void
        {
            if (_arg_1.familyID <= 0){
                this.hideFamily();
                return;
            };
            if (!this.m_familyAsset){
                this.m_familyAsset = (CLASS.current.tryNewInstance("assets.family.FamilyIconAsset") as MovieClip);
            };
            if (!this.m_familyAsset){
                return;
            };
            this.m_familyAsset.familyName_tf.text = _arg_1.familyName;
            this.m_familyAsset.gotoAndStop(_arg_1.familyLevel);
            this.m_familyAsset.familyName_tf.width = (this.m_familyAsset.bg.width = (this.m_familyAsset.familyName_tf.textWidth + 6));
            this.m_familyAsset.bg.visible = _arg_1.backGround;
            (((_arg_1.backGround > 0)) && (this.m_familyAsset.bg.gotoAndStop(_arg_1.backGround)));
            var _local_2:Sprite = (this.m_viewDisplay as Sprite);
            _local_2.addChild(this.m_familyAsset);
            this.update();
        }

        public function hideFamily():void
        {
            if (this.m_familyAsset){
                ((this.m_familyAsset.parent) && (this.m_familyAsset.parent.removeChild(this.m_familyAsset)));
            };
        }

        public function setVisibleValue(_arg_1:int):void
        {
            if (this.m_visibleValue != _arg_1){
                this.m_visibleValue = _arg_1;
                if (this.m_visibleValue == VisibleValueDef.HEAD_VISIBLE){
                    m_viewDisplay.visible = true;
                    m_bodyDisplay.visible = false;
                } else {
                    if (this.m_visibleValue == VisibleValueDef.NOTHING_VISIBLE){
                        m_viewDisplay.visible = false;
                        m_bodyDisplay.visible = true;
                    } else {
                        m_viewDisplay.visible = true;
                        m_bodyDisplay.visible = true;
                    };
                };
            };
        }

        public function getVisibleValue():int
        {
            return (this.m_visibleValue);
        }

        override public function reset():void
        {
            this.setVisibleValue(0);
            this.hideBadge();
            this.showVipInfo(null, true);
            super.reset();
        }

        public function showTeamTagInfo(_arg_1:TeamTagInfo):void
        {
            var _local_2:TextField;
            var _local_3:TextField;
            var _local_4:Sprite;
            this.m_teamTagInfo = _arg_1;
            if (!this.m_teamTagView){
                this.m_teamTagView = (CLASS.current.tryNewInstance("com.tencent.ai.team.TeamTagView") as MovieClip);
            };
            if (this.m_teamTagView){
                this.m_teamTagView.buttonMode = true;
                this.m_teamTagView.useHandCursor = true;
                _local_2 = (this.m_teamTagView["teamName_txt"] as TextField);
                _local_3 = (this.m_teamTagView["member_txt"] as TextField);
                _local_2.mouseEnabled = false;
                _local_2.text = _arg_1.name;
                _local_3.mouseEnabled = false;
                _local_3.text = ((_arg_1.currentNum + "/") + _arg_1.maxNum);
                _local_4 = (this.getDisplay() as Sprite);
                _local_4.addChild(this.m_teamTagView);
                this.m_teamTagVisible = true;
                this.update();
                this.m_teamTagView.addEventListener(MouseEvent.CLICK, this.requestJoinTeam);
            };
        }

        public function showVipInfo(_arg_1:VipSimpleInfo, _arg_2:Boolean=false):void
        {
            var _local_3:Sprite;
            ((((this.m_vipIconView) && (this.m_vipIconView.parent))) && (this.m_vipIconView.parent.removeChild(this.m_vipIconView)));
            if (_arg_2){
                ((this.m_vipIconView) && (this.m_vipIconView.removeEventListener(MouseEvent.CLICK, this.vipIconClickHandler)));
                return;
            };
            if (((!(_arg_1)) || (!(_arg_1.isVip)))){
                return;
            };
            if (!this.m_vipIconView){
                this.m_vipIconView = (CLASS.current.tryNewInstance("assets.vip.VipAsset") as MovieClip);
                this.m_vipIconView.x = ((m_nameTxt.x - this.m_vipIconView.width) - 2);
                this.m_vipIconView.y = ((m_nameTxt.y + m_nameTxt.height) - this.m_vipIconView.height);
            };
            if (this.m_vipIconView){
                this.m_vipIconView.gotoAndStop(((_arg_1.isYearVip) ? 6 : _arg_1.vipLevel));
                this.m_vipIconView.addEventListener(MouseEvent.CLICK, this.vipIconClickHandler);
                _local_3 = (getDisplay() as Sprite);
                _local_3.addChild(this.m_vipIconView);
            };
        }

        public function hideTeamTagInfo():void
        {
            var _local_1:Sprite;
            this.m_teamTagVisible = false;
            if (this.m_teamTagView){
                _local_1 = (this.getDisplay() as Sprite);
                if (_local_1.contains(this.m_teamTagView)){
                    this.m_teamTagView.removeEventListener(MouseEvent.CLICK, this.requestJoinTeam);
                    _local_1.removeChild(this.m_teamTagView);
                };
            };
        }

        protected function requestJoinTeam(_arg_1:MouseEvent):void
        {
            var _local_2:CallTeamPluginArg = new CallTeamPluginArg();
            _local_2.type = CallTeamPluginArg.JOIN_TEAM;
            _local_2.teamID = this.m_teamTagInfo.teamID;
            AICore.cmdCall(AICommandType.CALL_TEAM_PLUGIN, _local_2);
            _arg_1.stopPropagation();
        }

        private function vipIconClickHandler(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
            AICore.cmdCall(AICommandType.CALL_VIP);
        }

        public function showNameTitle(_arg_1:int):void
        {
            var _local_2:Sprite;
            if ((((this.m_payData.nameTitleID == _arg_1)) && (this.m_nameTitle))){
                return;
            };
            this.hideNameTitle();
            if (_arg_1){
                this.m_payData.nameTitleID = _arg_1;
                this.m_nameTitle = NameTitleManager.instance.create(_arg_1);
                if (this.m_nameTitle){
                    _local_2 = (this.m_viewDisplay as Sprite);
                    _local_2.addChild(this.m_nameTitle);
                    this.update();
                };
            };
        }

        public function hideNameTitle():void
        {
            var _local_1:Sprite;
            if (this.m_nameTitle){
                _local_1 = (this.m_viewDisplay as Sprite);
                if (_local_1.contains(this.m_nameTitle)){
                    _local_1.removeChild(this.m_nameTitle);
                };
                NameTitleManager.instance.collect(this.m_nameTitle);
                this.m_nameTitle = null;
            };
        }

        public /*  ©init. */ function _SafeStr_850()
        {
        }


    }
}//package com.tencent.ai.core.player.view

// _SafeStr_850 = " AIPlayerView" (String#15545)


