// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.impl.AttackDelegate

package com.tencent.ai.core.combat.impl
{
    import com.tencent.ai.core.combat.ICollisionListener;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.actor.HasActionElement;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.WeaponHurtEIDDef;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.HitArea;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.HurtShakeDef;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.enum.AttackType;
    import com.tencent.ai.core.enum.HurtType;
    import  ©init._SafeStr_73;
    import __AS3__.vec.*;

    public class AttackDelegate implements ICollisionListener, IAttackDelegate 
    {

        private static var _DMGC:DMGCalculator = DMGCalculator.getInstance();
        private static var _DMGMETERS:IDmgMetersManager;
        private static var _ATTACK_ID:int = 0;

        protected var m_skillInfo:SkillInfo;
        protected var m_hitScriptFunc:CFunction;
        protected var m_currentAim:HasActionElement;
        protected var m_catchValue:int;
        protected var m_aims:Dictionary;
        protected var m_cacthAims:Vector.<HasActionElement>;
        protected var m_effectInfo:EffectInfo;
        protected var m_weaponHurtEID:WeaponHurtEIDDef;
        protected var m_attackInfo:AttackInfo;
        protected var m_dropAttackInfo:AttackInfo;
        protected var m_hitArea:HitArea;
        protected var m_collisionFunc:CFunction;
        protected var m_combatScene:IScene;
        protected var m_isFreez:Boolean;
        protected var m_screenShake:ShakeScriptArg;
        protected var m_target:InteractElement;
        protected var m_model:ActorModel;
        protected var m_hurtFixDir:int;

        public function AttackDelegate()
        {
            this.initThis();
        }

        public static function reset():void
        {
            _ATTACK_ID = 0;
        }


        protected function initThis():void
        {
            this.m_attackInfo = AttackInfo.newInstance(true);
            this.m_hitArea = new HitArea();
            this.m_collisionFunc = new CFunction(null, null, [this.m_hitArea, this]);
            this.m_aims = new Dictionary(true);
            this.m_effectInfo = new EffectInfo();
            this.m_cacthAims = new Vector.<HasActionElement>();
            this.m_catchValue = 0;
            this.m_hurtFixDir = SkillInfo.HURT_DIR_AUTO;
        }

        public function setAttackInfo(_arg_1:AttackInfo):void
        {
            this.m_attackInfo = _arg_1;
            this.m_skillInfo = _arg_1.skillInfo;
        }

        public function getAttackInfo():AttackInfo
        {
            return (this.m_attackInfo);
        }

        public function useCacheSkillInfo(_arg_1:SkillInfo):void
        {
            if (_arg_1 != null){
                this.setSkillInfo(_arg_1);
            };
        }

        public function bindTarget(_arg_1:InteractElement, _arg_2:ActorModel=null):void
        {
            this.m_target = _arg_1;
            this.m_model = _arg_2;
            if (this.m_attackInfo.attackActor == null){
                this.m_attackInfo.attackActor = _arg_1;
            };
            if (this.m_attackInfo.attackActorModel == null){
                this.m_attackInfo.attackActorModel = _arg_2;
            };
        }

        public function unbind():void
        {
            this.m_target = null;
            this.m_model = null;
            this.m_attackInfo.attackActor = null;
            this.m_attackInfo.attackActorModel = null;
            this.m_attackInfo.skillInfo = null;
            this.m_skillInfo = null;
            this.m_collisionFunc.target = null;
            this.m_collisionFunc.handler = null;
        }

        public function bindScene(_arg_1:IScene):void
        {
            if (_arg_1 != null){
                this.m_combatScene = _arg_1;
                this.m_collisionFunc.target = _arg_1;
            } else {
                this.m_collisionFunc.target = null;
                this.m_collisionFunc.handler = null;
            };
        }

        public function inactive():void
        {
            this.m_collisionFunc.handler = null;
            this.m_attackInfo.skillInfo = null;
            this.clearAims();
            this.clearCatchAims(true);
            this.m_skillInfo = null;
        }

        public function attackElement(_arg_1:InteractElement, _arg_2:MapPosition, _arg_3:int):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            this.m_attackInfo.dir = _arg_3;
            this.m_attackInfo.isAirHurt = (_arg_1.mapY > 0);
            this.m_attackInfo.hitPoint = _arg_2;
            this.m_attackInfo.iHurt = false;
            this.m_attackInfo.hurtET = "";
            this.m_attackInfo.hurtID = 0;
            this.m_attackInfo.hurtActorModel = null;
            this.m_attackInfo.hurtActor = null;
            _DMGC.dmg(this.m_attackInfo, (((_arg_1 is BaseActor)) ? BaseActor(_arg_1).getModel() : null));
            if (!this.m_attackInfo.isMiss){
                this.m_target.attackProcess(this.m_attackInfo, _arg_1);
                this.m_effectInfo.location = _arg_2;
                this.m_effectInfo.direction = (_arg_3 * -1);
                if (this.m_effectInfo.eid != 0){
                    this.m_combatScene.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
                };
                if (this.m_weaponHurtEID != null){
                    if (this.m_attackInfo.isCRI){
                        this.m_effectInfo.eid = this.m_weaponHurtEID.criEID;
                    } else {
                        if (this.m_attackInfo.isBreakSkill){
                            this.m_effectInfo.eid = this.m_weaponHurtEID.breakEID;
                        } else {
                            if (this.m_attackInfo.isBackHurt){
                                this.m_effectInfo.eid = this.m_weaponHurtEID.backEID;
                            } else {
                                this.m_effectInfo.eid = this.m_weaponHurtEID.normalEID;
                            };
                        };
                    };
                    if (this.m_effectInfo.eid != 0){
                        this.m_effectInfo.location.deepOffset = (this.m_effectInfo.location.deepOffset + 1);
                        this.m_combatScene.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
                    };
                };
                if (this.m_screenShake != null){
                    this.m_combatScene.getCamera().shake(this.m_screenShake.shakeDir, this.m_screenShake.shakeTimes, this.m_screenShake.shakeR);
                    this.m_screenShake = null;
                };
                if (_arg_1.beHurt(this.m_attackInfo)){
                    if (!this.m_isFreez){
                        _local_4 = this.m_attackInfo.skillInfo.freezTimes;
                        if (_local_4 != 0){
                            this.m_target.freeze(_local_4);
                        };
                        this.m_isFreez = true;
                    };
                    this.m_currentAim = (_arg_1 as HasActionElement);
                    if (this.m_hitScriptFunc != null){
                        return (this.m_hitScriptFunc.call(this.m_currentAim));
                    };
                };
            } else {
                if (this.m_weaponHurtEID != null){
                    _local_5 = this.m_weaponHurtEID.missEID;
                    if (_local_5 != 0){
                        this.m_effectInfo.location = _arg_2;
                        this.m_effectInfo.direction = (_arg_3 * -1);
                        this.m_effectInfo.eid = _local_5;
                        this.m_effectInfo.location.deepOffset = (this.m_effectInfo.location.deepOffset + 1);
                        this.m_combatScene.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
                    };
                };
                if (_DMGMETERS == null){
                    _DMGMETERS = AICore.combatSystem.getDmgMeters();
                };
                _DMGMETERS.inputAttack(this.m_attackInfo);
            };
            return (false);
        }

        public function setSkillInfo(_arg_1:SkillInfo):void
        {
            this.m_skillInfo = _arg_1;
        }

        public function onCollision(_arg_1:InteractElement, _arg_2:HitArea, _arg_3:int):Boolean
        {
            if (!this.m_aims[_arg_1]){
                this.m_aims[_arg_1] = true;
                return (this.attackElement(_arg_1, _arg_2.hitLocation, _arg_3));
            };
            return (false);
        }

        public function updateAttackInfo():void
        {
            var _local_1:int;
            var _local_2:Boolean;
            this.m_weaponHurtEID = null;
            if (this.m_model != null){
                if (this.m_skillInfo.wheBool){
                    this.m_weaponHurtEID = WeaponHurtEIDDef.EIDS[this.m_model.weapon_hurt_eid];
                    this.m_weaponHurtEID = (((this.m_weaponHurtEID == null)) ? WeaponHurtEIDDef.EIDS[0] : this.m_weaponHurtEID);
                };
                _local_1 = this.m_model.weapon_hurt_type;
                _local_2 = this.m_model.isMain;
            };
            this.m_effectInfo.eid = this.m_skillInfo.hurt_eid;
            var _local_3:int = this.m_skillInfo.hurtType;
            _local_3 = (((_local_3 == 0)) ? _local_1 : _local_3);
            this.m_hurtFixDir = this.m_skillInfo.hurt_fixDir;
            this.m_attackInfo.iAttack = _local_2;
            this.m_attackInfo.skillInfo = this.m_skillInfo;
            this.m_attackInfo.attackType = this.m_skillInfo.attackType;
            this.m_attackInfo.hurtType = _local_3;
            this.m_attackInfo.hurtColorValue = this.m_skillInfo.hurt_color;
            this.m_attackInfo.occurTime = (Battle.Current.getCurrentFrameIndex() * DEFINE.TPF);
        }

        public function collisionNow(_arg_1:int=-1, _arg_2:RectArea=null, _arg_3:InteractElement=null, _arg_4:int=0):void
        {
            this.updateAttackInfo();
            if ((((_arg_4 == 0)) && (!((this.m_hurtFixDir == SkillInfo.HURT_DIR_AUTO))))){
                _arg_4 = (this.m_target.getDirection() * (((this.m_hurtFixDir == SkillInfo.HURT_DIR_OPPO)) ? -1 : 1));
            };
            this.m_hitArea.visit((((_arg_3)!=null) ? _arg_3 : this.m_target), _arg_1, _arg_2, _arg_4);
            this.m_collisionFunc.handler = Battle.Current.everyCollision;
            Battle.Current.execBehindFrame(this.m_collisionFunc);
            this.m_isFreez = false;
            this.m_screenShake = HurtShakeDef.SHAKE_ARGS[this.m_skillInfo.hurt_shake];
        }

        public function addCatchAim(_arg_1:HasActionElement):void
        {
            if (this.m_cacthAims.indexOf(_arg_1) == -1){
                _arg_1.isCaught = true;
                this.m_cacthAims.push(_arg_1);
            };
        }

        public function addAttackAims(_arg_1:Vector.<HasActionElement>):void
        {
            var _local_2:int = (_arg_1.length - 1);
            while (_local_2 >= 0) {
                this.m_aims[_arg_1[_local_2]] = true;
                _local_2--;
            };
        }

        public function clearAims():void
        {
            var _local_1:Object;
            _ATTACK_ID++;
            this.m_currentAim = null;
            var _local_2:int;
            var _local_3:* = this.m_aims;
            for (_local_1 in this.m_aims) {
                delete this.m_aims[_local_1];
            };
            this.m_attackInfo.attackID = _ATTACK_ID;
        }

        public function clearCatchAims(_arg_1:Boolean=false):void
        {
            var _local_2:int;
            var _local_3:MapPosition;
            var _local_4:SkillInfo;
            var _local_5:HasActionElement;
            if (_arg_1){
                _local_2 = (this.m_cacthAims.length - 1);
                if (_local_2 >= 0){
                    if (this.m_dropAttackInfo == null){
                        _local_4 = new SkillInfo();
                        this.m_dropAttackInfo = AttackInfo.newInstance();
                        this.m_dropAttackInfo.attackActor = this.m_target;
                        this.m_dropAttackInfo.attackType = AttackType.ATTACK_THROW;
                        this.m_dropAttackInfo.skillInfo = _local_4;
                        _local_4.powerX = 0;
                        _local_4.powerX2 = 0;
                        _local_4.powerY = 500;
                        _local_4.powerY2 = 500;
                    };
                    this.m_dropAttackInfo.hurtType = HurtType.HURT_FAKE;
                    this.m_dropAttackInfo.dir = (this.m_target.getDirection() * -1);
                    _local_3 = this.m_target.getMapPosition();
                    while (_local_2 >= 0) {
                        _local_5 = this.m_cacthAims[_local_2];
                        _local_3.y = _local_5.mapY;
                        _local_5.setMapPosition(_local_3);
                        _local_5.isCaught = false;
                        _local_5.beHurt(this.m_dropAttackInfo);
                        _local_2--;
                    };
                };
            } else {
                _local_2 = (this.m_cacthAims.length - 1);
                while (_local_2 >= 0) {
                    this.m_cacthAims[_local_2].isCaught = false;
                    _local_2--;
                };
            };
            this.m_cacthAims.length = 0;
            this.m_catchValue = 0;
        }

        public function get skillInfo():SkillInfo
        {
            return (this.m_skillInfo);
        }

        public function set hitScriptFunc(_arg_1:CFunction):void
        {
            this.m_hitScriptFunc = _arg_1;
        }

        public function get currentAim():HasActionElement
        {
            return (this.m_currentAim);
        }

        public function set catchValue(_arg_1:int):void
        {
            this.m_catchValue = _arg_1;
        }

        public function get catchValue():int
        {
            return (this.m_catchValue);
        }

        public function get cacthAims():Vector.<HasActionElement>
        {
            return (this.m_cacthAims);
        }

        public /*  ©init. */ function _SafeStr_73()
        {
        }


    }
}//package com.tencent.ai.core.combat.impl

// _SafeStr_73 = " AttackDelegate" (String#17633)


