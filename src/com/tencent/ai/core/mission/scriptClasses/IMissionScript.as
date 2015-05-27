// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.scriptClasses.IMissionScript

package com.tencent.ai.core.mission.scriptClasses
{
    import com.tencent.ai.core.mission.MissionInfo;

    public interface IMissionScript 
    {

        function init(_arg_1:MissionInfo):void;
        function run():void;
        function destroy():void;

    }
}//package com.tencent.ai.core.mission.scriptClasses

