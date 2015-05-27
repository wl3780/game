// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.SkillHurtScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.data.arg.script.SkillHurtArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.MapPosition;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1229;

    public class SkillHurtScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;
        protected var m_attackDelegate:IAttackDelegate;


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
            var _local_9:HasActionElement;
            var _local_3:SkillHurtArg = (_arg_2 as SkillHurtArg);
            var _local_4:BaseElement = (this.m_target.target as BaseElement);
            var _local_5:MapPosition = _local_4.getMapPosition();
            _local_5.x = (_local_5.x + (_local_3.offsetX * _local_4.getDirection()));
            _local_5.y = (_local_5.y + _local_3.offsetY);
            _local_5.z = (_local_5.z + _local_3.offsetZ);
            var _local_6:Vector.<HasActionElement> = this.m_attackDelegate.cacthAims;
            var _local_7:int = _local_6.length;
            this.m_attackDelegate.updateAttackInfo();
            var _local_8:int;
            while (_local_8 < _local_7) {
                _local_9 = _local_6[_local_8];
                this.m_attackDelegate.attackElement(_local_9, _local_5, _local_9.getDirection());
                _local_8++;
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_SKILL_HURT);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1229()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1229 = " SkillHurtScript" (String#14921)


