// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.ActorModel

package com.tencent.ai.core.actor.model
{
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.free.logging.warning;
    import com.tencent.ai.core.enum.SkillUseErrorCode;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.ActorInfo;
    import com.tencent.ai.core.enum.ActorRank;
    import com.tencent.ai.core.data.AttributeInfo;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.HurtType;
    import  ©init._SafeStr_35;
    import __AS3__.vec.*;

    public class ActorModel extends Attribute 
    {

        public var RT_ControllerSkills:Object;
        public var RT_ControllerVKeyMap:Dictionary;
        protected var m_sightRate:Number = 1;
        protected var m_sightValue:int = 0;
        public var sAttackRate:Number = 1;
        public var finalReduceDmgRate:Number = 0;
        public var holdFlag:int = 0;
        public var holdXRate:Number = 0;
        public var moveXRate:Number = 1;
        public var moveYRate:Number = 1;
        public var canBeCaught:int = 1;
        public var canLieDown:int = 1;
        public var invincible:int = 0;
        public var useSkillStep:int = 0;
        public var beHurtFloat:int = 1;
        public var beHurtBack:int = 1;
        public var beHurtChangeDir:int = 1;
        public var maxLieTime:int = 25;
        public var firstFloatHP:int = -1;
        public var openProtected:Boolean;
        public var reboundFlag:int = 0;
        public var id:uint;
        public var type:int = 0;
        public var direction:int = 1;
        public var rank:int;
        public var name:String;
        public var htmlName:String;
        public var isMain:Boolean = false;
        public var weapon_hurt_eid:int = 0;
        public var weapon_hurt_type:int = 1;
        public var weapon_create_id:int = 0;
        public var isAttacking:Boolean = false;
        public var actionID:int = -1;
        public var currentFrameIndex:int;
        public var variables:Array;
        public var statusModels:Vector.<SSModel>;
        public var addStatusModels:Vector.<SSModel>;
        protected var m_modelAttribs:Dictionary;
        protected var m_actionInfos:Dictionary;
        protected var m_actionIDMapSkills:Array;
        protected var m_floatProtectedDmg:int;
        protected var m_floatProtectedNow:Boolean;
        protected var m_landProtectedDmg:int;
        protected var m_landProtectedNow:Boolean;
        protected var m_isDead:Boolean = false;
        protected var m_protect_skillCheck:Function;
        private var _statusChangeEvent:ActorModelEvent;
        private var _mltimeChangeEvent:ActorModelEvent;
        private var _sightChangeEvent:ActorModelEvent;
        private var _changeSurvivalEvent:ActorModelEvent;

        public function ActorModel()
        {
            this.initThis();
        }

        public function set sightRate(_arg_1:Number):void
        {
            if (this.m_sightRate != _arg_1){
                this.m_sightRate = _arg_1;
                dispatchEvent(this._sightChangeEvent);
            };
        }

        public function set sightValue(_arg_1:int):void
        {
            if (this.m_sightValue != _arg_1){
                this.m_sightValue = _arg_1;
                dispatchEvent(this._sightChangeEvent);
            };
        }

        public function get sightRate():Number
        {
            return (this.m_sightRate);
        }

        public function get sightValue():int
        {
            return (this.m_sightValue);
        }

        protected function initThis():void
        {
            this.variables = [];
            this.currentFrameIndex = 0;
            this.m_actionIDMapSkills = [];
            this.m_modelAttribs = new Dictionary();
            this.statusModels = new Vector.<SSModel>();
            this._statusChangeEvent = new ActorModelEvent(ActorModelEvent.ON_STATUS_CHANGE, this);
            this._mltimeChangeEvent = new ActorModelEvent(ActorModelEvent.ON_MAXLIETIME_CHANGE, this);
            this._sightChangeEvent = new ActorModelEvent(ActorModelEvent.ON_SIGHT_DATA_CHANGE, this);
            this._changeSurvivalEvent = new ActorModelEvent(ActorModelEvent.ON_SURVIVAL_CHANGE, this);
            this.openProtected = false;
            this.m_floatProtectedNow = false;
            this.m_floatProtectedDmg = 0;
            this.m_landProtectedNow = false;
            this.m_landProtectedDmg = 0;
        }

        protected function addSkillModel(_arg_1:SkillModel):void
        {
            if (_arg_1 == null){
                return;
            };
            var _local_2:int = _arg_1.actionID;
            this.m_actionIDMapSkills[_local_2] = _arg_1;
        }

        public function getActionIDMapSkills():Array
        {
            return (this.m_actionIDMapSkills);
        }

        public function getActionInfo(_arg_1:int):ActionInfo
        {
            if (this.m_actionInfos == null){
                return (null);
            };
            return (this.m_actionInfos[_arg_1]);
        }

        public function getActionInfos():Dictionary
        {
            return (this.m_actionInfos);
        }

        public function setActionInfo(_arg_1:int, _arg_2:ActionInfo):void
        {
            if (this.m_actionInfos == null){
                this.m_actionInfos = new Dictionary();
            };
            this.m_actionInfos[_arg_1] = _arg_2;
        }

        public function onUseSkillError(_arg_1:int, _arg_2:SkillModel=null):void
        {
        }

        public function onSkillUsed(_arg_1:SkillModel):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_2:SkillModel = _arg_1;
            if (_local_2 != null){
                _local_3 = _local_2.cd_group;
                if (_local_3 == 0){
                    _local_2.lastFrameIndex = this.currentFrameIndex;
                } else {
                    _local_4 = this.m_actionIDMapSkills.length;
                    _local_5 = 0;
                    while (_local_5 < _local_4) {
                        _arg_1 = this.m_actionIDMapSkills[_local_5];
                        if (((!((_arg_1 == null))) && ((_arg_1.cd_group == _local_3)))){
                            _arg_1.lastFrameIndex = this.currentFrameIndex;
                        };
                        _local_5++;
                    };
                };
                _local_2 = null;
            };
        }

        public function hasActionID(_arg_1:int, _arg_2:int):Boolean
        {
            return (!((this.getSkillModel(_arg_1, _arg_2) == null)));
        }

        public function canAct(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:SkillModel = this.getSkillModel(_arg_1, _arg_2);
            if ((((((_local_3 == null)) || ((_local_3.mana_cost > mp)))) || ((_local_3.angryVal_cost < angry_val)))){
                return (false);
            };
            return (_local_3.isCD(this.currentFrameIndex));
        }

        public function getSkillModel(_arg_1:int, _arg_2:int=0):SkillModel
        {
            return (this.m_actionIDMapSkills[_arg_1]);
        }

        public function act(_arg_1:int, _arg_2:int=0, _arg_3:int=0):Boolean
        {
            var _local_4:SkillModel = this.getSkillModel(_arg_1, _arg_3);
            if (_local_4 == null){
                warning((("技能[" + _arg_1) + "] 不存在..."));
                this.onUseSkillError(SkillUseErrorCode.SKILL_EMPTY_CODE, null);
                return (false);
            };
            _local_4.useIndex(_arg_2);
            return (this.useSkill(_local_4));
        }

        public function useSkill(_arg_1:SkillModel):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1 == null){
                return (false);
            };
            if (!_arg_1.isCD(this.currentFrameIndex)){
                _local_2 = _arg_1.mana_cost;
                if (_local_2 <= mp){
                    _local_3 = _arg_1.angryVal_cost;
                    if (_local_3 <= angry_val){
                        if (_local_2 > 0){
                            this.updateMP((0 - _local_2));
                        };
                        if (_local_3 > 0){
                            this.updateAngryVal((0 - _local_3));
                        };
                        if (this.m_protect_skillCheck != null){
                            this.m_protect_skillCheck(_arg_1, this.currentFrameIndex);
                        };
                        return (true);
                    };
                    this.onUseSkillError(SkillUseErrorCode.LACK_ANGRYVAL_CODE, _arg_1);
                } else {
                    this.onUseSkillError(SkillUseErrorCode.LACK_MANA_CODE, _arg_1);
                };
            } else {
                this.onUseSkillError(SkillUseErrorCode.SKILL_CD_CODE, _arg_1);
            };
            return (false);
        }

        public function changeSurvivalState(_arg_1:Boolean):void
        {
            if (this.m_isDead != _arg_1){
                this.m_isDead = _arg_1;
                if (!this.m_isDead){
                    this.updateHP((int.MAX_VALUE - hp));
                    this.updateMP((int.MAX_VALUE - mp));
                };
                this._changeSurvivalEvent.data = !(this.m_isDead);
                dispatchEvent(this._changeSurvivalEvent);
            };
        }

        public function get isDead():Boolean
        {
            return (this.m_isDead);
        }

        public function updateHP(_arg_1:int):void
        {
            hp = (hp + _arg_1);
        }

        public function updateMP(_arg_1:int):void
        {
            mp = (mp + _arg_1);
        }

        public function updateAngryVal(_arg_1:int):void
        {
            angry_val = (angry_val + _arg_1);
        }

        public function updateFloatProtected(_arg_1:int):void
        {
            if (!this.m_floatProtectedNow){
                this.m_floatProtectedDmg = (this.m_floatProtectedDmg + _arg_1);
                if ((this.m_floatProtectedDmg / this.firstFloatHP) > 0.25){
                    this.m_floatProtectedDmg = 0;
                    this.m_floatProtectedNow = true;
                };
            } else {
                this.m_floatProtectedDmg = (this.m_floatProtectedDmg + _arg_1);
                weight = (int(((this.m_floatProtectedDmg * DEFINE.G_PROTECTED_DMG_Q) / level)) + m_bindInfo.weight);
            };
        }

        public function updateLandProtected(_arg_1:int):void
        {
            if (!this.m_landProtectedNow){
                this.m_landProtectedDmg = (this.m_landProtectedDmg + _arg_1);
                if ((this.m_landProtectedDmg / this.firstFloatHP) > 0.2){
                    this.m_landProtectedNow = true;
                };
            };
        }

        public function get landProtected():Boolean
        {
            return (this.m_landProtectedNow);
        }

        public function clearFloatFlag():void
        {
            if (this.openProtected){
                weight = m_bindInfo.weight;
                this.m_floatProtectedNow = false;
                this.m_floatProtectedDmg = 0;
                this.m_landProtectedNow = false;
                this.m_landProtectedDmg = 0;
            };
            this.firstFloatHP = -1;
            this.reboundFlag = 0;
        }

        public function updateActionID(_arg_1:int):Boolean
        {
            if (this.actionID == _arg_1){
                return (false);
            };
            this.actionID = _arg_1;
            return (true);
        }

        public function addOpAttribItem(_arg_1:OpAttribItem):Boolean
        {
            var _local_2:String;
            var _local_3:ModelAttrib;
            if (_arg_1 != null){
                _local_2 = _arg_1.name;
                _local_3 = this.m_modelAttribs[_local_2];
                if (_local_3 == null){
                    _local_3 = new ModelAttrib(this, _local_2);
                    this.m_modelAttribs[_local_2] = _local_3;
                };
                return (_local_3.addOpAttribItem(_arg_1));
            };
            return (false);
        }

        public function removeOpAttribItem(_arg_1:OpAttribItem):Boolean
        {
            var _local_2:String;
            var _local_3:ModelAttrib;
            if (_arg_1 != null){
                _local_2 = _arg_1.name;
                _local_3 = this.m_modelAttribs[_local_2];
                if (_local_3 != null){
                    _local_3.removeOpAttribItem(_arg_1);
                };
            };
            return (false);
        }

        public function getModelAttrib(_arg_1:String):ModelAttrib
        {
            return (this.m_modelAttribs[_arg_1]);
        }

        public function onTimeTick(_arg_1:int):void
        {
            this.currentFrameIndex = _arg_1;
        }

        public function fireStatusEvent(_arg_1:Boolean=true):void
        {
            this._statusChangeEvent.data = ((_arg_1) ? "add" : "remove");
            dispatchEvent(this._statusChangeEvent);
        }

        public function addStatusModel(_arg_1:SSModel, _arg_2:Boolean=true):void
        {
            this.statusModels.push(_arg_1);
            if (!_arg_1.isBorn){
                this.addStatusModels.push(_arg_1);
                if (_arg_2){
                    this.fireStatusEvent();
                };
            };
        }

        public function removeStatusModel(_arg_1:SSModel, _arg_2:Boolean=true):void
        {
            var _local_3:int = this.statusModels.indexOf(_arg_1);
            if (_local_3 != -1){
                this.statusModels.splice(_local_3, 1);
                if (!_arg_1.isBorn){
                    _local_3 = this.addStatusModels.indexOf(_arg_1);
                    if (_local_3 != -1){
                        this.addStatusModels.splice(_local_3, 1);
                    };
                    if (_arg_2){
                        this.fireStatusEvent(false);
                    };
                };
            };
        }

        public function removeBornStatusModels():void
        {
            var _local_1:int = (this.statusModels.length - 1);
            while (_local_1 > 0) {
                if (this.statusModels[_local_1].isBorn){
                    this.statusModels.splice(_local_1, 1);
                };
                _local_1--;
            };
        }

        public function clearStatusModels(_arg_1:Boolean=true):void
        {
            if (this.statusModels.length > 0){
                this.statusModels.length = 0;
                if (_arg_1){
                    this._statusChangeEvent.data = "clear";
                    dispatchEvent(this._statusChangeEvent);
                };
            };
        }

        public function set eventMaxLieTime(_arg_1:int):void
        {
            if (this.maxLieTime != _arg_1){
                this.maxLieTime = _arg_1;
                dispatchEvent(this._mltimeChangeEvent);
            };
        }

        public function get eventMaxLieTime():int
        {
            return (this.maxLieTime);
        }

        public function isValidity(_arg_1:int=0):Boolean
        {
            return (((!((m_bindInfo == null))) && ((this.type > _arg_1))));
        }

        override public function copyValues(_arg_1:AttributeInfo):void
        {
            super.copyValues(_arg_1);
            var _local_2:ActorInfo = (_arg_1 as ActorInfo);
            this.addStatusModels = new Vector.<SSModel>();
            this.id = _local_2.id;
            this.direction = _local_2.diretion;
            this.rank = _local_2.rank;
            this.name = _local_2.name;
            this.htmlName = "";
            this.isMain = _local_2.isMain;
            this.weapon_hurt_eid = _local_2.weapon_hurt_eid;
            this.weapon_create_id = _local_2.weapon_create_id;
            this.weapon_hurt_type = _local_2.weapon_hurt_Type;
            this.m_floatProtectedDmg = 0;
            this.openProtected = (this.rank == ActorRank.BOSS);
        }

        override public function reset():void
        {
            this.m_isDead = false;
            this.m_sightRate = 1;
            this.m_sightValue = 0;
            this.finalReduceDmgRate = 0;
            this.holdFlag = 0;
            this.holdXRate = 0;
            this.moveXRate = 1;
            this.moveYRate = 1;
            this.canBeCaught = 1;
            this.canLieDown = 1;
            this.invincible = 0;
            this.useSkillStep = 0;
            this.beHurtFloat = 1;
            this.beHurtBack = 1;
            this.beHurtChangeDir = 1;
            this.reboundFlag = 0;
            this.maxLieTime = 25;
            this.firstFloatHP = -1;
            this.id = 0;
            this.direction = Direction.RIGHT;
            this.rank = ActorRank.NORMAL;
            this.isMain = false;
            this.weapon_hurt_eid = 0;
            this.weapon_create_id = 0;
            this.weapon_hurt_type = HurtType.HURT_TOUCH;
            this.actionID = -1;
            this.isAttacking = false;
            this.variables.length = 0;
            this.currentFrameIndex = 0;
            this.m_actionIDMapSkills.length = 0;
            this.m_modelAttribs = new Dictionary();
            this.m_floatProtectedNow = false;
            this.m_floatProtectedDmg = 0;
            this.openProtected = false;
            this.m_landProtectedNow = false;
            this.m_landProtectedDmg = 0;
            this.statusModels.length = 0;
            this.addStatusModels = null;
            this.RT_ControllerSkills = null;
            this.RT_ControllerVKeyMap = null;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_35()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_35 = " ActorModel" (String#14339)


