// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.IMonsterBrain

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.monster.ai.state.IMonsterBrainState;
    import com.tencent.ai.core.data.arg.script.TimeChaseScriptArg;

    public interface IMonsterBrain 
    {

        function getCurrentScene():IScene;
        function getMonster():BaseActor;
        function getAIFindElement():AIFindElement;
        function getAIChaseElement():AIChaseElement;
        function getAIZChaseElement():AIZChaseElement;
        function getAI3DChaseElement():AI3DChaseElement;
        function getAIAvoidElement():AIAvoidElement;
        function getAI3DAvoidElement():AI3DAvoidElement;
        function getAIYMoveElement():AIYMoveElement;
        function getAIRunAwayElement():AIRunAwayElement;
        function getAIFollowElement():AIFollowElement;
        function getMonsterAIInfo():MonsterAIInfo;
        function getActionEventHanlder():ActionEventHandler;
        function getActionEventHanlder2():ActionEventHandler;
        function getAIRunChaseElement():AIRunChaseElement;
        function getMonsterCurrentState():IMonsterBrainState;
        function getMonsterSightlines():Array;
        function getYPosArray():Array;
        function getGroup():int;
        function setMonsterCurrentPosition():void;
        function getMonsterCurrentX():int;
        function getMonsterCurrentZ():int;
        function getMonsterRoamRR():int;
        function getMonsterRoamRRZ():int;
        function getMonsterRoamPZ():Number;
        function getMaster():BaseActor;
        function getRageNum():int;
        function getVigour():int;
        function setRageNum(_arg_1:int, _arg_2:int=90):void;
        function getHurtNum():int;
        function setHurtNum(_arg_1:int):void;
        function makeTimeChaseAttack(_arg_1:TimeChaseScriptArg):void;
        function setSightLineR(_arg_1:Number, _arg_2:int):void;
        function setChaseR(_arg_1:Number, _arg_2:int):void;
        function setVigour(_arg_1:int):void;
        function getAIXRunElement():AIXRunElement;

    }
}//package com.tencent.ai.core.monster.ai

