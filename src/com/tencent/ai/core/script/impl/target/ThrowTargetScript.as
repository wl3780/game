// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.ThrowTargetScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.combat.impl.DMGCalculator;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.arg.script.ThrowArg;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.AttackType;
    import com.tencent.ai.core.enum.HurtType;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.actor.BaseActor;
    import  ©init._SafeStr_1249;

    public class ThrowTargetScript implements IScript 
    {

        private static var _DMGC:DMGCalculator = DMGCalculator.getInstance();

        protected var m_target:ITargetHasSkill;
        protected var m_attackDelegate:IAttackDelegate;
        protected var m_attackInfo:AttackInfo;
        protected var m_skillInfo:SkillInfo;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
            this.m_attackDelegate = this.m_target.getAttackDelegate();
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:ThrowArg;
            var _local_16:HasActionElement;
            this.m_target.onScript(ScriptCmdDef.SC_CHANGE_TARGET, null);
            var _local_3:Vector.<HasActionElement> = this.m_attackDelegate.cacthAims;
            if ((((_local_3 == null)) || ((_local_3.length == 0)))){
                return;
            };
            _local_4 = (_arg_2 as ThrowArg);
            var _local_5:int = _local_3.length;
            var _local_6:SkillInfo = this.m_attackDelegate.skillInfo;
            var _local_7:HasActionElement = this.m_target.target;
            if (this.m_attackInfo == null){
                this.m_attackInfo = AttackInfo.newInstance();
                this.m_attackInfo.attackActor = _local_7;
                this.m_attackInfo.attackActorModel = this.m_target.model;
                this.m_attackInfo.attackType = AttackType.ATTACK_THROW;
                this.m_skillInfo = new SkillInfo();
                this.m_attackInfo.skillInfo = this.m_skillInfo;
            };
            var _local_8:int = _local_4.vx;
            var _local_9:int = _local_4.vy;
            this.m_skillInfo.powerX = _local_8;
            this.m_skillInfo.powerX2 = _local_8;
            this.m_skillInfo.powerY = _local_9;
            this.m_skillInfo.powerY2 = _local_9;
            this.m_skillInfo.id = _local_6.id;
            this.m_skillInfo.index = _local_6.index;
            this.m_skillInfo.dmg_rate = _local_6.dmg_rate;
            this.m_skillInfo.dmg_value = _local_6.dmg_value;
            if (_local_4.deliver){
                _local_4.bindGoupID = _local_7.groupID;
                _local_4.bindSkill = _local_6;
                _local_4.bindAttackActor = _local_7;
                _local_4.bindModel = this.m_target.model;
            };
            var _local_10:int = _local_7.getDirection();
            this.m_attackInfo.scriptArg = _local_4;
            this.m_attackInfo.dir = ((_local_4.dirValue * _local_10) * -1);
            this.m_attackInfo.hurtType = HurtType.HURT_FAKE;
            var _local_11:MapPosition = _local_7.getMapPosition();
            _local_11.y = (_local_11.y + _local_4.offsetY);
            var _local_12:int = (_local_11.x + (_local_4.offsetX * _local_10));
            var _local_13:int = (_local_11.z + _local_4.offsetZ);
            if (this.m_target.scene.isWalkable(_local_12, _local_13)){
                _local_11.x = _local_12;
                _local_11.z = _local_13;
            };
            var _local_14:Boolean = _local_4.useLandDmg;
            var _local_15:int;
            while (_local_15 < _local_5) {
                _local_16 = _local_3[_local_15];
                _local_16.setMapPosition(_local_11);
                if (_local_14){
                    _DMGC.dmg(this.m_attackInfo, (((_local_16 is BaseActor)) ? BaseActor(_local_16).getModel() : null), true);
                };
                _local_16.beHurt(this.m_attackInfo);
                _local_15++;
            };
            this.m_attackDelegate.clearCatchAims();
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_THROW_TARGET);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1249()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1249 = " ThrowTargetScript" (String#17576)


