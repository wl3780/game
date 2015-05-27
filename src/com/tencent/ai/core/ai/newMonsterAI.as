// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.ai.newMonsterAI

package com.tencent.ai.core.ai
{
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.monster.BaseMonster;

    public function newMonsterAI(_arg_1:MonsterInfo, _arg_2:BaseMonster):BaseAIComponent
    {
        var _local_4:MonsterAIInfo;
        var _local_5:BaseActor;
        var _local_6:int;
        var _local_3:BaseAIComponent;
        if (_arg_1.activateAI){
            _local_4 = _arg_1.aiInfo;
            _local_5 = (_arg_1.masterElement as BaseActor);
            if (_local_4 != null){
                _local_6 = (((_local_5 == null)) ? (MonsterEnum.AI_TYPE_SIMPLE) : MonsterEnum.AI_TYPE_APC);
                _local_3 = GameAIFactory.createInstance(_local_6);
                _local_3.setCurrentLifeTime(_arg_1.currentLifeTime);
                _local_3.setAIInfo(_local_4);
                _arg_2.setMaster(_local_5);
                _arg_2.setAIComponent(_local_3);
                _local_3.stateIn(_local_5);
            };
        } else {
            _arg_2.setAIComponent(null);
        };
        return (_local_3);
    }

}//package com.tencent.ai.core.ai

