// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.unit.IAIUnit

package com.tencent.ai.core.monster.ai.unit
{
    import com.tencent.ai.core.data.MonsterAISkillParam;

    public interface IAIUnit 
    {

        function run():void;
        function onTick():void;
        function breakUnit():void;
        function canBreak():Boolean;
        function setProbabilityRange(_arg_1:Number, _arg_2:Number):void;
        function isProbability(_arg_1:Number):Boolean;
        function getUnitType():int;
        function reset():void;
        function addAISkillParam(_arg_1:MonsterAISkillParam):void;

    }
}//package com.tencent.ai.core.monster.ai.unit

