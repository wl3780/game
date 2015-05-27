// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetSkillScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.arg.script.TargetSkillArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1245;

    public class TargetSkillScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:SkillInfo;
            var _local_3:TargetSkillArg = TargetSkillArg(_arg_2);
            var _local_4:int = _local_3.opType;
            if (_local_4 == 0){
                _local_5 = this.m_target.getSkillModel().group.skillInfos[_local_3.data];
                this.m_target.target.RT_cache_data["cacheSkillInfo"] = _local_5;
            } else {
                if (_local_4 == -1){
                    delete this.m_target.target.RT_cache_data["cacheSkillInfo"];
                } else {
                    if (_local_4 == 1){
                        _local_5 = this.m_target.target.RT_cache_data["cacheSkillInfo"];
                        if (_local_3.data == 1){
                            delete this.m_target.target.RT_cache_data["cacheSkillInfo"];
                        };
                        this.m_target.getAttackDelegate().useCacheSkillInfo(_local_5);
                    };
                };
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_SKILL);
        }

        public /*  ©init. */ function _SafeStr_1245()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1245 = " TargetSkillScript" (String#13715)


