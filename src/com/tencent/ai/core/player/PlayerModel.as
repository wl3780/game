// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.PlayerModel

package com.tencent.ai.core.player
{
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.data.PlayerInfo;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.VKeyInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.events.PlayerModelEvent;
    import com.tencent.ai.core.data.PayData;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.data.CareerInfo;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.data.TeamTagInfo;
    import com.tencent.ai.core.data.AttributeInfo;
    import com.tencent.ai.core.data.EthnicInfo;
    import  ©init._SafeStr_854;

    public class PlayerModel extends ActorModel 
    {

        public var playerInfo:PlayerInfo;
        protected var m_vkeyMapActionIDs:Dictionary;
        protected var m_vHotKeyMapSkills:Dictionary;
        protected var m_currentActionInfo:ActionInfo;
        private var _skillUsedEvent:ActorModelEvent;
        private var _skillUsedErrorEvent:ActorModelEvent;
        private var _hpChangeEvent:ActorModelEvent;
        private var _mpChangeEvent:ActorModelEvent;
        private var _angryValChangeEvent:ActorModelEvent;
        private var _actionChangeEvent:ActorModelEvent;
        private var _vChangeEvent:ActorModelEvent;
        private var _protect_addAttribValue:Function;
        private var _protect_setAttribValue:Function;
        private var _protect_getProtectAttrib:Function;
        private var _protect_updateAttribsValue:Function;


        override protected function initThis():void
        {
            super.initThis();
            type = ElementType.MT_PLAYER;
            this.m_vkeyMapActionIDs = new Dictionary();
            this.m_vHotKeyMapSkills = new Dictionary();
            this._skillUsedEvent = new ActorModelEvent(ActorModelEvent.ON_SKILL_USED, this);
            this._skillUsedErrorEvent = new ActorModelEvent(ActorModelEvent.ON_SKILL_USED_ERROR, this);
            this._skillUsedErrorEvent.data = {};
            this._hpChangeEvent = new ActorModelEvent(ActorModelEvent.ON_HP_CHANGE, this);
            this._mpChangeEvent = new ActorModelEvent(ActorModelEvent.ON_MP_CHANGE, this);
            this._angryValChangeEvent = new ActorModelEvent(ActorModelEvent.ON_ANGRYVAL_CHANGE, this);
            this._actionChangeEvent = new ActorModelEvent(ActorModelEvent.ON_ACTION_CHANGE, this);
            this._vChangeEvent = new ActorModelEvent(ActorModelEvent.ON_V_CHANGE, this);
        }

        protected function mapActionVKeys(_arg_1:ActionInfo, _arg_2:Boolean=false):Boolean
        {
            var _local_6:VKeyInfo;
            var _local_3:Vector.<VKeyInfo> = _arg_1.vKeyInfos;
            if (_local_3 == null){
                return (false);
            };
            var _local_4:int = _local_3.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                this.m_vkeyMapActionIDs[_local_6.value] = ((_arg_2) ? null : _arg_1);
                _local_5++;
            };
            return (true);
        }

        override protected function addSkillModel(_arg_1:SkillModel):void
        {
            var _local_6:String;
            var _local_2:int = VKeyDef.HOT_KEY_FLAG_1[_arg_1.flag];
            var _local_3:int = _arg_1.actionID;
            var _local_4:ActionInfo = m_actionInfos[_local_3];
            if (_local_4 == null){
                _local_6 = (((((("没有找到actionID =" + _local_3) + "的ACTION\n") + "技能ID=") + _arg_1.skillID) + " 技能名称=") + ((_arg_1.group) ? _arg_1.group.name : "没有在技能配置表里找到此技能\n"));
                throw (new Error(_local_6));
            };
            var _local_5:Boolean = this.mapActionVKeys(_local_4);
            if (((!(_local_5)) && ((_local_2 == 0)))){
                return;
            };
            if (_local_5){
                super.addSkillModel(_arg_1);
            };
            if (_local_2 != 0){
                this.m_vkeyMapActionIDs[_local_2] = _local_4;
                this.m_vHotKeyMapSkills[_local_2] = _arg_1;
            };
        }

        public function get walkVZ():int
        {
            return ((walkV * DEFINE.PLAYER_WALK_Z_V_RATE));
        }

        public function runtimeClearHotKey(_arg_1:int):void
        {
            this.runtimeAddHotKey(_arg_1, 0);
        }

        public function runtimeAddHotKey(_arg_1:int, _arg_2:int):void
        {
            var _local_7:SkillModel;
            var _local_8:int;
            var _local_9:int;
            var _local_10:ActionInfo;
            var _local_11:SkillModel;
            if (_arg_1 == 0){
                return;
            };
            var _local_3:PlayerInfo = (m_bindInfo as PlayerInfo);
            var _local_4:Vector.<SkillModel> = _local_3.skills;
            var _local_5:int = (((_local_4)!=null) ? _local_4.length : 0);
            var _local_6:int;
            while (_local_6 < _local_5) {
                _local_7 = _local_4[_local_6];
                if (_local_7.skillID == _arg_1){
                    _local_8 = VKeyDef.HOT_KEY_FLAG_1[_local_7.flag];
                    if (_local_8 != 0){
                        this.m_vkeyMapActionIDs[_local_8] = null;
                        this.m_vHotKeyMapSkills[_local_8] = null;
                    };
                    _local_7.flag = _arg_2;
                    if (_arg_2 != 0){
                        _local_9 = _local_7.actionID;
                        _local_10 = m_actionInfos[_local_9];
                        _local_8 = VKeyDef.HOT_KEY_FLAG_1[_arg_2];
                        if (_local_8 != 0){
                            this.m_vkeyMapActionIDs[_local_8] = _local_10;
                            _local_11 = this.m_vHotKeyMapSkills[_local_8];
                            this.m_vHotKeyMapSkills[_local_8] = _local_7;
                            if (_local_11 != null){
                                _local_11.flag = 0;
                            };
                        };
                    };
                    return;
                };
                _local_6++;
            };
        }

        public function runtimeAddSkill(_arg_1:SkillModel):void
        {
            var _local_2:Vector.<SkillModel> = PlayerInfo(m_bindInfo).skills;
            _local_2.push(_arg_1);
            this.addSkillModel(_arg_1);
        }

        public function runtimeRemoveSkill(_arg_1:int):SkillModel
        {
            var _local_6:SkillModel;
            var _local_7:int;
            var _local_8:ActionInfo;
            var _local_9:int;
            var _local_2:PlayerInfo = (m_bindInfo as PlayerInfo);
            var _local_3:Vector.<SkillModel> = _local_2.skills;
            var _local_4:int = (((_local_3)!=null) ? _local_3.length : 0);
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                if (_local_6.skillID == _arg_1){
                    _local_3.splice(_local_5, 1);
                    _local_7 = _local_6.actionID;
                    _local_8 = m_actionInfos[_local_7];
                    this.mapActionVKeys(_local_8, true);
                    m_actionIDMapSkills[_local_7] = null;
                    _local_9 = VKeyDef.HOT_KEY_FLAG_1[_local_6.flag];
                    if (_local_9 != 0){
                        this.m_vkeyMapActionIDs[_local_9] = null;
                        this.m_vHotKeyMapSkills[_local_9] = null;
                    };
                    return (_local_6);
                };
                _local_5++;
            };
            return (null);
        }

        public function getVKeyByHotKey(_arg_1:int):int
        {
            var _local_3:Vector.<VKeyInfo>;
            var _local_2:ActionInfo = this.m_vkeyMapActionIDs[_arg_1];
            if (_local_2 != null){
                _local_3 = _local_2.vKeyInfos;
                if (((!((_local_3 == null))) && (!((_local_3.length == 0))))){
                    _arg_1 = _local_3[0].value;
                };
            };
            return (_arg_1);
        }

        override public function onUseSkillError(_arg_1:int, _arg_2:SkillModel=null):void
        {
            super.onUseSkillError(_arg_1, _arg_2);
            var _local_3:Object = this._skillUsedErrorEvent.data;
            _local_3.code = _arg_1;
            _local_3.skillModel = _arg_2;
            dispatchEvent(this._skillUsedErrorEvent);
        }

        public function getActionInfoByVKey(_arg_1:int):ActionInfo
        {
            return (this.m_vkeyMapActionIDs[_arg_1]);
        }

        public function getCurrentActionInfo():ActionInfo
        {
            return (this.m_currentActionInfo);
        }

        override public function getSkillModel(_arg_1:int, _arg_2:int=0):SkillModel
        {
            var _local_3:SkillModel = m_actionIDMapSkills[_arg_1];
            if (_local_3 == null){
                _local_3 = this.m_vHotKeyMapSkills[_arg_2];
            };
            return (_local_3);
        }

        public function setProtectFuncProxy(_arg_1:Object):void
        {
            if (_arg_1 != null){
                this._protect_addAttribValue = _arg_1.addAttribValue;
                this._protect_getProtectAttrib = _arg_1.getProtectAttrib;
                this._protect_setAttribValue = _arg_1.setAttribValue;
                this._protect_updateAttribsValue = _arg_1.updateAttribsValue;
                m_protect_skillCheck = _arg_1.skillCheck;
            } else {
                this._protect_addAttribValue = null;
                this._protect_getProtectAttrib = null;
                this._protect_setAttribValue = null;
                this._protect_updateAttribsValue = null;
                m_protect_skillCheck = null;
            };
        }

        public function repairHP(_arg_1:int):void
        {
            m_hp = _arg_1;
        }

        public function repairMP(_arg_1:int):void
        {
            m_mp = _arg_1;
        }

        override public function updateHP(_arg_1:int):void
        {
            super.updateHP(_arg_1);
            if (this._protect_addAttribValue != null){
                this._protect_addAttribValue("hp", _arg_1);
            };
            this._hpChangeEvent.data = _arg_1;
            dispatchEvent(this._hpChangeEvent);
        }

        override public function updateMP(_arg_1:int):void
        {
            super.updateMP(_arg_1);
            if (this._protect_addAttribValue != null){
                this._protect_addAttribValue("mp", _arg_1);
            };
            this._mpChangeEvent.data = _arg_1;
            dispatchEvent(this._mpChangeEvent);
        }

        override public function set maxmp(_arg_1:int):void
        {
            var _local_2 = (_arg_1 < m_mp);
            super.maxmp = _arg_1;
            if (_local_2){
                if (this._protect_setAttribValue != null){
                    this._protect_setAttribValue("mp", m_mp);
                };
            };
        }

        override public function set maxhp(_arg_1:int):void
        {
            var _local_2 = (_arg_1 < m_hp);
            super.maxhp = _arg_1;
            if (_local_2){
                if (this._protect_setAttribValue != null){
                    this._protect_setAttribValue("hp", m_hp);
                };
            };
        }

        override public function updateAngryVal(_arg_1:int):void
        {
            super.updateAngryVal(_arg_1);
            this._angryValChangeEvent.data = _arg_1;
            dispatchEvent(this._angryValChangeEvent);
        }

        public function updateLevel(_arg_1:int):Boolean
        {
            if (this.level != _arg_1){
                this.level = _arg_1;
                if (m_bindInfo != null){
                    m_bindInfo.level = _arg_1;
                };
                dispatchEvent(new ActorModelEvent(ActorModelEvent.ON_LEVEL_UPDATE, this));
                return (true);
            };
            return (false);
        }

        public function updateName(_arg_1:String):void
        {
            var _local_2:PlayerModelEvent;
            if (this.playerInfo != null){
                this.playerInfo.name = _arg_1;
                _local_2 = new PlayerModelEvent(PlayerModelEvent.ON_NAME_UPDATE, this);
                _local_2.data = _arg_1;
                this.dispatchEvent(_local_2);
            };
        }

        public function updatePayData(_arg_1:PayData):void
        {
            var _local_2:PlayerModelEvent;
            if (this.playerInfo != null){
                this.playerInfo.payData = _arg_1;
                _local_2 = new PlayerModelEvent(PlayerModelEvent.ON_PAY_DATA_UPDATE, this);
                _local_2.data = _arg_1;
                this.dispatchEvent(_local_2);
            };
        }

        public function changeSomeCareerInfo(_arg_1:CareerInfo, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_6:PlayerEquipsID;
            var _local_5:PlayerInfo = (this.m_bindInfo as PlayerInfo);
            if (((!((_local_5 == null))) && (!((_arg_1 == null))))){
                _local_5.career = _arg_1;
                _local_5.sublime = _arg_3;
                _local_5.hasJoin = _arg_4;
                _local_6 = _local_5.equipsID;
                _local_6.careerID = _arg_1.careerID;
                _local_6.careerLevel = _arg_2;
                _local_6.careerType = _local_5.getCareerType();
                dispatchEvent(new ActorModelEvent(ActorModelEvent.ON_CAREER_CHANGE, this));
            };
        }

        public function updateAvatar(_arg_1:int, _arg_2:EquipItemInfo):void
        {
            this.playerInfo.updateEquip(_arg_1, _arg_2);
            if (_arg_1 == PlayerEquipsID.WEAPON_I){
                weapon_hurt_eid = this.playerInfo.weapon_hurt_eid;
                weapon_create_id = this.playerInfo.weapon_create_id;
                weapon_hurt_type = this.playerInfo.weapon_hurt_Type;
            };
            var _local_3:PlayerModelEvent = new PlayerModelEvent(PlayerModelEvent.ON_AVATAR_UPDATE, this);
            _local_3.data = {
                "iPos":_arg_1,
                "data":this.playerInfo.equipsID
            };
            dispatchEvent(_local_3);
        }

        public function updateTeamTagInfo(_arg_1:TeamTagInfo):void
        {
            var _local_2:PlayerModelEvent;
            if (this.playerInfo != null){
                this.playerInfo.teamTag = _arg_1;
                _local_2 = new PlayerModelEvent(PlayerModelEvent.ON_TEAM_TAG_INFO_CHANGE);
                _local_2.data = _arg_1;
                this.dispatchEvent(_local_2);
            };
        }

        override public function updateActionID(_arg_1:int):Boolean
        {
            if (super.updateActionID(_arg_1)){
                this.m_currentActionInfo = m_actionInfos[_arg_1];
                this._actionChangeEvent.data = this.m_currentActionInfo;
                dispatchEvent(this._actionChangeEvent);
                return (true);
            };
            return (false);
        }

        override public function onSkillUsed(_arg_1:SkillModel):void
        {
            super.onSkillUsed(_arg_1);
            if (_arg_1 != null){
                this.playerInfo.RTLatestUseSkill = _arg_1;
                this._skillUsedEvent.data = _arg_1;
                dispatchEvent(this._skillUsedEvent);
            };
        }

        override public function setValueByName(_arg_1:String, _arg_2:Object):void
        {
            super.setValueByName(_arg_1, _arg_2);
            if ((((_arg_1 == "walkV")) || ((_arg_1 == "runV")))){
                this._vChangeEvent.data = _arg_1;
                dispatchEvent(this._vChangeEvent);
            };
            if (this._protect_setAttribValue != null){
                this._protect_setAttribValue(_arg_1, _arg_2);
            };
        }

        override public function getValueByName(_arg_1:String):Object
        {
            var _local_2:Object;
            if (this._protect_getProtectAttrib != null){
                _local_2 = this._protect_getProtectAttrib(_arg_1);
            };
            return ((((_local_2 == null)) ? super.getValueByName(_arg_1) : _local_2.value));
        }

        override public function updateAttribute(_arg_1:AttributeInfo, _arg_2:Boolean=false):void
        {
            super.updateAttribute(_arg_1, _arg_2);
            if (this._protect_updateAttribsValue != null){
                this._protect_updateAttribsValue(_arg_1);
            };
        }

        override public function copyValues(_arg_1:AttributeInfo):void
        {
            var _local_6:int;
            var _local_7:int;
            super.copyValues(_arg_1);
            openProtected = true;
            this.playerInfo = (_arg_1 as PlayerInfo);
            m_isDead = this.playerInfo.RTghostFlag;
            var _local_2:EthnicInfo = this.playerInfo.ethnicInfo;
            m_actionInfos = _local_2.actionInfos;
            var _local_3:Vector.<ActionInfo> = _local_2.defaultActionInfos;
            var _local_4:int = ((((_local_3 == null)) ? 0 : (_local_3.length)) - 1);
            while (_local_4 >= 0) {
                this.mapActionVKeys(_local_3[_local_4]);
                _local_4--;
            };
            var _local_5:Vector.<SkillModel> = this.playerInfo.skills;
            if (_local_5 != null){
                _local_6 = _local_5.length;
                _local_7 = 0;
                while (_local_7 < _local_6) {
                    this.addSkillModel(_local_5[_local_7]);
                    _local_7++;
                };
            };
        }

        override public function reset():void
        {
            isMain = false;
            this.playerInfo = null;
            this.m_vkeyMapActionIDs = new Dictionary();
            this.m_vHotKeyMapSkills = new Dictionary();
            m_actionInfos = null;
            this.m_currentActionInfo = null;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_854()
        {
        }


    }
}//package com.tencent.ai.core.player

// _SafeStr_854 = " PlayerModel" (String#17207)


