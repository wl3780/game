// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.IMissionManager

package com.tencent.ai.core.mission
{
    import flash.events.IEventDispatcher;

    public interface IMissionManager extends IEventDispatcher 
    {

        function initialize():void;
        function acceptMission(_arg_1:int, _arg_2:int):void;
        function commitMission(_arg_1:int, _arg_2:int=0):void;
        function checkMissionAcceptable(_arg_1:int):Boolean;
        function checkMissionCommitable(_arg_1:int, _arg_2:int):Boolean;
        function setConditionFlag(_arg_1:uint, _arg_2:int, _arg_3:Boolean):void;
        function refreshXMission():void;
        function removeXMission(_arg_1:int):void;
        function getMission(_arg_1:uint):MissionInfo;
        function get specialFlag():uint;

    }
}//package com.tencent.ai.core.mission

