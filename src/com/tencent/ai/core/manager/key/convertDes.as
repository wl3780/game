package com.tencent.ai.core.manager.key
{
    import com.tencent.ai.core.data.SkillGroup;

    public function convertDes(skillGroup:SkillGroup, desType:int=1):String
    {
        return GameKeyManager.Current.convertDes(skillGroup, desType);
    }

}
