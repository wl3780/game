// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.impl.DMGMetersManager

package com.tencent.ai.core.combat.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.element.ITickObject;
    import com.tencent.ai.core.scene.IScene;
    import flash.geom.Point;
    import com.tencent.ai.core.data.DmgInfo;
    import com.tencent.ai.core.events.DMGMetersEvent;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.player.PlayerModel;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_75;

    public class DMGMetersManager extends EventDispatcher2 implements IDmgMetersManager, ITickObject 
    {

        protected var m_currScene:IScene;
        protected var m_lastTime:int;
        protected var m_sceneOffset:Point;
        protected var m_iAttackTime:int;
        protected var m_iAttackID:int;
        protected var m_iHitCombo:int;
        protected var m_prevComboDmg:int;
        protected var m_minComboTime:int;
        protected var m_dmgInfo:DmgInfo;
        protected var m_AttackEvent:DMGMetersEvent;
        protected var m_DmgInfoEvent:DMGMetersEvent;
        protected var m_KilledEvent:DMGMetersEvent;
        protected var m_hpEvent:DMGMetersEvent;
        protected var m_mpEvent:DMGMetersEvent;
        protected var m_angryEvent:DMGMetersEvent;
        protected var m_beatHurtEvent:DMGMetersEvent;
        protected var m_accept:Boolean;


        public function initialize(_arg_1:Object=null):void
        {
            this.m_accept = false;
            this.m_lastTime = 0;
            this.m_iHitCombo = 0;
            this.m_iAttackID = 0;
            this.m_iAttackTime = 0;
            this.m_minComboTime = 2000;
            this.m_prevComboDmg = 0;
            this.m_dmgInfo = new DmgInfo();
            this.m_AttackEvent = new DMGMetersEvent(DMGMetersEvent.ON_ATTACK_HAPPENED, this);
            this.m_DmgInfoEvent = new DMGMetersEvent(DMGMetersEvent.ON_DMGINFO_UPDATE, this);
            this.m_KilledEvent = new DMGMetersEvent(DMGMetersEvent.ON_MONSTER_KILLED, this);
            this.m_hpEvent = new DMGMetersEvent(DMGMetersEvent.ON_ACTOR_HP_UPDATE, this);
            this.m_mpEvent = new DMGMetersEvent(DMGMetersEvent.ON_ACTOR_MP_UPDATE, this);
            this.m_angryEvent = new DMGMetersEvent(DMGMetersEvent.ON_ACTOR_ANGRY_UPDATE, this);
            this.m_beatHurtEvent = new DMGMetersEvent(DMGMetersEvent.ON_BEAT_HURT_CHANGE, this);
        }

        protected function iStatistics(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:AttackInfo):void
        {
            var _local_7:int;
            if (((!(_arg_3)) && (_arg_4))){
                _local_7 = (_arg_6.dmgValue + _arg_6.addDmgValue);
                if ((_arg_2 - this.m_iAttackTime) <= this.m_minComboTime){
                    this.m_iHitCombo = (this.m_iHitCombo + 1);
                    this.m_dmgInfo.combo_dmg = (this.m_dmgInfo.combo_dmg + (this.m_prevComboDmg + _local_7));
                    this.m_prevComboDmg = 0;
                } else {
                    this.m_iHitCombo = 1;
                    this.m_prevComboDmg = _local_7;
                };
                if (this.m_dmgInfo.comboPlus(this.m_iHitCombo)){
                    this.m_beatHurtEvent.hitCombo = this.m_iHitCombo;
                    dispatchEvent(this.m_beatHurtEvent);
                };
                this.m_dmgInfo.all_dmg = (this.m_dmgInfo.all_dmg + _local_7);
                this.m_dmgInfo.attackInfoPlus(_arg_6);
                this.m_iAttackTime = _arg_2;
            };
            if (_arg_5){
                this.m_dmgInfo.hurtPlus();
            };
        }

        protected function statistics(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:AttackInfo):void
        {
            if (this.m_lastTime != _arg_2){
                this.m_sceneOffset = this.m_currScene.getCamera().getOffset();
                this.m_lastTime = _arg_2;
            };
            this.m_AttackEvent.attackInfo = _arg_4;
            this.m_AttackEvent.sceneOffset = this.m_sceneOffset;
            this.m_AttackEvent.hitCombo = this.m_iHitCombo;
            dispatchEvent(this.m_AttackEvent);
        }

        protected function statisticsAngryVal(_arg_1:int, _arg_2:PlayerModel, _arg_3:PlayerModel, _arg_4:AttackInfo):void
        {
            var _local_5:PlayerInfo;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:int;
            var _local_6:int = _arg_4.dmgValue;
            if (_arg_2 != null){
                _local_5 = (_arg_2.getBindInfo() as PlayerInfo);
                if (_local_5){
                    if ((_arg_1 - _local_5.RTlatestComboTime) <= _local_5.RTminComboTime){
                        _local_5.RTcomboTimes = (_local_5.RTcomboTimes + 1);
                    } else {
                        _local_5.RTcomboTimes = 1;
                    };
                    _local_5.RTlatestComboTime = _arg_1;
                    _local_7 = _local_5.RTcomboTimes;
                    _local_8 = (2 + int(((((_local_7 > 100)) ? 100 : _local_7) * 0.04)));
                    _arg_2.updateAngryVal(_local_8);
                    this.m_angryEvent.attackInfo = _arg_4;
                    this.m_angryEvent.reason = "1";
                    this.m_angryEvent.updateActor = (_arg_4.attackActor as BaseActor);
                    this.m_angryEvent.updateValue = _local_8;
                    dispatchEvent(this.m_angryEvent);
                };
            };
            if (_arg_3 != null){
                _local_5 = (_arg_3.getBindInfo() as PlayerInfo);
                if (_local_5){
                    _local_9 = (_local_5.RThurtDmg + _local_6);
                    _local_10 = (_local_5.maxhp * 0.003);
                    _local_11 = int((_local_9 / _local_10));
                    if (_local_11 != 0){
                        _local_5.RThurtDmg = (_local_9 - (_local_11 * _local_10));
                        _arg_3.updateAngryVal(_local_11);
                        this.m_angryEvent.attackInfo = _arg_4;
                        this.m_angryEvent.reason = "2";
                        this.m_angryEvent.updateActor = (_arg_4.hurtActor as BaseActor);
                        this.m_angryEvent.updateValue = _local_11;
                        dispatchEvent(this.m_angryEvent);
                    } else {
                        _local_5.RThurtDmg = _local_9;
                    };
                };
            };
        }

        public function bindScene(_arg_1:IScene):void
        {
            this.m_currScene = _arg_1;
            this.m_accept = true;
            Battle.Current.tickObjectAdd(this);
        }

        public function unbind():void
        {
            Battle.Current.tickObjectRemove(this);
            this.m_accept = false;
            this.m_currScene = null;
        }

        public function newRound():void
        {
            this.m_lastTime = 0;
            this.m_iHitCombo = 0;
            this.m_iAttackID = 0;
            this.m_iAttackTime = 0;
            this.m_minComboTime = AICore.data.mainModel.careerInfo.minComboTime;
            this.m_prevComboDmg = 0;
            this.m_dmgInfo.reset();
            AttackDelegate.reset();
        }

        public function clearRound():void
        {
        }

        public function getCurrentDmgInfo():DmgInfo
        {
            return (this.m_dmgInfo);
        }

        public function inputAttack(_arg_1:AttackInfo):void
        {
            var _local_2:int;
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:PlayerModel;
            var _local_8:PlayerModel;
            if (this.m_accept){
                if (_arg_1 != null){
                    _local_2 = _arg_1.occurTime;
                    _local_3 = _arg_1.isMiss;
                    _local_4 = _arg_1.iAttack;
                    _local_5 = _arg_1.iHurt;
                    _local_6 = _arg_1.attackID;
                    if (((_local_5) || (_local_4))){
                        this.iStatistics(_local_6, _local_2, _local_3, _local_4, _local_5, _arg_1);
                    };
                    if (!_local_3){
                        _local_7 = (_arg_1.attackActorModel as PlayerModel);
                        _local_8 = (_arg_1.hurtActorModel as PlayerModel);
                        if (((!((_local_7 == null))) || (!((_local_8 == null))))){
                            this.statisticsAngryVal(_local_2, _local_7, _local_8, _arg_1);
                        };
                    };
                    this.statistics(_local_6, _local_2, _local_3, _arg_1);
                };
            };
        }

        public function inputActorDead(_arg_1:AttackInfo, _arg_2:int=0, _arg_3:int=0, _arg_4:int=1):void
        {
            var _local_5:Boolean;
            var _local_6:PlayerModel;
            var _local_7:PlayerModel;
            if (this.m_accept){
                _local_5 = false;
                if (_arg_1.iAttack){
                    this.m_dmgInfo.maxKills = (this.m_dmgInfo.maxKills + 1);
                    if (((_arg_2 - _arg_3) / _arg_4) >= 0.3){
                        this.m_dmgInfo.extraDmg_times = (this.m_dmgInfo.extraDmg_times + 1);
                        _local_5 = true;
                    };
                    if ((_arg_3 / _arg_4) > 0.6){
                        this.m_dmgInfo.seckills = (this.m_dmgInfo.seckills + 1);
                    };
                };
                _local_6 = (_arg_1.attackActorModel as PlayerModel);
                if (_local_6 != null){
                    this.m_angryEvent.attackInfo = _arg_1;
                    this.m_angryEvent.reason = "3";
                    this.m_angryEvent.updateActor = (_arg_1.attackActor as BaseActor);
                    this.m_angryEvent.updateValue = 10;
                    dispatchEvent(this.m_angryEvent);
                    _local_6.updateAngryVal(10);
                };
                _local_7 = (_arg_1.hurtActorModel as PlayerModel);
                if (_local_7 != null){
                    this.m_angryEvent.attackInfo = _arg_1;
                    this.m_angryEvent.reason = "4";
                    this.m_angryEvent.updateActor = (_arg_1.hurtActor as BaseActor);
                    this.m_angryEvent.updateValue = 300;
                    dispatchEvent(this.m_angryEvent);
                    _local_7.updateAngryVal(300);
                };
                this.m_KilledEvent.attackInfo = _arg_1;
                this.m_KilledEvent.isExtraDmg = _local_5;
                dispatchEvent(this.m_KilledEvent);
            };
        }

        public function inputActorHPUpdate(_arg_1:BaseActor, _arg_2:int=0, _arg_3:Boolean=true, _arg_4:Object=null):void
        {
            if (this.m_accept){
                this.m_hpEvent.updateActor = _arg_1;
                this.m_hpEvent.updateValue = _arg_2;
                this.m_hpEvent.flag = _arg_3;
                dispatchEvent(this.m_hpEvent);
                _arg_1.updateHP(_arg_2, _arg_4);
            };
        }

        public function inputActorMPUpdate(_arg_1:BaseActor, _arg_2:int=0, _arg_3:Boolean=true):void
        {
            if (this.m_accept){
                this.m_mpEvent.updateActor = _arg_1;
                this.m_mpEvent.updateValue = _arg_2;
                this.m_mpEvent.flag = _arg_3;
                dispatchEvent(this.m_mpEvent);
                _arg_1.updateMP(_arg_2);
            };
        }

        public function enterframe(_arg_1:int):void
        {
            if (this.m_dmgInfo.update(_arg_1)){
                dispatchEvent(this.m_DmgInfoEvent);
            };
        }

        public function getCurrentFrameIndex():int
        {
            return (0);
        }

        public /*  ©init. */ function _SafeStr_75()
        {
        }


    }
}//package com.tencent.ai.core.combat.impl

// _SafeStr_75 = " DMGMetersManager" (String#14939)


