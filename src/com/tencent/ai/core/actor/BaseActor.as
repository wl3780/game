// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.BaseActor

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.status.ISpecialStatusTarget;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.AttackType;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.RideType;
    import com.tencent.ai.core.element.shadow.ShadowPools;
    import com.tencent.ai.core.enum.ShadowType;
    import com.tencent.ai.core.data.ActorInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.action.hurt.BaseHurtAction;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.data.SSTypeInfo;
    import com.tencent.ai.core.status.impl.RemoveSS;
    import com.tencent.ai.core.func.asyn_apply_funcs;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.data.arg.script.CColorScriptArg;
    import com.tencent.ai.core.enum.HurtType;
    import com.tencent.ai.core.enum.HurtColorStyle;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.exec_behind_frame;
    import  ©init._SafeStr_45;
    import __AS3__.vec.*;

    public class BaseActor extends HasActionElement implements ISpecialStatusTarget 
    {

        private static var _ATTACK_HURT_ACTION:Dictionary;
        private static var _BORN_RECOVER_SSMODEL:SSModel;
        private static var _DMGMETERS:IDmgMetersManager;
        private static var _SSM:ISpecialStatusManager;

        public var actorHeight:int;
        protected var m_statuses:Vector.<ISpecialStatus>;
        protected var m_bornStatuses:Vector.<ISpecialStatus>;
        protected var m_actorView:IActorView;
        protected var m_model:ActorModel;
        protected var m_master:BaseActor;
        protected var m_autoActAI:ActorAutoAI;
        protected var m_nextFrameAct:CFunction;
        protected var m_action_change:Function;
        protected var m_nextFrameFunc:CFunction;
        protected var m_nextFrameFuncParams:Array;
        protected var m_rideActor:BaseActor;
        protected var m_rideType:int;
        private var _deadEvent:ElementEvent;
        private var _beforeAttackEvent:ElementEvent;
        private var _beforeHurtEvent:ElementEvent;
        private var _tickEvent:ElementEvent;
        private var _active:Boolean;
        private var _pmsframes:int;
        private var _addStatusModels:Vector.<SSModel>;
        private var _immortal:Boolean;

        public function BaseActor(_arg_1:String, _arg_2:ActorModel=null)
        {
            this.m_model = _arg_2;
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_statuses = new Vector.<ISpecialStatus>();
            this.m_bornStatuses = new Vector.<ISpecialStatus>();
            if (this.m_model == null){
                this.m_model = new ActorModel();
            };
            if (_ATTACK_HURT_ACTION == null){
                _ATTACK_HURT_ACTION = new Dictionary();
                _ATTACK_HURT_ACTION[AttackType.ATTACK_NORMAL] = [BaseActionIDDef.BEHURT, VKeyDef.HURT];
                _ATTACK_HURT_ACTION[AttackType.ATTACK_CATCH] = [BaseActionIDDef.CAUGHT, VKeyDef.CAUGHT];
                _ATTACK_HURT_ACTION[AttackType.ATTACK_THROW] = [BaseActionIDDef.BETHROWN, VKeyDef.BETHROWN];
                _ATTACK_HURT_ACTION[AttackType.ATTACK_CAPTIVE] = [BaseActionIDDef.CAPTIVE, VKeyDef.CAPTIVE];
                _ATTACK_HURT_ACTION[AttackType.ATTACK_NORMAL_MAX] = _ATTACK_HURT_ACTION[AttackType.ATTACK_NORMAL];
            };
            this._deadEvent = new ElementEvent(ElementEvent.ON_ELEMENT_DEAD, this);
            this._beforeAttackEvent = new ElementEvent(ElementEvent.ON_BEFORE_ATTACK, this);
            this._beforeAttackEvent.data = {};
            this._beforeHurtEvent = new ElementEvent(ElementEvent.ON_BEFORE_HURT, this);
            this._tickEvent = new ElementEvent(ElementEvent.ON_TICK, this);
            this.m_nextFrameFunc = new CFunction(this._nextFrameVKeyAct, this);
            this.m_nextFrameFuncParams = [];
            this._active = false;
            this._immortal = false;
            this.m_rideType = RideType.RIDE_TYPE_UNKNOW;
            this.m_rideActor = null;
        }

        protected function buildShadow(_arg_1:Object=null):void
        {
            if (m_shadow == null){
                m_shadow = ShadowPools.createShadowElement(ShadowType.NORMAL);
            };
            m_shadow.setTarget(this);
            m_shadow.initialize(_arg_1);
        }

        protected function setActorView(_arg_1:IActorView):void
        {
            this.m_actorView = _arg_1;
            this.m_view = _arg_1;
            this.m_display = _arg_1.getDisplay();
        }

        protected function __initialize(_arg_1:ActorInfo):void
        {
            this.m_nextFrameFuncs.length = 0;
            this.m_actorInfo = _arg_1;
            this.groupID = _arg_1.groupID;
            this.updateBornStatus(_arg_1.bornSSmodels);
            this._addStatusModels = _arg_1.addStatusModels;
            _arg_1.addStatusModels = this.m_model.addStatusModels;
            this.m_model.fireStatusEvent();
            this.buildShadow();
            this._active = true;
        }

        protected function _nextFrameVKeyAct():void
        {
            this.m_nextFrameAct = null;
            vKeyAct(this.m_nextFrameFuncParams[0], this.m_nextFrameFuncParams[1]);
        }

        override protected function executeFrame(_arg_1:int):void
        {
            super.executeFrame(_arg_1);
            this._pmsframes = (this._pmsframes - 1);
            if (this._pmsframes <= 0){
                this.m_model.onTimeTick(_arg_1);
                this._tickEvent.data = _arg_1;
                dispatchEvent(this._tickEvent);
                this._pmsframes = DEFINE.FPMS;
            };
        }

        protected function handleHurtBreak(_arg_1:AttackInfo):void
        {
            var _local_3:Array;
            var _local_2:BaseHurtAction = (m_currentAction as BaseHurtAction);
            if ((((_local_2 == null)) || (!(_local_2.handleHurt(m_controller, _arg_1))))){
                _local_3 = _ATTACK_HURT_ACTION[_arg_1.attackType];
                if ((((_arg_1.attackType == AttackType.ATTACK_CATCH)) && (!((this.m_model.canBeCaught == 1))))){
                    _local_3 = _ATTACK_HURT_ACTION[AttackType.ATTACK_NORMAL];
                };
                m_controller.actHurtAction(_local_3[0], _local_3[1], _arg_1);
            };
        }

        protected function handleHurtHold(_arg_1:AttackInfo):void
        {
            var _local_2:SkillInfo;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if (this.m_model.holdXRate != 0){
                _local_2 = _arg_1.skillInfo;
                if (_local_2 != null){
                    _local_3 = ((_local_2.powerX * this.m_model.holdXRate) * this.m_model.beHurtBack);
                    if (_local_3 > 0){
                        _local_4 = _arg_1.dir;
                        _local_3 = ((_local_3 * _local_4) * -1);
                        _local_5 = (m_scene.getInfo().friction * _local_4);
                        this.slip(PosArg.DIR_X, _local_3, _local_5);
                    };
                };
            };
            if (((!((_arg_1.attackType == AttackType.ATTACK_NO_BREAK))) && ((_arg_1.hurtColorValue == 0)))){
                _local_2 = _arg_1.skillInfo;
                _local_6 = ((_local_2) ? _local_2.freezTimes : 0);
                if (_local_6 > 0){
                    freeze(_local_6);
                };
                _arg_1.hurtColorValue = 1025;
            };
            this.acceptDmg(_arg_1);
        }

        override public function changeGroup(_arg_1:int):void
        {
            if (m_actorInfo != null){
                m_actorInfo.groupID = _arg_1;
            };
            super.changeGroup(_arg_1);
        }

        public function setMaster(_arg_1:BaseActor):void
        {
            var _local_2:int;
            this.m_master = _arg_1;
            if (this.m_master != null){
                _local_2 = this.m_master.groupID;
                if (_local_2 == ElementGroupDef.PVE_IGNORE){
                    _local_2 = this.m_master.getActorInfo().groupID2;
                };
                this.changeGroup(_local_2);
            };
        }

        public function getMaster():BaseActor
        {
            return (this.m_master);
        }

        public function rideActor(_arg_1:int, _arg_2:BaseActor=null):void
        {
            this.m_rideType = _arg_1;
            this.m_rideActor = _arg_2;
            BaseActorController(m_controller).manualControl((this.m_rideType == RideType.RIDE_TYPE_HORSE));
        }

        public function setRideType(_arg_1:int):void
        {
            this.m_rideType = _arg_1;
        }

        public function getRideType():int
        {
            return (this.m_rideType);
        }

        public function getRideActor():BaseActor
        {
            return (this.m_rideActor);
        }

        public function updateBornStatus(_arg_1:Vector.<SSModel>):void
        {
            this.removeBornStatuses();
            if (_SSM == null){
                _SSM = AICore.combatSystem.getSpecialStatusManager();
            };
            if (_BORN_RECOVER_SSMODEL == null){
                _BORN_RECOVER_SSMODEL = new SSModel();
                _BORN_RECOVER_SSMODEL.setStatusInfo(AICore.data.getSpecialStatusInfo(10000));
                _BORN_RECOVER_SSMODEL.isBorn = true;
                _BORN_RECOVER_SSMODEL.ssID = 10000;
            };
            _SSM.applyStatus(this, 0, _BORN_RECOVER_SSMODEL, false);
            var _local_2:int = (((_arg_1)!=null) ? _arg_1.length : 0);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _SSM.applyStatus(this, 0, _arg_1[_local_3], false);
                _local_3++;
            };
        }

        public function udpateADDStatus(_arg_1:Vector.<SSModel>):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1 != null){
                _local_2 = (((_arg_1)!=null) ? _arg_1.length : 0);
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _SSM.applyStatus(this, 0, _arg_1[_local_3], false);
                    _local_3++;
                };
            };
        }

        override public function setParentContainer(_arg_1:IElementContainer):void
        {
            super.setParentContainer(_arg_1);
            this.udpateADDStatus(this._addStatusModels);
            this._addStatusModels = null;
        }

        public function addStatus(_arg_1:ISpecialStatus, _arg_2:Boolean=true):Boolean
        {
            var _local_5:int;
            var _local_6:ISpecialStatus;
            var _local_7:int;
            var _local_8:SSModel;
            var _local_3:Boolean = true;
            var _local_4:Boolean;
            if (!_arg_1.isBorn()){
                _local_5 = (this.m_statuses.length - 1);
                while (_local_5 >= 0) {
                    _local_6 = this.m_statuses[_local_5];
                    _local_7 = _arg_1.compare(_local_6);
                    if (_local_7 == SSTypeInfo.COMPARE_CODE_YES){
                        this.m_statuses.splice(_local_5, 1);
                        _local_8 = _local_6.getModel();
                        _local_6.dispose();
                        this.m_model.removeStatusModel(_local_8, false);
                        _local_4 = true;
                    } else {
                        if (_local_7 == SSTypeInfo.COMPARE_CODE_NO){
                            _local_3 = false;
                            break;
                        };
                    };
                    _local_5--;
                };
            };
            if (_local_3){
                if (_arg_1 != RemoveSS.INSTANCE){
                    _arg_1.execute();
                    this.m_statuses.push(_arg_1);
                    this.m_model.addStatusModel(_arg_1.getModel(), _arg_2);
                    return (true);
                };
            };
            if (((_arg_2) && (_local_4))){
                this.m_model.fireStatusEvent(false);
            };
            return (false);
        }

        public function removeStatus(_arg_1:ISpecialStatus, _arg_2:Boolean=true):Boolean
        {
            var _local_3:Vector.<ISpecialStatus>;
            var _local_4:int;
            var _local_5:SSModel;
            if (_arg_1 != null){
                _local_3 = ((_arg_1.isBorn()) ? this.m_bornStatuses : this.m_statuses);
                _local_4 = _local_3.indexOf(_arg_1);
                if (_local_4 != -1){
                    _local_5 = _arg_1.getModel();
                    _local_3.splice(_local_4, 1);
                    _arg_1.dispose();
                    this.m_model.removeStatusModel(_local_5, _arg_2);
                    return (true);
                };
            };
            return (false);
        }

        public function getStatus(_arg_1:Boolean=false):Vector.<ISpecialStatus>
        {
            return (((_arg_1) ? (this.m_bornStatuses) : this.m_statuses));
        }

        override public function beHurt(_arg_1:AttackInfo):Boolean
        {
            if ((((m_currentAction == null)) || (m_currentAction.beHurt(_arg_1)))){
                this._beforeHurtEvent.data = _arg_1;
                dispatchEvent(this._beforeHurtEvent);
                if (!_arg_1.isMiss){
                    if (this.m_model.holdFlag > _arg_1.attackType){
                        this.handleHurtHold(_arg_1);
                    } else {
                        this.handleHurtBreak(_arg_1);
                        super.beHurt(_arg_1);
                    };
                    return (true);
                };
            };
            return (false);
        }

        override public function act(_arg_1:int, _arg_2:int, _arg_3:Object=null):Boolean
        {
            if (((this._active) && (super.act(_arg_1, _arg_2, _arg_3)))){
                if (m_currentAction != null){
                    _arg_1 = m_currentAction.getActionID();
                    this.m_model.updateActionID(_arg_1);
                    if (this.m_action_change != null){
                        this.m_action_change(_arg_1);
                    };
                };
                return (true);
            };
            return (false);
        }

        override public function move(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            _arg_2 = (_arg_2 * this.m_model.moveXRate);
            super.move(_arg_1, _arg_2, _arg_3);
        }

        override public function slip(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:CFunction=null, _arg_5:Boolean=false):void
        {
            _arg_2 = (_arg_2 * this.m_model.moveXRate);
            super.slip(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        override public function jump(_arg_1:int, _arg_2:CFunction=null, _arg_3:CFunction=null, _arg_4:int=-1):void
        {
            if (_arg_1 > 0){
                _arg_1 = (_arg_1 * this.m_model.moveYRate);
            };
            super.jump(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function getHurtRects():Array
        {
            return ((((this.m_model.invincible == 1)) ? (null) : super.getHurtRects()));
        }

        override public function forceSetDirection(_arg_1:int):void
        {
            super.forceSetDirection(_arg_1);
            this.m_model.direction = _arg_1;
        }

        public function applySFs(_arg_1:Array, _arg_2:Object, _arg_3:String=null):void
        {
            if (!this.m_model.isDead){
                asyn_apply_funcs(this, _arg_1, _arg_3, _arg_2);
            };
        }

        public function getModel():ActorModel
        {
            return (this.m_model);
        }

        override public function attackProcess(_arg_1:AttackInfo, _arg_2:InteractElement):void
        {
            var _local_3:BaseActor = (_arg_2 as BaseActor);
            if (((!((_local_3 == null))) && (!(_arg_1.isMiss)))){
                this._beforeAttackEvent.data.hurtActor = _local_3;
                this._beforeAttackEvent.data.attackInfo = _arg_1;
                dispatchEvent(this._beforeAttackEvent);
            };
        }

        public function autoAIAct(_arg_1:int, _arg_2:Object):void
        {
            if (_arg_1 != 0){
                if (this.m_autoActAI == null){
                    this.m_autoActAI = new ActorAutoAI();
                };
                if (m_aiCom != this.m_autoActAI){
                    setAIComponent(this.m_autoActAI);
                };
                this.m_autoActAI.act(_arg_1, _arg_2);
            } else {
                setAIComponent(null);
            };
        }

        override public function set isAIComRun(_arg_1:Boolean):void
        {
            if (!_arg_1){
                if (m_aiCom == this.m_autoActAI){
                    return;
                };
            };
            super.isAIComRun = _arg_1;
        }

        public function revive():Boolean
        {
            if (this.m_model.isDead){
                this.m_model.changeSurvivalState(false);
                vKeyAct(VKeyDef.EMPTY);
                return (true);
            };
            return (false);
        }

        public function suicide(_arg_1:Boolean=true):void
        {
        }

        public function sendServerDead(_arg_1:int):void
        {
        }

        public function acceptDmg(_arg_1:AttackInfo):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:SkillInfo;
            var _local_8:CColorScriptArg;
            if (_arg_1.hurtType != HurtType.HURT_FAKE){
                _arg_1.iHurt = this.m_model.isMain;
                _arg_1.hurtET = getType();
                _arg_1.hurtID = this.m_model.id;
                _arg_1.hurtActorModel = this.m_model;
                _arg_1.hurtActor = this;
                _local_2 = ((_arg_1.dmgValue + _arg_1.addDmgValue) * (1 - this.m_model.finalReduceDmgRate));
                _local_2 = (((_local_2 <= 0)) ? 1 : _local_2);
                _arg_1.dmgValue = _local_2;
                if (_arg_1.hurtType != HurtType.HURT_NOTHING){
                    if (_DMGMETERS == null){
                        _DMGMETERS = AICore.combatSystem.getDmgMeters();
                    };
                    _DMGMETERS.inputAttack(_arg_1);
                };
                _local_3 = _arg_1.hurtColorValue;
                if (_local_3 > 0){
                    _local_8 = new CColorScriptArg(HurtColorStyle.COLORS[((_local_3 & 0xFF00) >> 8)]);
                    _local_8.times = (_local_3 & 0xFF);
                    onScript(ScriptCmdDef.SC_TARGET_CCOLOR, _local_8);
                };
                _local_4 = this.m_model.hp;
                _local_5 = !(this.m_model.isDead);
                _local_6 = this.updateHP((0 - _local_2), _arg_1);
                if (((_local_6) && (_local_5))){
                    _DMGMETERS.inputActorDead(_arg_1, _local_2, _local_4, this.m_model.maxhp);
                };
                _local_7 = _arg_1.skillInfo;
                if (((!((_local_7 == null))) && (!((_local_7.hit_funcIDs == null))))){
                    this.applySFs(_local_7.hit_funcIDs, {"source":_arg_1.attackActor});
                };
                return (_local_6);
            };
            return (this.getIsDead());
        }

        public function cancelNextFrameAct():void
        {
            var _local_1:int;
            if (this.m_nextFrameAct != null){
                _local_1 = m_nextFrameFuncs.indexOf(this.m_nextFrameAct);
                if (_local_1 != -1){
                    m_nextFrameFuncs.splice(_local_1, 1);
                };
                this.m_nextFrameAct = null;
            };
        }

        public function nextFrameAct(_arg_1:int=-1, _arg_2:Object=null):void
        {
            this.cancelNextFrameAct();
            this.m_nextFrameAct = this.m_nextFrameFunc;
            this.m_nextFrameFuncParams[0] = _arg_1;
            this.m_nextFrameFuncParams[1] = _arg_2;
            execNextFrame(this.m_nextFrameAct);
        }

        public function updateHP(_arg_1:int, _arg_2:Object=null):Boolean
        {
            var _local_3:Boolean = true;
            if (!this.m_model.isDead){
                if (_arg_1 != 0){
                    this.m_model.updateHP(_arg_1);
                };
                if ((((this.m_model.hp == 0)) && (!(this._immortal)))){
                    this.m_model.changeSurvivalState(true);
                    _local_3 = true;
                    this._deadEvent.data = _arg_2;
                    exec_behind_frame(new CFunction(dispatchEvent, this, [this._deadEvent]));
                } else {
                    _local_3 = false;
                };
            };
            return (_local_3);
        }

        public function updateMP(_arg_1:int):void
        {
            if (((!(this.m_model.isDead)) && (!((_arg_1 == 0))))){
                this.m_model.updateMP(_arg_1);
            };
        }

        public function updateAngryVal(_arg_1:int):void
        {
            if (_arg_1 != 0){
                this.m_model.updateAngryVal(_arg_1);
            };
        }

        public function toBeImmortal():void
        {
            this._immortal = true;
        }

        public function immortalDead():void
        {
            this._immortal = false;
            this.updateHP(int.MIN_VALUE);
            this._immortal = true;
        }

        public function getActorView():IActorView
        {
            return (this.m_actorView);
        }

        public function removeBornStatuses():void
        {
            var _local_1:int;
            var _local_2:int;
            if (this.m_bornStatuses != null){
                _local_1 = this.m_bornStatuses.length;
                _local_2 = 0;
                while (_local_2 < _local_1) {
                    this.m_bornStatuses[_local_2].dispose();
                    _local_2++;
                };
                this.m_bornStatuses.length = 0;
                this.m_model.removeBornStatusModels();
            };
        }

        public function clearAllStatuses(_arg_1:Boolean=true):void
        {
            var _local_2:int;
            var _local_3:int;
            if (this.m_bornStatuses != null){
                _local_2 = this.m_bornStatuses.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    this.m_bornStatuses[_local_3].dispose();
                    _local_3++;
                };
                this.m_bornStatuses.length = 0;
            };
            if (this.m_statuses != null){
                _local_2 = this.m_statuses.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    this.m_statuses[_local_3].dispose();
                    _local_3++;
                };
                this.m_statuses.length = 0;
            };
            if (this.m_model != null){
                this.m_model.clearStatusModels(_arg_1);
            };
            this._addStatusModels = null;
        }

        override public function getIsDead():Boolean
        {
            return (this.m_model.isDead);
        }

        override public function getCanBeCaught():Boolean
        {
            return ((((this.m_model.canBeCaught == 1)) && (!(isCaught))));
        }

        override public function getBodyHeight():Number
        {
            if (this.actorHeight != 0){
                return (this.actorHeight);
            };
            return (super.getBodyHeight());
        }

        override public function setCanBeCaught(_arg_1:Boolean):void
        {
            this.m_model.canBeCaught = ((_arg_1) ? (1) : 0);
        }

        override public function reset():void
        {
            this.m_nextFrameAct = null;
            this.m_master = null;
            this.clearAllStatuses(false);
            if (m_inited){
                setAIComponent(null);
                if (m_currentAction != null){
                    m_currentAction.stop();
                };
                this.m_model.reset();
                if (m_shadow != null){
                    m_shadow.reset();
                    ShadowPools.returnShadowElement(m_shadow);
                    m_shadow = null;
                };
            };
            this._immortal = false;
            this._active = false;
            this._pmsframes = DEFINE.FPMS;
            this.actorHeight = 0;
            this.m_rideType = RideType.RIDE_TYPE_UNKNOW;
            this.m_rideActor = null;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_45()
        {
        }


    }
}//package com.tencent.ai.core.actor

// _SafeStr_45 = " BaseActor" (String#14408)


