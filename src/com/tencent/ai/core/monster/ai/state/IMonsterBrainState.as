// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.state.IMonsterBrainState

package com.tencent.ai.core.monster.ai.state
{
    import com.tencent.ai.core.data.MonsterAIInfo;

    public interface IMonsterBrainState 
    {

        function setAIInfo(_arg_1:MonsterAIInfo):void;
        function reset():void;
        function stateIn():void;
        function stateOut():void;
        function onThinking(_arg_1:int):int;
        function getStateType():int;
        function getGroup():int;
        function setGroup(_arg_1:int):void;

    }
}//package com.tencent.ai.core.monster.ai.state

